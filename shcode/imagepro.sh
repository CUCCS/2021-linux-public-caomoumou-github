#!/usr/bin/env bash

function help(){
    # cat << END_EOF
    echo "Function: A picture batch processing script. "
    echo "-q,--quality         The function is to change the quality of image"
    echo "-r,--resize          For JPEG / PNG / SVG images, the resolution is compressed while maintaining the original aspect ratio"
    echo "-m string            Add a custom text watermark to the image"
    echo "-p string            Add file name prefix uniformly"
    echo "-s string            Add file name suffix uniformly"
    echo "-c                   change image type"
    echo "-h                   help file"
    # END_EOF
}

# 对图像进行压缩
function JPEGCompressed {
    for i in *;do
        if [[ ${i##*.} == "jpeg" || ${i##*.} == "JPEG" ]];then    #  %从右到左，#从左到右，%第一个string，##最后一个string
            convert -quality 90% "${i}" "new""${i}"
            echo "quality compress finish"
        fi
    done
}

#对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
function resizeimage {
    for i in *;do
        if [[ ${i##*.} == "jpeg" || ${i##*.} == "png" || ${i##*.} == "svg" || ${i##*.} == "JPEG" ]]; then
            convert -resize 50% "${i}" "${i}"
            echo "resize image finish"
        fi
    done
}

# 对图片批量添加自定义文本水印
function AddWatermark {
    for i in *;do
        if [[ ${i##*.} == "jpeg" || ${i##*.} == "png" || ${i##*.} == "svg" || ${i##*.} == "JPEG" || ${i##*.} == "jpg" || ${i##*.} == "JPG" ]]; then
            convert "${i}" -pointsize 30 -fill red -strokewidth 2 -stroke blue -gravity center -draw "text 10,15 '$1'" "${i}"
            echo "add watermark finish"
        fi;
    done
}

# 批量重命名：统一添加文件名前缀，不影响原始文件扩展名
function Addprefix {
    for i in *;do
        if [[ ${i##*.} == "jpeg" || ${i##*.} == "png" || ${i##*.} == "svg" || ${i##*.} == "JPEG" || ${i##*.} == "jpg" || ${i##*.} == "JPG" ]]; then
            mv "${i}" "$1""${i}"
            echo "add prefix finish"
        fi;
    done
}

# 批量重命名：统一添加文件名后缀，不影响原始文件扩展名
function Addsuffix  {
    for i in *;do
        if [[ ${i##*.} == "jpeg" || ${i##*.} == "png" || ${i##*.} == "svg" || ${i##*.} == "JPEG" || ${i##*.} == "jpg" || ${i##*.} == "JPG" ]]; then
            addsuffix=${i%.*}$1"."${i##*.}    
            mv "${i}" "${addsuffix}"
            echo "add prefix finish"
        fi;
    done
}

# 将png/svg图片统一转换为jpg格式图片
function changetype {
    for i in *;do
        if [[ ${i##*.} == "png" || ${i##*.} == "svg" || ${i##*.} == "PNG" ]]; then
            nametype=${i%.*}".jpg"
            convert "${i}" "${nametype}"
   	        echo "change type finish"
        fi
    done
}

# 主体
while true;do
    case "$1" in
        -q|--quality)
            JPEGCompressed
            exit 0
            ;;
        -r|--resize)
            resizeimage
            exit 0
            ;;
        -m )
            AddWatermark "$2"
            exit 0
            ;;
        -p)
            Addprefix "$2"
            exit 0
            ;;
        -s)
            Addsuffix "$2"
            exit 0
            ;;
        -t)
            changetype
            exit 0
            ;;
        -h)
            Help
            exit 0
        ;;
    esac
done