#!/bin/bash
echo "================================================================="
echo -e "\033[0;35m"
echo "  _        _______  _______  _______    ______   _______  _______  ";
echo " ( (    /|(  ___  )(  ____ \(  ___  )  (  __  \ (  ___  )(  ___  ) ";
echo " |  \  ( || (   ) || (    \/| (   ) |  | (  \  )| (   ) || (   ) | ";
echo " |   \ | || (___) || |      | (___) |  | |   ) || (___) || |   | | ";
echo " | (\ \) ||  ___  || | ____ |  ___  |  | |   | ||  ___  || |   | | ";
echo " | | \   || (   ) || | \_  )| (   ) |  | |   ) || (   ) || |   | | ";
echo " | )  \  || )   ( || (___) || )   ( |  | (__/  )| )   ( || (___) | ";
echo " |/    )_)|/     \|(_______)|/     \|  (______/ |/     \|(_______) ";
echo -e "\e[0m"
echo "================================================================="

sleep 2

# set vars
if [ ! $NODENAME ]; then
	read -p "Masukan Nama Node/Validators: " NODENAME
	echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi

echo "export ICAD_CHAIN_ID=kqcosmos-1" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo '================================================='
echo -e "Nama Node: \e[1m\e[32m$NODENAME\e[0m"
echo -e "Nama Chain: \e[1m\e[32m$ICAD_CHAIN_ID\e[0m"
echo '================================================='
sleep 2

echo -e "\e[1m\e[32m1. Lagi Update... \e[0m" && sleep 1
# update
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Menginstall Pendukung... \e[0m" && sleep 1
# packages
sudo apt-get install make git jq curl gcc g++ mc nano -y

echo -e "\e[1m\e[32m2. Menginstall Golang... \e[0m" && sleep 1
# install go
ver="1.18"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
source ~/.bash_profile
go version

echo -e "\e[1m\e[32m3. Mengclone... \e[0m" && sleep 1
# download binary
cd $HOME
rm interchain-accounts -rf
git clone https://github.com/ingenuity-build/interchain-accounts --branch main
cd interchain-accounts
make install
sudo mv ~/go/bin/icad /usr/local/bin

# config
icad config chain-id $ICAD_CHAIN_ID

# init
icad init $NODENAME --chain-id $ICAD_CHAIN_ID

# download genesis and addrbook
wget -qO $HOME/.ica/config/genesis.json "https://raw.githubusercontent.com/ingenuity-build/testnets/main/killerqueen/kqcosmos-1/genesis.json"

SEEDS="66b0c16486bcc7591f2c3f0e5164d376d06ee0d0@65.108.203.151:26656"
PEERS="6ec00c0f14a905af1d04d09479bde92f1b14cf5e@62.141.45.22:26656,ee6562ed627fcc3f60ec13d5dc9265f0eaa801f3@95.217.222.229:26656,070ff3d748b1d2f23b3a00e0b92ce3e20c595cf4@178.128.221.82:26656,d3d17d76264ad6d20aecd8833d8686c13ff79e68@5.161.93.45:26656,950af7930be6c1b6242f719334040c43491ae842@194.163.169.166:26656,3df77e9140b74b84e9d19040956acfe364fbb41a@157.90.179.182:28656,adad6a9c45920682a8d4768c806f17e08c17f595@185.88.172.16:9096,9684550fab4cfac32b2fc2ce0933160ac87b42d5@95.217.109.218:26656,ef4bb5017c182bd8c7bb0bc0372b4ff5c4617b09@77.37.176.99:26686,7929bf49bdddb815b48820f2f560da03e861a412@20.68.193.38:26656,32eede4a257687a19cfd6505eb3c971215c078a4@65.108.242.147:26656,4f4ee05dabb57702ca6f3c9b587bac9947ca20a7@212.42.113.199:26756,55c9942a5725cb2b5d0fd6187437b59d6e3fabfc@135.181.140.225:36657"
sed -i -e "s/^seeds *=.*/seeds = \"$SEEDS\"/; s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.ica/config/config.toml
sed -i -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0uatom\"/" $HOME/.ica/config/app.toml

pruning="custom"
pruning_keep_recent="100"
pruning_keep_every="0"
pruning_interval="50"
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.ica/config/app.toml
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.ica/config/app.toml
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/.ica/config/app.toml
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.ica/config/app.toml

icad tendermint unsafe-reset-all --home $HOME/.ica

echo -e "\e[1m\e[32m4. Memasang Service... \e[0m" && sleep 1
# create service
sudo tee /etc/systemd/system/icad.service > /dev/null <<EOF
[Unit]
Description=ica
After=network-online.target

[Service]
User=$USER
ExecStart=$(which icad) --home $HOME/.ica start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable icad
sudo systemctl restart icad && sudo journalctl -u icad -f -o cat

echo '=============== Selamat Anda Jadi Heker  ==================='
echo -e 'untuk check logs: \e[1m\e[32mjournalctl -u icad -f -o cat\e[0m'