#!/bin/bash
#wget --load-cookies=cookie --keep-session-cookies  http://joy4girl.com/wp-content/games/custom/P/princess-ariel-shoes-design.swf -cS 
#wget -i ${URLS} --load-cookies=cookie --keep-session-cookies  
echo "./$@ downloadurls.txt"
echo "Get the cookie, save to ./cookie"
wget -q --save-cookies=cookie --keep-session-cookies http://joy4girl.com/ >/dev/null
rm index.html*
OUTPUT_SWF=./output_swf
OUTPUT_JPG=./output_jpg
OUTPUT_OTHER=./output_other

mkdir -p ${OUTPUT_SWF}
mkdir -p ${OUTPUT_JPG}
mkdir -p  ${OUTPUT_OTHER}

URLS=$1
echo "Start to download files from ${URLS}"
while read line
do
    echo "Downloading ${line}"

    if [[ ${line} == *.jpg ]];then
        echo "Downloading jpg to ${OUTPUT_JPG} ..."
        cd ${OUTPUT_JPG}
        wget -q --load-cookies=../cookie --keep-session-cookies ${line} >/dev/null
        cd ..
    elif [[ ${line} == *.swf ]];then
        echo "Downloading swf to ${OUTPUT_SWF} ..."
        cd ${OUTPUT_SWF}
        wget  --load-cookies=../cookie --keep-session-cookies ${line}
        cd ..
    else
        echo "Downloading other to ${OUTPUT_OTHER} ..."
        cd ${OUTPUT_OTHER}
        wget -q --load-cookies=../cookie --keep-session-cookies ${line} >/dev/null
        cd ..
    fi
done<${URLS}
