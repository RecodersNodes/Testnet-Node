<p align="center" dir="auto">
  <a target="_blank" rel="noopener noreferrer" href="https://ibb.co/LdFr8q8"><img height="100" src="https://ibb.co/LdFr8q8" style="max-width: 100%;"></a>
</p>

# loyal node setup untuk testnet —loyal-1

Official documentation:
>- [Validator setup instructions](https://docs.joinloyal.io/validators/build-a-loyal-node)

Explorer:
>-  https://ping-pub.joinloyal.io/loyal/

## Tools yang mungkin berguna
>
> To migrate your validator to another machine read [Migrate your validator to another machine](https://github.com/kj89/testnet_manuals/blob/main/loyal/migrate_validator.md)

## Spek VPS Yang Dibutuhkan
Seperti Jaringan Cosmos-SDK lain

### Minimum Spek
 - 4x CPUs; the faster clock speed the better
 - 8GB RAM
 - 100GB of storage (SSD or NVME)
 - Permanent Internet connection (traffic will be minimal during testnet; 10Mbps will be plenty - for production at least 100Mbps is expected)

### Recommendasi Spek 
 - 8x CPUs; the faster clock speed the better
 - 64GB RAM
 - 1TB of storage (SSD or NVME)
 - Permanent Internet connection (traffic will be minimal during testnet; 10Mbps will be plenty - for production at least 100Mbps is expected)

## Set up fullnode loyal kamu
### Option 1 (otomatis)
bisa install/pasang otomatis menggunakan skrip dibawah ini dengan sat set sat set.
```
wget -O loyal.sh https://raw.githubusercontent.com/kj89/testnet_manuals/main/loyal/loyal.sh && chmod +x loyal.sh && ./loyal.sh
```

### Option 2 (manual)
Kamu Bisa mengikuti [manual guide](https://github.com/kj89/testnet_manuals/blob/main/loyal/manual_install.md)  jika mau install node manual

## installation

Saat instalasi selesai, harap muat variabel ke dalam sistem
```
source $HOME/.bash_profile
```

Selanjutnya Kamu harus memastikan validator Kamu menyinkronkan blok. Kamu dapat menggunakan perintah di bawah ini untuk memeriksa status sinkronisasi
```
loyald status 2>&1 | jq .SyncInfo
```

### (OPTIONAL) State-Sync provided by PPNV Service
You can state sync your node in minutes by running commands below
```
SNAP_RPC="https://loyal-testnet-rpc.polkachu.com:443"

LATEST_HEIGHT=$(curl -s $SNAP_RPC/block | jq -r .result.block.header.height); \
BLOCK_HEIGHT=$((LATEST_HEIGHT - 2000)); \
TRUST_HASH=$(curl -s "$SNAP_RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)
echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH
#jika tidak ada kesalahan, maka lanjutkan
sudo systemctl stop loyald
loyal tendermint unsafe-reset-all --home $HOME/.loyal --keep-addr-book
sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$SNAP_RPC,$SNAP_RPC\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"|" $HOME/.loyal/config/config.toml
sudo systemctl restart loyald
sudo journalctl -u loyald -f --no-hostname -o cat
```


### buat wallet
Untuk membuat dompet baru Kamu dapat menggunakan perintah di bawah ini. Jangan lupa untuk menyimpan mnemonicnya
```
loyald keys add $WALLET
```

(OPTIONAL) Untuk memulihkan dompet Kamu menggunakan frase seed
```
loyald keys add $WALLET --recover
```

Untuk mendapatkan daftar wallet saat ini
```
loyald keys list
```

### Save wallet info
Tambahkan wallet dan alamat valoper ke dalam variabel
```
LOYAL_WALLET_ADDRESS=$(loyald keys show $WALLET -a)
LOYAL_VALOPER_ADDRESS=$(loyald keys show $WALLET --bech val -a)
echo 'export LOYAL_WALLET_ADDRESS='${LOYAL_WALLET_ADDRESS} >> $HOME/.bash_profile
echo 'export LOYAL_VALOPER_ADDRESS='${LOYAL_VALOPER_ADDRESS} >> $HOME/.bash_profile
source $HOME/.bash_profile
```

### Danai dompet Anda
Untuk membuat validator terlebih dahulu, Anda perlu mendanai dompet Anda dengan token testnet.
```
curl -X POST "https://faucet.joinloyal.io/" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"address\": \"$LOYAL_WALLET_ADDRESS\", \"coins\": [ \"2000000ulyl\" ]}"
```

### Membuat validator
Sebelum membuat validator, pastikan Anda memiliki minimal 1 loyal (1 loyal sama dengan 1000000 ulyl) dan node Anda telah tersinkronisasi

Untuk memeriksa saldo dompet Anda:
```
loyald query bank balances $LOYAL_WALLET_ADDRESS
```
> Jika dompet Anda tidak menunjukkan saldo apa pun, kemungkinan node Anda masih disinkronkan. Harap tunggu hingga selesai untuk menyinkronkan, lalu lanjutkan

Untuk membuat perintah jalankan validator Anda di bawah ini
```
loyald tx staking create-validator \
  --amount 2000000ulyl \
  --from $WALLET \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.20" \
  --commission-rate "0.05" \
  --min-self-delegation "1" \
  --pubkey  $(loyald tendermint show-validator) \
  --moniker $NODENAME \
  --gas="auto" \
  --gas-prices="0.025ulyl" \
  --chain-id $LOYAL_CHAIN_ID
```

## Keamanan
Untuk melindungi kunci Anda, pastikan Anda mengikuti aturan keamanan dasar

### Set up ssh keys for authentication
Tutorial bagus tentang cara mengatur kunci ssh untuk otentikasi ke server Anda dapat ditemukan [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04)

### Keamanan Firewall Dasar
Mulailah dengan memeriksa status ufw.
```
sudo ufw status
```

Setel default untuk mengizinkan koneksi keluar, tolak semua yang masuk kecuali ssh dan 26656. Batasi upaya login SSH
```
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 26656,26660/tcp
sudo ufw allow 26658
sudo ufw allow 568
sudo ufw allow 567
sudo ufw allow 26657
sudo ufw allow 9090
sudo ufw allow 9091
sudo ufw allow 5660
sudo ufw allow 5661
sudo ufw enable
```

### Periksa kunci validator Anda
```
[[ $(loyald q staking validator $LOYAL_VALOPER_ADDRESS -oj | jq -r .consensus_pubkey.key) = $(loyald status | jq -r .ValidatorInfo.PubKey.value) ]] && echo -e "\n\e[1m\e[32mTrue\e[0m\n" || echo -e "\n\e[1m\e[31mFalse\e[0m\n"
```

### Dapatkan daftar validator
```
loyald q staking validators -oj --limit=3000 | jq '.validators[] | select(.status=="BOND_STATUS_BONDED")' | jq -r '(.tokens|tonumber/pow(10; 6)|floor|tostring) + " \t " + .description.moniker' | sort -gr | nl
```

## Dapatkan daftar peer yang saat ini terhubung dengan id
```
curl -sS http://localhost:26657/net_info | jq -r '.result.peers[] | "\(.node_info.id)@\(.remote_ip):\(.node_info.listen_addr)"' | awk -F ':' '{print $1":"$(NF)}'
```

## Perintah yang berguna
### Manajemen Service
Cek logs
```
journalctl -fu loyald -o cat
```

Start service
```
sudo systemctl start loyald
```

Stop service
```
sudo systemctl stop loyald
```

Restart service
```
sudo systemctl restart loyald
```

### Node info
Synchronization info
```
loyald status 2>&1 | jq .SyncInfo
```

Validator info
```
loyald status 2>&1 | jq .ValidatorInfo
```

Node info
```
loyald status 2>&1 | jq .NodeInfo
```

Show node id
```
loyald tendermint show-node-id
```

### Wallet operations
List of wallets
```
loyald keys list
```

Recover wallet
```
loyald keys add $WALLET --recover
```

Delete wallet
```
loyald keys delete $WALLET
```

Get wallet balance
```
loyald query bank balances $LOYAL_WALLET_ADDRESS
```

Transfer funds
```
loyald tx bank send $LOYAL_WALLET_ADDRESS <TO_LOYAL_WALLET_ADDRESS> 10000000ulyl
```

### Voting
```
loyald tx gov vote 1 yes --from $WALLET --chain-id=$LOYAL_CHAIN_ID
```

### Staking, Delegation and Rewards
Delegate stake
```
loyald tx staking delegate $LOYAL_VALOPER_ADDRESS 10000000ulyl --from=$WALLET --chain-id=$LOYAL_CHAIN_ID --gas=auto
```

Redelegate stake from validator to another validator
```
loyald tx staking redelegate <srcValidatorAddress> <destValidatorAddress> 10000000ulyl --from=$WALLET --chain-id=$LOYAL_CHAIN_ID --gas=auto
```

Withdraw all rewards
```
loyald tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$LOYAL_CHAIN_ID --gas=auto
```

Withdraw rewards with commision
```
loyald tx distribution withdraw-rewards $LOYAL_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$LOYAL_CHAIN_ID
```

### Validator management
Edit validator
```
loyald tx staking edit-validator \
--moniker=NAMANODEBARU \
--chain-id=$LOYAL_CHAIN_ID \
--from=$WALLET
```

Unjail validator
```
loyald tx slashing unjail \
  --broadcast-mode=block \
  --from=$WALLET \
  --chain-id=$LOYAL_CHAIN_ID \
  --gas=auto --fees 250ulyl
```

### Delete node
Perintah ini akan sepenuhnya menghapus node dari server. Gunakan dengan risiko Anda sendiri!
```
sudo systemctl stop loyald
sudo systemctl disable loyald
sudo rm /etc/systemd/system/loyald* -rf
sudo rm $(which loyald) -rf
sudo rm $HOME/.loyal* -rf
sudo rm $HOME/loyal* -rf
sed -i '/LYL_/d' ~/.bash_profile
```