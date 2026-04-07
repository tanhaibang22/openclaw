#!/bin/bash

# Auto-commit script for OpenClaw workspace
# This script checks for changes and automatically commits them

set -e

WORKSPACE_DIR="/home/tanhaibang/.openclaw/workspace"
LOG_FILE="$WORKSPACE_DIR/memory/git-auto-commit.log"
MAX_LOG_SIZE=1048576 # 1MB

# Create log directory if it doesn't exist
mkdir -p "$(dirname "$LOG_FILE")"

# Rotate log if too large
if [ -f "$LOG_FILE" ] && [ $(stat -c%s "$LOG_FILE") -gt $MAX_LOG_SIZE ]; then
    mv "$LOG_FILE" "$LOG_FILE.old"
fi

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

cd "$WORKSPACE_DIR"

# Check if there are any changes
if git status --porcelain | grep -q .; then
    log "Changes detected, preparing commit..."
    
    # Add all changes
    git add .
    
    # Get list of changed files
    CHANGED_FILES=$(git status --porcelain | awk '{print $2}' | tr '\n' ', ')
    
    # Create commit message
    COMMIT_MSG="Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')
    
Changed files: $CHANGED_FILES
    
Auto-commit triggered by OpenClaw assistant."
    
    # Commit
    if git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1; then
        log "Commit successful: $(git log --oneline -1)"
        
        # Try to push
        if git push >> "$LOG_FILE" 2>&1; then
            log "Push successful to origin/main"
        else
            log "Push failed, will retry next time"
        fi
    else
        log "Commit failed (might be empty commit or merge conflict)"
    fi
else
    log "No changes detected"
fi