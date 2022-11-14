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
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Menginstall Pendukung... \e[0m" && sleep 1
# packages
sudo apt install make gcc tmux wget curl clang pkg-config libssl-dev build-essential git jq llvm libudev-dev -y

echo -e "\e[1m\e[32m2. Menginstall Golang... \e[0m" && sleep 1
# install go
ver="1.18.2"
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
rm quicksilver -rf
git clone https://github.com/ingenuity-build/quicksilver.git --branch v0.4.2
cd quicksilver
make build
sudo chmod +x ./build/quicksilverd && sudo mv ./build/quicksilverd /usr/local/bin/quicksilverd

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

# set peers and seeds
seeds=dd3460ec11f78b4a7c4336f22a356fe00805ab64@seed.killerqueen-1.quicksilver.zone:26656,8603d0778bfe0a8d2f8eaa860dcdc5eb85b55982@seed02.killerqueen-1.quicksilver.zone:27676 \
&& sed -i "s/^seeds *=.*/seeds = \"$seeds\"/;" $HOME/.quicksilverd/config/config.toml

peers=1999a4a804a1946ab10def5c71eec02415bda479@161.97.82.203:26256,b281289df37c5180f9ff278be5e29964afa0c229@185.56.139.84:26656,4f35ab6008fc46cc50b103a337ec2266400eca2e@148.251.50.79:26656,90f4459126152d21983f42c8e86bc899cd618af6@116.202.15.183:11656,6ac91620bc5338e6f679835cc604769a213d362f@139.59.56.24:36366,f9d2dbf6c80f08d12d1bc8d07ffd3bafa4965160@95.214.55.43:26651,abe7397ff92a4ca61033ceac127b5fc3a9a4217f@65.108.98.218:25095,07bb0fd7af9dc819bb5bb850ea5d870281c3adfa@167.235.74.230:26656,bc7340eaf80eb5af1bdbd3e340130dc3a0acc5c4@65.108.203.149:46656,8859f032ea73ace68ca1124a09cbb462ce775a8b@38.242.131.222:26656,4096f05bec1397b8ff85dfe5fbcd712ce71cc3ae@65.108.217.251:656,21e11937b8f3edb0917ecdba68a0b29452868b80@65.21.138.123:31656,6d199195e710f8fbee5d729735941ae65ddd9adf@94.130.180.23:11656,2a6cf2a12719f4a3ac9e1211bc2d12d875bfbf48@176.124.220.33:11656,66c9fd4e4ca5b2255b4d135a81edef32f3346dc2@5.161.78.112:44656,059bbdc40a23f3d31ed758ebb303e0dc1230d31d@34.66.244.130:26656,f0104cc0de9b372b1e59be7903fa3d2233da6cba@65.108.254.209:11656,b78a8d08b37b6f230cd664bd97b96ad4c1044394@135.181.73.169:26656,2ecdacf29c2b693e613d20d4f3a0198d707eb72c@95.216.201.202:11656,0d99b3398284f2055a1d6c448bf460bf86203e51@65.108.105.48:14656,19ecce5861b059c349d3b26740b4c90e7b407432@194.163.141.20:46656,241833817b8158bbdfb00f0b9dcc98d6b1f904ac@46.4.23.42:26656,97d01a9dcb4d3d9aa7e6a468af6e9709d5608c96@65.21.78.153:22656,b3e959a0e0d9a56e4a14253b8330e0c0e968ac59@23.96.13.59:11656,dd6a22d3abbf5a0b41caab7f8f07dfe5450dac22@161.97.136.141:26651,a37474c1f254cd4b16d924327a755c914e8e7d86@51.75.135.46:27756,46d2eb9953403de555369ab5d144c713a6e5b960@144.76.67.53:2390,70c9f64fb387039652571a2431354841ddc9d7ca@202.61.225.157:26656,fd1b1ef4740ba0d2b1401967e8b9acff35b08606@135.181.116.109:47656,2c60847960033354430e60ded7e4984c65dda741@194.35.120.131:11656,288d55e8717bc3b617fc63a8919ff97d001abcd9@65.108.13.185:27060,c2baebdc5468ef0e86f7850bdd8cd91e20fa53b2@65.108.71.92:48656,235feeddbe3703ef04ed2e8ed32c53df551bf28c@3.236.91.157:26656,a4a40dbe3b72444ace5c8fe5d1b9cd018d7eabf5@5.161.143.96:11656,30d0025985d1e907912a8759cfe21a2213ba6faf@35.224.199.187:26656,f134262d42a42ae9f2ec6569a5d7b91291085f5b@172.105.244.137:11656,977844c9f9d00269c74cb6ac0fc3b13507efd836@54.36.109.62:36656,32c02237e747126166d54cdd3777d4c4cd89fba6@65.21.134.202:26676,add286d83cf1a6e637b3f79bda7710261660978d@78.47.111.90:11656,b0621d2bd6bbade5fbd9ac7c087e2aef9c78c9b2@95.216.174.133:11656,c8a3c2f87773625b1729ef112038366a63c423ce@161.97.168.60:26656,a258c7417ae099dba984c5b2c0a7d026646bde9c@161.97.137.252:26656,eb91009f533748fee7d5cbe9c3c9baa95dfe9c23@62.171.184.52:11656,ae0c5259af3830c7933a89f9c5052c6465a3db62@194.163.164.52:26656,003889f64113bdcf8e07f9b595c3d22e94aa0767@142.132.151.99:15616,4424ea631afb6fa7237e2edd30a1dc9f05a39d23@194.163.141.24:46656,e0e0065da5119adac6facb711091f86928ce25c8@185.255.131.149:46656,d5981d276f523d88ab8997d3e61d8f202d87f439@38.242.252.175:28656,88aefa87636e1fc8d1c111052cf648ec9bca2d06@138.68.175.97:11656,968a57531b3e6850ed220bdf3278d3d07a15d2ca@188.166.125.32:26656,2d5a0eb778a535240b75354d44c8842418b49271@95.217.7.80:26656,c73e0f1af31eec4652992b410ca7862622b9ec08@65.108.135.213:26756,82475f7ddf1f00325e90be4eabef3f41700adb42@31.111.24.80:26656,730bd78aa471a94bf23228598592fabf92817fc4@139.59.162.166:26656,c6c6539e9c12b4517cb72f4bdaabf32c9c248aec@195.201.59.194:36656,7928befd69d36913f94a9e94b018474823b7a45e@95.216.167.96:11656,f612b0992928f93d6b64005a26dad2c061e834d8@38.242.245.40:36366,bc7340eaf80eb5af1bdbd3e340130dc3a0acc5c4@65.108.203.149:46656,8859f032ea73ace68ca1124a09cbb462ce775a8b@38.242.131.222:26656,4096f05bec1397b8ff85dfe5fbcd712ce71cc3ae@65.108.217.251:656,21e11937b8f3edb0917ecdba68a0b29452868b80@65.21.138.123:31656,6d199195e710f8fbee5d729735941ae65ddd9adf@94.130.180.23:11656,2a6cf2a12719f4a3ac9e1211bc2d12d875bfbf48@176.124.220.33:11656,66c9fd4e4ca5b2255b4d135a81edef32f3346dc2@5.161.78.112:44656,059bbdc40a23f3d31ed758ebb303e0dc1230d31d@34.66.244.130:26656,f0104cc0de9b372b1e59be7903fa3d2233da6cba@65.108.254.209:11656,b78a8d08b37b6f230cd664bd97b96ad4c1044394@135.181.73.169:26656,2ecdacf29c2b693e613d20d4f3a0198d707eb72c@95.216.201.202:11656,0d99b3398284f2055a1d6c448bf460bf86203e51@65.108.105.48:14656,19ecce5861b059c349d3b26740b4c90e7b407432@194.163.141.20:46656,241833817b8158bbdfb00f0b9dcc98d6b1f904ac@46.4.23.42:26656,97d01a9dcb4d3d9aa7e6a468af6e9709d5608c96@65.21.78.153:22656,b3e959a0e0d9a56e4a14253b8330e0c0e968ac59@23.96.13.59:11656,dd6a22d3abbf5a0b41caab7f8f07dfe5450dac22@161.97.136.141:26651,a37474c1f254cd4b16d924327a755c914e8e7d86@51.75.135.46:27756,46d2eb9953403de555369ab5d144c713a6e5b960@144.76.67.53:2390,70c9f64fb387039652571a2431354841ddc9d7ca@202.61.225.157:26656,fd1b1ef4740ba0d2b1401967e8b9acff35b08606@135.181.116.109:47656,2c60847960033354430e60ded7e4984c65dda741@194.35.120.131:11656,288d55e8717bc3b617fc63a8919ff97d001abcd9@65.108.13.185:27060,c2baebdc5468ef0e86f7850bdd8cd91e20fa53b2@65.108.71.92:48656,235feeddbe3703ef04ed2e8ed32c53df551bf28c@3.236.91.157:26656,a4a40dbe3b72444ace5c8fe5d1b9cd018d7eabf5@5.161.143.96:11656,30d0025985d1e907912a8759cfe21a2213ba6faf@35.224.199.187:26656,f134262d42a42ae9f2ec6569a5d7b91291085f5b@172.105.244.137:11656,977844c9f9d00269c74cb6ac0fc3b13507efd836@54.36.109.62:36656,32c02237e747126166d54cdd3777d4c4cd89fba6@65.21.134.202:26676,add286d83cf1a6e637b3f79bda7710261660978d@78.47.111.90:11656,b0621d2bd6bbade5fbd9ac7c087e2aef9c78c9b2@95.216.174.133:11656,c8a3c2f87773625b1729ef112038366a63c423ce@161.97.168.60:26656,a258c7417ae099dba984c5b2c0a7d026646bde9c@161.97.137.252:26656,eb91009f533748fee7d5cbe9c3c9baa95dfe9c23@62.171.184.52:11656,ae0c5259af3830c7933a89f9c5052c6465a3db62@194.163.164.52:26656,003889f64113bdcf8e07f9b595c3d22e94aa0767@142.132.151.99:15616,4424ea631afb6fa7237e2edd30a1dc9f05a39d23@194.163.141.24:46656,e0e0065da5119adac6facb711091f86928ce25c8@185.255.131.149:46656,d5981d276f523d88ab8997d3e61d8f202d87f439@38.242.252.175:28656,88aefa87636e1fc8d1c111052cf648ec9bca2d06@138.68.175.97:11656,968a57531b3e6850ed220bdf3278d3d07a15d2ca@188.166.125.32:26656,2d5a0eb778a535240b75354d44c8842418b49271@95.217.7.80:26656,c73e0f1af31eec4652992b410ca7862622b9ec08@65.108.135.213:26756,82475f7ddf1f00325e90be4eabef3f41700adb42@31.111.24.80:26656,730bd78aa471a94bf23228598592fabf92817fc4@139.59.162.166:26656,c6c6539e9c12b4517cb72f4bdaabf32c9c248aec@195.201.59.194:36656,7928befd69d36913f94a9e94b018474823b7a45e@95.216.167.96:11656,f612b0992928f93d6b64005a26dad2c061e834d8@38.242.245.40:36366 \
&& sed -i "s/^persistent_peers *=.*/persistent_peers = \"$peers\"/;" $HOME/.quicksilverd/config/config.toml


# start service
sudo systemctl daemon-reload
sudo systemctl enable quicksilverd
sudo systemctl restart quicksilverd

echo '=============== Selamat Anda Jadi Heker  ==================='
echo -e 'untuk check logs: \e[1m\e[32mjournalctl -u quicksilverd -f -o cat\e[0m' 
