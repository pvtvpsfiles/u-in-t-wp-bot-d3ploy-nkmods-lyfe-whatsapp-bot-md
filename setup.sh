#!/bin/bash

echo -n "Do you have session? (y/n): "
read has_session

if [ "$has_session" = "n" ]; then
    clear
    echo -e "\e[93mPlease Visit. \e[34mhttps://qr-hazel-alpha.vercel.app/session\e[93m Go and Take session. Come back\n"
    sleep 10
    echo -n "Do you successfully take session? (y/n): "
    read success_session

    if [ "$success_session" = "n" ]; then
        clear
        exit
    fi
fi

echo -n "Please provide your Session ID: "
read session_id
clear
echo -n "What are you going to put bot name: "
read gitname
clear
echo -n "Which bot prefix do you want: "
read bot_prefix
clear
echo -n "Which Sticker Package (eg: nkmods, XD): "
read bot_stickerpack
clear
echo -e "SUDO means other numbers can use your bot.\nIf you want to add Numbers, format: 917736799273,917591970432,91..\nNumber with country code. Never put + or space, only country code and number"
echo -n "Provide SUDO Numbers: "
read sudo_numbers

cd ..
apt -y update && sudo apt -y upgrade
apt -y install git ffmpeg curl
apt -y remove nodejs
curl -fsSl https://deb.nodesource.com/setup_lts.x | bash -
apt -y install nodejs
npm install -g yarn
yarn global add pm2
git clone https://github.com/lyfe00011/whatsapp-bot-md "$gitname"
cd "$gitname"
yarn install --network-concurrency 1
clear

echo -e "PREFIX = \"$bot_prefix\"\nSTICKER_PACKNAME = \"$bot_stickerpack\"\nALWAYS_ONLINE = \"false\"\nRMBG_KEY = \"null\"\nLANGUAG = \"en\"\nWARN_LIMIT = \"3\"\nFORCE_LOGOUT = \"false\"\nBRAINSHOP = \"159501,6pq8dPiYt7PdqHz3\"\nMAX_UPLOAD = \"60\"\nREJECT_CALL = \"false\"\nSUDO = \"$sudo_numbers\"\nTZ = \"Asia/Kolkata\"\nVPS = \"true\"\nAUTO_STATUS_VIEW = \"false\"\nSEND_READ = \"false\"\nAJOIN = \"false\"\nSESSION_ID = \"$session_id\"" > config.env
