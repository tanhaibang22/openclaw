# OpenClaw Workspace

This is the personal workspace for Tan Haibang's OpenClaw AI assistant.

## Overview

This repository contains the configuration, skills, and memory files for an OpenClaw AI assistant instance.

## Contents

### Core Configuration
- `AGENTS.md` - Workspace guidelines and behavior rules
- `SOUL.md` - Assistant personality and core truths
- `USER.md` - User profile and context
- `IDENTITY.md` - Assistant identity definition
- `TOOLS.md` - Local tool notes and configurations
- `HEARTBEAT.md` - Periodic check tasks
- `BOOTSTRAP.md` - Initial setup instructions (to be deleted after first run)

### Custom Skills
- `skills/image-recognition/` - Image recognition skill with OCR and object detection
- `skills/ocr-local/` - Local OCR using Tesseract.js (no API key required)
- `skills/tradingview-quantitative-skills/` - Professional quantitative investment analysis system

### Test Files
- `ocr_test.py` - Test script for OCR functionality

## Git Configuration

- **Remote**: `git@github.com:tanhaibang22/openclaw.git`
- **Branch**: `main`
- **Initial Commit**: `e4d3777` - Initial commit: OpenClaw workspace configuration

## Usage

This workspace is managed by OpenClaw AI assistant. The assistant will:
- Periodically commit changes
- Maintain memory files in `memory/` directory
- Update configuration as needed
- Manage skills and tools

## Notes

- `node_modules/` is excluded via `.gitignore`
- Memory files are stored locally and may contain personal context
- Skills can be updated via ClawHub or manual installation