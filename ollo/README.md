
<p align="center">
  <img height="100" height="auto" src="https://user-images.githubusercontent.com/50621007/192699071-461d8ff6-6ddf-4d4f-aba7-d3ddcc4a5563.png">
</p>

# ollo node setup untuk testnet — ollo-testnet-0

Official Install:
>- [Validator setup instructions](https://docs.ollo.zone/validators/running_a_node)

Explorer:
>-  https://explorer.kjnodes.com/ollo


## Spek Yang dibutuhkan
Seperti jaringan Cosmos yang lain, Speknya Lumayan.

### Minimum Spek VPS
 - 4x CPUs; the faster clock speed the better
 - 8GB RAM
 - 100GB of storage (SSD or NVME)
 - Permanent Internet connection (traffic will be minimal during testnet; 10Mbps will be plenty - for production at least 100Mbps is expected)

### Rekomendasi Spek VPS
 - 8x CPUs; the faster clock speed the better
 - 64GB RAM
 - 1TB of storage (SSD or NVME)
 - Permanent Internet connection (traffic will be minimal during testnet; 10Mbps will be plenty - for production at least 100Mbps is expected)

## install your ollo fullnode
### Option 1 (automatic)
Bisa setup/install otomatis dengan command dibawah ini. nanti bakal muncul input untuk nama node validator!
```
wget -O ollo.sh https://raw.githubusercontent.com/ApizGans/Testnet-Node/main/ollo/ollo.sh && chmod +x ollo.sh && ./ollo.sh
```

### Option 2 (manual)
Tutorial [manual guide](https://github.com/ApizGans/Testnet-Node/blob/main/ollo/manual_install.md) Jika Mau install manual

## Post installation

ketika install selesai tolong ketik ini. untuk memuat variabel ke dalam sistem
```
source $HOME/.bash_profile
```

Next you have to make sure your validator is syncing blocks. You can use command below to check synchronization status
```
ollod status 2>&1 | jq .SyncInfo
```

### (OPTIONAL) State Sync
Bisa pake state sync biar syncnya cepet dengan command dibawah ini
```
sudo systemctl stop ollod
ollod tendermint unsafe-reset-all --home $HOME/.ollo --keep-addr-book

SNAP_RPC="https://node.ollo.zone:443"

LATEST_HEIGHT=$(curl -s $SNAP_RPC/block | jq -r .result.block.header.height); \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 2000)); \
TRUST_HASH=$(curl -s "$SNAP_RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)

echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH

PEERS="2a8f0fada8b8b71b8154cf30ce44aebea1b5fe3d@145.239.31.245:26656,1173fe561814f1ecb8b8f19d1769b87cd576897f@185.173.157.251:26656,489daf96446f104d822fae34cd4aa7a9b5cebf65@65.21.131.215:26626,f43435894d3ae6382c9cf95c63fec523a2686345@167.235.145.255:26656,2eeb90b696ba9a62a8ad9561f39c1b75473515eb@77.37.176.99:26656,9a3e2725e02d1c420a5d500fa17ce0ef45ddc9e8@65.109.30.117:29656,91f1889f22975294cfbfa0c1661c63150d2b9355@65.108.140.222:30656,d38fcf79871189c2c430473a7e04bd69aeb812c2@78.107.234.44:16656,f795505ac42f18e55e65c02bb7107b08d83ad837@65.109.17.86:37656,6368702dd71e69035dff6f7830eb45b2bae92d53@65.109.57.161:15656"
sed -i -e "s/^seeds *=.*/seeds = \"$SEEDS\"/; s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.ollo/config/config.toml

sed -i -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$SNAP_RPC,$SNAP_RPC\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"|" $HOME/.ollo/config/config.toml

sudo systemctl restart ollod
sudo journalctl -u ollod -f --no-hostname -o cat
```

### Create wallet
Buat bikin wallet baru. jangan lupa save mnemonicnya
```
ollod keys add $WALLET
```

(OPTIONAL jika sudah buat wallet sebelumnya) buat import pake seed phrase
```
ollod keys add $WALLET --recover
```

Untuk list wallets
```
ollod keys list
```

### Save wallet info
Tambah wallet dan valoper address Ke dalam variables 
```
OLLO_WALLET_ADDRESS=$(ollod keys show $WALLET -a)
OLLO_VALOPER_ADDRESS=$(ollod keys show $WALLET --bech val -a)
echo 'export OLLO_WALLET_ADDRESS='${OLLO_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export OLLO_VALOPER_ADDRESS='${OLLO_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile
```

### Fund your wallet
Untuk membuat validator , Perlu Ollo, request dulu ollonya di discord. \
Request Faucet [OLLO Discord](https://discord.gg/NtuEKxcrdB)
- Ambil Role verified
- Ambil role `Testnet Explorers role` Di `#roles` channel
- Ke `#testnet-faucet` Dan request tokens
```
!request YOUR_WALLET_ADDRESS
```

### Create validator
Sebelum membuat validator, pastikan Anda memiliki setidaknya 1 ollo (1 ollo sama dengan 1000000 utollo) dan Node disinkronkan

buat cek wallet balance:
```
ollod query bank balances $OLLO_WALLET_ADDRESS
```
> Jika Kosong Berarti Nodenya Belum Sync.Tunggu Nodenya Sync
Buat Bikin validator Jalankan command dibawah ini
```
ollod tx staking create-validator \
  --amount 2000000utollo \
  --from $WALLET \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.2" \
  --commission-rate "0.07" \
  --min-self-delegation "1" \
  --pubkey  $(ollod tendermint show-validator) \
  --moniker $NODENAME \
  --chain-id $OLLO_CHAIN_ID
```

## Security
Untuk melindungi kunci Anda, pastikan mengikuti aturan keamanan dasar



### Basic Firewall security
Mulailah dengan memeriksa status ufw.
```
sudo ufw status
```

Setel default untuk mengizinkan koneksi outgoing, tolak semua yang masuk kecuali ssh dan 26656. Batasi upaya login SSH
```
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow ${OLLO_PORT}656,${OLLO_PORT}660/tcp
sudo ufw enable
```

### Check validator key kamu
```
[[ $(ollod q staking validator $OLLO_VALOPER_ADDRESS -oj | jq -r .consensus_pubkey.key) = $(ollod status | jq -r .ValidatorInfo.PubKey.value) ]] && echo -e "\n\e[1m\e[32mTrue\e[0m\n" || echo -e "\n\e[1m\e[31mFalse\e[0m\n"
```

### Cek list validators
```
ollod q staking validators -oj --limit=3000 | jq '.validators[] | select(.status=="BOND_STATUS_BONDED")' | jq -r '(.tokens|tonumber/pow(10; 6)|floor|tostring) + " \t " + .description.moniker' | sort -gr | nl
```

## Cek connected peer list dengan ids
```
curl -sS http://localhost:${OLLO_PORT}657/net_info | jq -r '.result.peers[] | "\(.node_info.id)@\(.remote_ip):\(.node_info.listen_addr)"' | awk -F ':' '{print $1":"$(NF)}'
```

## Usefull commands
### Service management
Cek logs
```
journalctl -fu ollod -o cat
```

Start service
```
sudo systemctl start ollod
```

Stop service
```
sudo systemctl stop ollod
```

Restart service
```
sudo systemctl restart ollod
```

### Node info
Synchronization info
```
ollod status 2>&1 | jq .SyncInfo
```

Validator info
```
ollod status 2>&1 | jq .ValidatorInfo
```

Node info
```
ollod status 2>&1 | jq .NodeInfo
```

Show node id
```
ollod tendermint show-node-id
```

### Wallet Command
List semua wallets
```
ollod keys list
```

Recover/import wallet
```
ollod keys add $WALLET --recover
```

Delete wallet
```
ollod keys delete $WALLET
```

Cek wallet balance
```
ollod query bank balances $OLLO_WALLET_ADDRESS
```

Transfer
```
ollod tx bank send $OLLO_WALLET_ADDRESS <TO_OLLO_WALLET_ADDRESS> 10000000utollo
```

### Voting
```
ollod tx gov vote 1 yes --from $WALLET --chain-id=$OLLO_CHAIN_ID
```

### Staking, Delegation and Rewards
Delegate stake
```
ollod tx staking delegate $OLLO_VALOPER_ADDRESS 10000000utollo --from=$WALLET --chain-id=$OLLO_CHAIN_ID --gas=auto
```

Redelegate stake dari validator Ke Validator Lain
```
ollod tx staking redelegate <dariValidatorAddress> <KeValidatorAddress> 10000000utollo --from=$WALLET --chain-id=$OLLO_CHAIN_ID --gas=auto
```

Withdraw all rewards
```
ollod tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$OLLO_CHAIN_ID --gas=auto
```

Withdraw rewards dengan commision
```
ollod tx distribution withdraw-rewards $OLLO_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$OLLO_CHAIN_ID
```

### Validator Edit
Edit validator
```
ollod tx staking edit-validator \
  --moniker=$NODENAME \
  --identity=<keybase_id> \
  --website="<website>" \
  --details="<validator_description>" \
  --chain-id=$OLLO_CHAIN_ID \
  --from=$WALLET
```

Unjail validator
```
ollod tx slashing unjail \
  --broadcast-mode=block \
  --from=$WALLET \
  --chain-id=$OLLO_CHAIN_ID \
  --gas=auto
```

### Hapus node
Comman Ini Buat hapus node server di vps. Use at your own risk!
```
sudo systemctl stop ollod
sudo systemctl disable ollod
sudo rm /etc/systemd/system/ollo* -rf
sudo rm $(which ollod) -rf
sudo rm $HOME/.ollo* -rf
sudo rm $HOME/ollo -rf
sed -i '/OLLO_/d' ~/.bash_profile
```
