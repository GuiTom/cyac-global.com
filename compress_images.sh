#!/bin/bash

# 图片压缩脚本
# 扫描public目录下的图片，如果超过1MB则压缩
# 压缩规则：宽度不超过1080px，等比缩放，压缩后不超过800KB

echo "开始扫描public目录下的图片文件..."

# 检查ImageMagick是否安装
if ! command -v magick &> /dev/null; then
    echo "错误: ImageMagick未安装，请先安装ImageMagick"
    echo "安装命令: brew install imagemagick"
    exit 1
fi

# 设置目录路径
PUBLIC_DIR="./public"
BACKUP_DIR="./public_backup"

# 创建备份目录
if [ ! -d "$BACKUP_DIR" ]; then
    echo "创建备份目录: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

# 计数器
processed_count=0
compressed_count=0

# 查找所有图片文件
find "$PUBLIC_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" \) | while read -r image_file; do
    # 获取文件大小（字节）
    file_size=$(stat -f%z "$image_file" 2>/dev/null || stat -c%s "$image_file" 2>/dev/null)
    
    # 1MB = 1048576 bytes
    if [ "$file_size" -gt 1048576 ]; then
        echo "发现大文件: $image_file ($(echo "scale=2; $file_size/1048576" | bc)MB)"
        
        # 创建备份
        backup_path="$BACKUP_DIR/$(basename "$image_file")_$(date +%Y%m%d_%H%M%S)"
        cp "$image_file" "$backup_path"
        echo "已备份到: $backup_path"
        
        # 获取原始图片尺寸
        original_width=$(magick identify -format "%w" "$image_file")
        original_height=$(magick identify -format "%h" "$image_file")
        echo "原始尺寸: ${original_width}x${original_height}"
        
        # 计算新尺寸（如果宽度超过1080px）
        if [ "$original_width" -gt 1080 ]; then
            new_width=1080
            new_height=$(echo "scale=0; $original_height * 1080 / $original_width" | bc)
            resize_option="${new_width}x${new_height}"
        else
            resize_option="${original_width}x${original_height}"
        fi
        
        echo "目标尺寸: $resize_option"
        
        # 压缩图片
        temp_file="${image_file}.tmp"
        
        # 使用ImageMagick压缩
        # -resize: 调整尺寸
        # -quality: JPEG质量 (85%是一个好的平衡点)
        # -strip: 移除元数据
        # -interlace Plane: 渐进式JPEG
        magick "$image_file" \
            -resize "$resize_option>" \
            -quality 85 \
            -strip \
            -interlace Plane \
            "$temp_file"
        
        if [ $? -eq 0 ]; then
            # 检查压缩后的文件大小
            new_file_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
            
            # 800KB = 819200 bytes
            if [ "$new_file_size" -gt 819200 ]; then
                echo "文件仍然过大，进一步压缩..."
                # 降低质量到70%
                magick "$image_file" \
                    -resize "$resize_option>" \
                    -quality 70 \
                    -strip \
                    -interlace Plane \
                    "$temp_file"
                
                new_file_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                
                # 如果还是过大，再次降低质量到60%
                if [ "$new_file_size" -gt 819200 ]; then
                    echo "继续压缩..."
                    magick "$image_file" \
                        -resize "$resize_option>" \
                        -quality 60 \
                        -strip \
                        -interlace Plane \
                        "$temp_file"
                    
                    new_file_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                fi
            fi
            
            # 替换原文件
            mv "$temp_file" "$image_file"
            
            echo "压缩完成: $(echo "scale=2; $file_size/1048576" | bc)MB -> $(echo "scale=2; $new_file_size/1048576" | bc)MB"
            echo "压缩率: $(echo "scale=1; (1-$new_file_size/$file_size)*100" | bc)%"
            
            compressed_count=$((compressed_count + 1))
        else
            echo "压缩失败: $image_file"
            rm -f "$temp_file"
        fi
        
        echo "----------------------------------------"
    else
        echo "文件大小正常: $image_file ($(echo "scale=2; $file_size/1048576" | bc)MB)"
    fi
    
    processed_count=$((processed_count + 1))
done

echo "扫描完成！"
echo "处理文件总数: $processed_count"
echo "压缩文件数量: $compressed_count"
echo "备份目录: $BACKUP_DIR"

# 显示public目录的总大小
echo "当前public目录大小:"
du -sh "$PUBLIC_DIR"