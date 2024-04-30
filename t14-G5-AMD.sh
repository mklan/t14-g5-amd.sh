#!/bin/bash

BOT_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID="YOUR_TELEGRAM_CHAT_ID"

url="https://lenovo.com/ph/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14-gen-5-(14-inch-amd)/len101t0102"

content=$(curl -H 'Cache-Control: no-cache, no-store' -L "$url")

if [[ "$content" == *"Available Soon"* ]]; then
    echo "Not available yet =("
else
    message="T14 G5 AMD is now available!"
    
    curl -s "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=$message"  
fi