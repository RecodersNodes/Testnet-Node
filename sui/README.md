<h1><b> MINIMAL SPEK</h1></b>
<h6>RAM 32 GB</h6>
<h6>10 vCPU</h6>
<h6>1 TB Storage</h6>

## 1. Menginstall

## Install 
Menginstall memakan waktu kurang lebih 15 menit, rekomendasi dijalankan di screen dengan command:
```
screen -S sui
```
## Pake Script Otomatis:
```
wget -O sui.sh https://raw.githubusercontent.com/RecodersNodes/Testnet-Node/main/sui/sui.sh && chmod +x sui.sh && ./sui.sh
```

## Manual :
<li><a href="https://github.comRecodersNodes/Testnet-Node/main/sui/manual_install.md">Disini</a></li>

## Tambahan
Cek Node :
```
curl -s -X POST http://127.0.0.1:9000 -H 'Content-Type: application/json' -d '{ "jsonrpc":"2.0", "method":"rpc.discover","id":1}' | jq .result.info
```

Cek Node Log : 
```
journalctl -u suid -f -o cat
```

Restart Node:
```
sudo systemctl restart suid
```

Stop Node:
```
sudo systemctl stop suid
```

Delete Node:
```
sudo systemctl stop suid
sudo systemctl disable suid
rm -rf ~/sui /var/sui/ /usr/local/bin/sui*
rm /etc/systemd/system/suid.service
```
