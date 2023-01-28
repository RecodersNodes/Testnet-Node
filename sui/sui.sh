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

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt-get update \
&& sudo apt-get install -y --no-install-recommends \
tzdata \
ca-certificates \
build-essential \
libssl-dev \
libclang-dev \
pkg-config \
openssl \
git \
protobuf-compiler \
cmake

echo -e "\e[1m\e[32m2. Installing dependencies... \e[0m" && sleep 1
# packages
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustc --version

# download sui binaries
cd $HOME
git clone https://github.com/MystenLabs/sui.git
cd sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git checkout -B testnet --track upstream/testnet

# download and update configs
mkdir $HOME/.sui
wget -O $HOME/.sui/genesis.blob  https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob
cp $HOME/sui/crates/sui-config/data/fullnode-template.yaml $HOME/.sui/fullnode.yaml
sed -i.bak "s|db-path:.*|db-path: \"$HOME\/.sui\/db\"| ; s|genesis-file-location:.*|genesis-file-location: \"$HOME\/.sui\/genesis.blob\"| ; s|127.0.0.1|0.0.0.0|" $HOME/.sui/fullnode.yaml

cargo build --release --bin sui-node
mv ~/sui/target/release/sui-node /usr/local/bin/
cargo build --release --bin sui
mv ~/sui/target/release/sui /usr/local/bin/
sui-node -V
sui -V

# create sui service
sudo tee /etc/systemd/system/suid.service > /dev/null <<EOF
[Unit]
Description=Sui node
After=network-online.target
[Service]
User=$USER
ExecStart=$(which sui-node) --config-path $HOME/.sui/fullnode.yaml
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF


sudo tee /etc/systemd/journald.conf >> /dev/null <<EOF
Storage=persistent
EOF

# start sui node
sudo systemctl daemon-reload
sudo systemctl enable suid
sudo systemctl restart suid

echo -e "\e[1m\e[32m1. Sudah Terinstall... \e[0m"
