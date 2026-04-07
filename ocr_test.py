#!/usr/bin/env python3
import sys
import os
from PIL import Image
import pytesseract

# 检查文件是否存在
image_path = sys.argv[1] if len(sys.argv) > 1 else None
if not image_path or not os.path.exists(image_path):
    print("请提供有效的图片路径")
    sys.exit(1)

try:
    # 打开图片
    img = Image.open(image_path)
    
    # 尝试识别中文
    print("正在识别图片中的文字...")
    text = pytesseract.image_to_string(img, lang='chi_sim')
    
    if text.strip():
        print("识别到的文字内容：")
        print("=" * 50)
        print(text)
        print("=" * 50)
    else:
        print("未识别到文字")
        
except Exception as e:
    print(f"识别过程中出现错误: {e}")
    print("尝试安装pytesseract: pip install pytesseract")
    print("安装tesseract-ocr: sudo apt-get install tesseract-ocr tesseract-ocr-chi-sim")