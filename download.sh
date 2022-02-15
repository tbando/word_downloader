#!/usr/bin/env bash
#set -euo pipefail
#set -x

WORD_LIST="list.txt"
URI_BASE="https://dictionary.cambridge.org"
DIR="./download"

while read line
do
	echo "$line"
	MP3_PATH=$(curl -s "https://dictionary.cambridge.org/dictionary/english/${line}" | grep -o -e '[^"]*us_pron.*mp3[^"]*' | head -n1)
	if [[ "${MP3_PATH}" != "" ]]
	then
	  wget "${URI_BASE}${MP3_PATH}" -O "${DIR}/${line}.mp3"
	fi
done < "${WORD_LIST}"
