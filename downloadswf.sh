#!/bin/sh
#wget --load-cookies=cookie --keep-session-cookies  http://joy4girl.com/wp-content/games/custom/P/princess-ariel-shoes-design.swf -cS 
#wget -i ${URLS} --load-cookies=cookie --keep-session-cookies  
echo "./$@ downloadurls.txt"
echo "Get the cookie, save to ./cookie"
wget -q --save-cookies=cookie --keep-session-cookies http://joy4girl.com/ >/dev/null
rm index.html*
OUTPUT=./output

mkdir -p ${OUTPUT}

URLS=$1
echo "Start to download files from ${URLS}"
while read line
do
    echo "Downloading ${line}"
    wget -q --load-cookies=cookie --keep-session-cookies ${line} >/dev/null
    mv *.swf* ${OUTPUT}
done<${URLS}
