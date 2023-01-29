#!/bin/bash

exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
	echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi
bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
sleep 1 && curl -s https://raw.githubusercontent.com/RecodersNodes/ApizGans/main/logo.sh | bash && sleep 2
echo -e 'Menyeting swapfile...\n'
curl -s https://raw.githubusercontent.com/RecodersNodes/Testnet-Node/main/sui/swapfile.sh | bash

echo -e '\n\e[42mMemasang software\e[0m\n' && sleep 1
apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends tzdata git ca-certificates curl build-essential libssl-dev pkg-config libclang-dev cmake jq
echo -e '\n\e[42mMemasang Rust\e[0m\n' && sleep 1
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

rm -rf /var/sui/db /var/sui/genesis.blob $HOME/sui
mkdir -p /var/sui/db
cd $HOME
git clone https://github.com/MystenLabs/sui.git
cd sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git checkout -B testnet --track upstream/testnet
cp crates/sui-config/data/fullnode-template.yaml /var/sui/fullnode.yaml
sed -i.bak "s/db-path:.*/db-path: \"\/var\/sui\/suidb\"/ ; s/genesis-file-location:.*/genesis-file-location: \"\/var\/sui\/genesis.blob\"/" /var/sui/fullnode.yaml
wget -O /var/sui/genesis.blob https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob
cargo build --release -p sui-node
mv ~/sui/target/release/sui-node /usr/local/bin/ || exit

echo "[Unit]
Description=Sui Node
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/sui-node --config-path /var/sui/fullnode.yaml
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/suid.service

mv $HOME/suid.service /etc/systemd/system/
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
sudo systemctl restart systemd-journald
sudo systemctl daemon-reload
sudo systemctl enable suid
sudo systemctl restart suid


echo "==================================================="
echo -e '\n\e[42mCek Sui status\e[0m\n' && sleep 1
if [[ `service suid status | grep active` =~ "running" ]]; then
  echo -e "Sui node kamu \e[32mterinstall dan bekerja\e[39m!"
  echo -e "kamu bisa mengecek node status dengan command ini \e[7mservice suid status\e[0m"
  echo -e "Pencet \e[7mQ\e[0m untuk exit dari status menu"
else
  echo -e "Sui Node Kamu \e[31mtidak terinstall dengan benar\e[39m, tolong reinstall."
fi
