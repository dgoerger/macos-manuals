#!/bin/ksh

curl -Ls 'https://opensource.apple.com/release/macos-1015.html' | grep -E "href.*/tarballs/.*.tar.gz" | awk -F'"' '{print "curl -LOs https://opensource.apple.com" $2}' > fetch-src.sh
