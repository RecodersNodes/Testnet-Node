#!/bin/bash
echo "================================================================="
echo -e "\033[0;35m"
echo " >======>                                      >=>                           >==>    >=>                >=>                   ";
echo " >=>    >=>                                    >=>                           >> >=>  >=>                >=>                   ";
echo " >=>    >=>     >==>       >==>    >=>         >=>   >==>    >> >==>  >===>  >=> >=> >=>    >=>         >=>   >==>     >===>  ":
echo " >> >==>      >>   >=>   >=>     >=>  >=>   >=>>=> >>   >=>   >=>    >=>     >=>  >=>>=>  >=>  >=>   >=>>=> >>   >=>  >=>     ";
echo " >=>  >=>     >>===>>=> >=>     >=>    >=> >>  >=> >>===>>=>  >=>      >==>  >=>   > >=> >=>    >=> >>  >=> >>===>>=>   >==>  ";
echo " >=>    >=>   >>         >=>     >=>  >=>  >>  >=> >>         >=>        >=> >=>    >>=>  >=>  >=>  >>  >=> >>            >=> ";
echo " >=>      >=>  >====>      >==>    >=>      >=>>=>  >====>   >==>    >=> >=> >=>     >=>    >=>      >=>>=>  >====>   >=> >=> ";
echo -e "\e[0m"
echo "================================================================="
sleep 2
# set vars
if [ ! $NODENAME ]; then
	read -p "Nama Node/Validator: " NODENAME
	echo 'export NODENAME='$NODENAME >> $HOME/.bash_profile
fi
LOYAL_PORT=56
if [ ! $WALLET ]; then
	echo "export WALLET=wallet" >> $HOME/.bash_profile
fi
echo "export LOYAL_CHAIN_ID=loyal-1" >> $HOME/.bash_profile
echo "export LOYAL_PORT=${LOYAL_PORT}" >> $HOME/.bash_profile
source $HOME/.bash_profile

echo '================================================='
echo -e "Nama Node : \e[1m\e[32m$NODENAME\e[0m"
echo -e "Nama Wallet : \e[1m\e[32m$WALLET\e[0m"
echo -e "Nama Chain: \e[1m\e[32m$LOYAL_CHAIN_ID\e[0m"
echo -e "Port: \e[1m\e[32m$LOYAL_PORT\e[0m"
echo '================================================='
sleep 2

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Installing Pendukung... \e[0m" && sleep 1
# packages
sudo apt install curl tar wget clang pkg-config libssl-dev jq build-essential bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y

# install go
if ! [ -x "$(command -v go)" ]; then
  ver="1.18.2"
  cd $HOME
  wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
  rm "go$ver.linux-amd64.tar.gz"
  echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bash_profile
  source ~/.bash_profile
fi

echo -e "\e[1m\e[32m3. Downloading and building binaries... \e[0m" && sleep 1
# download binary
cd $HOME
wget https://github.com/LoyalLabs/loyal/releases/download/v0.25.1/loyal_v0.25.1_linux_amd64.tar.gz
tar xzf loyal_v0.25.1_linux_amd64.tar.gz
chmod 775 loyald
sudo mv loyald /usr/local/bin/
sudo rm loyal_v0.25.1_linux_amd64.tar.gz

sleep 1

#config
loyald config chain-id $LOYAL_CHAIN_ID
loyald config keyring-backend file
loyal init $NODENAME --chain-id $LOYAL_CHAIN_ID

curl -s "https://raw.githubusercontent.com/LoyalLabs/net/master/mainnet/genesis.json" > $HOME/.loyal/config/genesis.json

export SEEDS="$(curl -s "https://raw.githubusercontent.com/LoyalLabs/net/master/mainnet/seed-nodes.txt" | paste -d, -s)"
sed -i.bak -e "s/^seeds *=.*/seeds = \"$SEEDS\"/" ~/.loyal/config/config.toml

export PEERS="$(curl -s "https://raw.githubusercontent.com/LoyalLabs/net/master/mainnet/peer-nodes.txt" | paste -d, -s)"
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" ~/.loyal/config/config.toml

# config pruning
pruning="custom"
pruning_keep_recent="100"
pruning_keep_every="0"
pruning_interval="50"
sed -i -e "s/^pruning *=.*/pruning = \"$pruning\"/" $HOME/.loyal/config/app.toml
sed -i -e "s/^pruning-keep-recent *=.*/pruning-keep-recent = \"$pruning_keep_recent\"/" $HOME/.loyal/config/app.toml
sed -i -e "s/^pruning-keep-every *=.*/pruning-keep-every = \"$pruning_keep_every\"/" $HOME/.loyal/config/app.toml
sed -i -e "s/^pruning-interval *=.*/pruning-interval = \"$pruning_interval\"/" $HOME/.loyal/config/app.toml

sed -i.bak -e "s%^proxy_app = \"tcp://127.0.0.1:26658\"%proxy_app = \"tcp://127.0.0.1:2${LOYAL_PORT}8\"%; s%^laddr = \"tcp://127.0.0.1:26657\"%laddr = \"tcp://127.0.0.1:2${LOYAL_PORT}7\"%; s%^pprof_laddr = \"localhost:6060\"%pprof_laddr = \"localhost:${LOYAL_PORT}60\"%; s%^laddr = \"tcp://0.0.0.0:26656\"%laddr = \"tcp://0.0.0.0:2${LOYAL_PORT}6\"%; s%^prometheus_listen_addr = \":26660\"%prometheus_listen_addr = \":2${LOYAL_PORT}0\"%" $HOME/$LOYAL_FOLDER/config/config.toml
sed -i.bak -e "s%^address = \"tcp://0.0.0.0:1317\"%address = \"tcp://0.0.0.0:${LOYAL_PORT}7\"%; s%^address = \":8080\"%address = \":${LOYAL_PORT}80\"%; s%^address = \"0.0.0.0:9090\"%address = \"0.0.0.0:${LOYAL_PORT}90\"%; s%^address = \"0.0.0.0:9091\"%address = \"0.0.0.0:${LOYAL_PORT}91\"%" $HOME/.loyal/config/app.toml
sed -i.bak -e "s%^node = \"tcp://localhost:26657\"%node = \"tcp://localhost:2${LOYAL_PORT}7\"%" $HOME/.loyal/config/client.toml

sed -i -e "s/prometheus = false/prometheus = true/" $HOME/.loyal/config/config.toml

sed -i -e "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.000025u\"/" $HOME/.loyal/config/app.toml

indexer="null" && \
sed -i -e "s/^indexer *=.*/indexer = \"$indexer\"/" $HOME/.loyal/config/config.toml

loyald tendermint unsafe-reset-all --home $HOME/.loyal

echo -e "\e[1m\e[32m4. Starting service... \e[0m" && sleep 1
# create service
sudo tee /etc/systemd/system/loyald.service > /dev/null <<EOF
[Unit]
Description=loyal
After=network-online.target
[Service]
User=$USER
ExecStart=$(which loyald) start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

# start service
sudo systemctl daemon-reload
sudo systemctl enable loyald
sudo systemctl restart loyald

echo '=============== INSTALL SUKSES ==================='
echo -e 'Untuk check logs: \e[1m\e[32mjournalctl -u nibid -f -o cat\e[0m'
echo -e "Untuk check sync status: \e[1m\e[32mcurl -s localhost:${LOYAL_PORT}657/status | jq .result.sync_info\e[0m"