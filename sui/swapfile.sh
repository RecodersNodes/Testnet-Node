#!/bin/bash
echo -e '\n\e[42m[Swap] Memulai...\e[0m\n'
grep -q "swapfile" /etc/fstab
if [[ ! $? -ne 0 ]]; then
    echo -e '\n\e[42m[Swap] Swap file sudah ada, skip.\e[0m\n'
else
    cd $HOME
    sudo fallocate -l 8G $HOME/swapfile
    sudo dd if=/dev/zero of=swapfile bs=1K count=8M
    sudo chmod 600 $HOME/swapfile
    sudo mkswap $HOME/swapfile
    sudo swapon $HOME/swapfile
    sudo swapon --show
    echo $HOME'/swapfile swap swap defaults 0 0' >> /etc/fstab
    echo -e '\n\e[42m[Swap] selesai\e[0m\n'
fi
