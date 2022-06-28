#!/bin/bash
while read url
do
    urlstatus=$(curl -o /dev/null --silent --head --write-out '%{http_code}' "$url" )
    CONTENT="<site>\n<status>$urlstatus</status>\n<url>$url</url>\n<Description>$urlstatus</Description>\n</site>"
    #echo "$url  $urlstatus" >> urlstatus.txt
    C=$(echo $CONTENT | sed 's/\//\\\//g')
sed "/<\/Websites>/ s/.*/${C}\n&/" file >> file2
    done < $1
