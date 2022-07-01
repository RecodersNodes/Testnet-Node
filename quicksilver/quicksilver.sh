#!/bin/bash
echo "================================================================="
echo -e "\033[0;35m"
echo "███████╗████████╗██████╗ ███████╗███████╗███████╗     ██████╗ █████╗ ██████╗ ██╗████████╗ █████╗ ██╗  ";
echo "██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝██╔════╝    ██╔════╝██╔══██╗██╔══██╗██║╚══██╔══╝██╔══██╗██║  ";
echo "███████╗   ██║   ██████╔╝█████╗  ███████╗███████╗    ██║     ███████║██████╔╝██║   ██║   ███████║██║  ";
echo "╚════██║   ██║   ██╔══██╗██╔══╝  ╚════██║╚════██║    ██║     ██╔══██║██╔═══╝ ██║   ██║   ██╔══██║██║  ";
echo "███████║   ██║   ██║  ██║███████╗███████║███████║    ╚██████╗██║  ██║██║     ██║   ██║   ██║  ██║███████╗  ";
echo "╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝     ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝  ";
echo -e "\e[0m"
echo "================================================================="

sleep 2

# set vars
if [ ! $NODENAME ]; then
	read -p "Masukan Nama Node/Validators: " NODENAME
	echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi

echo "export QUICKSILVER_CHAIN_ID=killerqueen-1" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo '================================================='
echo -e "Nama Node: \e[1m\e[32m$NODENAME\e[0m"
echo -e "Nama Chain: \e[1m\e[32m$QUICKSILVER_CHAIN_ID\e[0m"
echo '================================================='
sleep 2

echo -e "\e[1m\e[32m1. Lagi Update... \e[0m" && sleep 1
# update
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y

echo -e "\e[1m\e[32m2. Menginstall Pendukung... \e[0m" && sleep 1
# packages
sudo apt install make clang pkg-config libssl-dev build-essential git jq llvm libudev-dev -y

echo -e "\e[1m\e[32m2. Menginstall Golang... \e[0m" && sleep 1
# install go
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo tar -xvf go1.18.1.linux-amd64.tar.gz && sudo mv go /usr/local
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile 
go version

rm go1.18.1.linux-amd64.tar.gz

echo -e "\e[1m\e[32m3. Mengclone... \e[0m" && sleep 1
# download binary
cd $HOME
rm quicksilver -rf
git clone https://github.com/ingenuity-build/quicksilver.git --branch v0.4.0
cd quicksilver
make install
sudo mv ~go/bin/quicksilverd /usr/local/bin/quicksilverd

# config
quicksilverd config chain-id $QUICKSILVER_CHAIN_ID

# init
quicksilverd init $NODENAME --chain-id $QUICKSILVER_CHAIN_ID

# download genesis and addrbook
wget -qO $HOME/.quicksilverd/config/genesis.json "https://raw.githubusercontent.com/ingenuity-build/testnets/main/killerqueen/genesis.json"

quicksilverd tendermint unsafe-reset-all --home $HOME/.quicksilverd

echo -e "\e[1m\e[32m4. Memasang Service... \e[0m" && sleep 1
# create service
sudo tee /etc/systemd/system/quicksilverd.service > /dev/null <<EOF
[Unit]
Description=quicksilverd
After=network.target
[Service]
Type=simple
User=$USER
ExecStart=$(which quicksilverd) start
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

SNAP_RPC1="https://quicksilver-rpc.theamsolutions.info:443"
SNAP_RPC2="https://quicksilver-rpc.theamsolutions.info:443"

LATEST_HEIGHT=$(curl -s $SNAP_RPC2/block | jq -r .result.block.header.height); \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 1000)); \
TRUST_HASH=$(curl -s "$SNAP_RPC2/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)

sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$SNAP_RPC1,$SNAP_RPC2\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"|" $HOME/.quicksilverd/config/config.toml

# set peers and seeds
SEEDS="dd3460ec11f78b4a7c4336f22a356fe00805ab64@seed.killerqueen-1.quicksilver.zone:26656,8603d0778bfe0a8d2f8eaa860dcdc5eb85b55982@seed02.killerqueen-1.quicksilver.zone:27676"
PEERS="1999a4a804a1946ab10def5c71eec02415bda479@161.97.82.203:26256,b281289df37c5180f9ff278be5e29964afa0c229@185.56.139.84:26656,4f35ab6008fc46cc50b103a337ec2266400eca2e@148.251.50.79:26656,90f4459126152d21983f42c8e86bc899cd618af6@116.202.15.183:11656,6ac91620bc5338e6f679835cc604769a213d362f@139.59.56.24:36366,f9d2dbf6c80f08d12d1bc8d07ffd3bafa4965160@95.214.55.43:26651,abe7397ff92a4ca61033ceac127b5fc3a9a4217f@65.108.98.218:25095,07bb0fd7af9dc819bb5bb850ea5d870281c3adfa@167.235.74.230:26656"
sed -i -e "s/^seeds *=.*/seeds = \"$SEEDS\"/; s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.quicksilverd/config/config.toml


# start service
sudo systemctl daemon-reload
sudo systemctl enable quicksilverd
sudo systemctl restart quicksilverd

echo '=============== Selamat Anda Jadi Heker  ==================='
echo -e 'untuk check logs: \e[1m\e[32mjournalctl -u quicksilverd -f -o cat\e[0m'
echo -e 'Info: \e[1m\e[32mNunggu Sekitar 10-15 menit mungkin\e[0m'
echo -e 'kalau udah ke commit sync masukan command ini: \e[1m\e[32msed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1false|" $HOME/.quicksilverd/config/config.toml\e[0m'
