#!/bin/bash

speedtest --server=1781 > /tmp/speedtest.txt

upload=$(grep -P "Upload" /tmp/speedtest.txt | awk '{ print $2 }')
uploadType=$(grep -P "Upload" /tmp/speedtest.txt | awk '{ print $3 }')
download=$(grep -P "Download" /tmp/speedtest.txt | awk '{ print $2 }')
downloadType=$(grep -P "Download" /tmp/speedtest.txt | awk '{ print $3 }')
ping=$(grep -oP "[0-9]+\.[0-9]{3} .*$" /tmp/speedtest.txt | awk '{ print $1 }')
pingType=$(grep -oP "[0-9]+\.[0-9]{3} .*$" /tmp/speedtest.txt | awk '{ print $2 }')

echo "{
	\"time\": \"$(date -I'seconds')\",
	\"upload\": {
		\"speed\": $upload,
		\"type\": \"$uploadType\"
	},
	\"download\": {
		\"speed\": $download,
		\"type\": \"$downloadType\"
	},
	\"ping\": {
		\"speed\": $ping,
		\"type\": \"$pingType\"
	}
}"
