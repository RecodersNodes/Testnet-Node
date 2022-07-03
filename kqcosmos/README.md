<p align="center" dir="auto">
  <a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png"><img height="100" src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png" style="max-width: 100%;"></a>
</p>

<h1 dir="auto"><a id="user-content-cara-menjalankan-node-quicksilver--kqcosmos-1" class="anchor" aria-hidden="true" href="#cara-menjalankan-node-ICAD--kqcosmos-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Cara Menjalankan Node Quicksilver Testnet — kqcosmos-1</h1>

<h2 dir="auto"><a id="user-content-hardware-requirements" class="anchor" aria-hidden="true" href="#hardware-requirements"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Spek VPS Yang Dibutuhkan</h2>
<p dir="auto">Seperti Jaringan Cosmos Yang Lain, Speknya Lumayan Menguras Dompet :V.</p>
<h3 dir="auto"><a id="user-content-minimum-hardware-requirements" class="anchor" aria-hidden="true" href="#minimum-hardware-requirements"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Minimal Spek</h3>
<ul dir="auto">
<li>3x CPUs; the faster clock speed the better</li>
<li>4GB RAM</li>
<li>80GB Disk</li>
<li>Permanent Internet connection (Internet Harus Kenceng Sudah Pasti Inet VPS kenceng)</li>
</ul>

<h3 dir="auto"><a id="user-content-recommended-hardware-requirements" class="anchor" aria-hidden="true" href="#recommedasi-spek"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Rekomendasi Spek</h3>
<ul dir="auto">
<li>4x CPUs; the faster clock speed the better</li>
<li>8GB RAM</li>
<li>200GB of storage (SSD atau NVME)</li>
<li>Permanent Internet connection (Internet Harus Kenceng Sudah Pasti Inet VPS kenceng)</li>
</ul>
<h2 dir="auto"><a id="user-content-set-up-your-quicksilver-fullnode" class="anchor" aria-hidden="true" href="#setting-fullnode"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>setting full node</h2>
<h3 dir="auto"><a id="user-content-option-1-automatic" class="anchor" aria-hidden="true" href="#option-1-automatic"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Otomatis</h3>
<p dir="auto">Lu bisa setup otomatis menggunakan skrip dibawah ini dengan sat set sat set.</p>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto"><pre class="notranslate"><code>wget -O ica.sh https://raw.githubusercontent.com/ApizGans/Testnet-Node/main/kqcosmos/ica.sh &amp;&amp; chmod +x ica.sh &amp;&amp; ./ica.sh
</code></pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="wget -O ica.sh https://raw.githubusercontent.com/ApizGans/Testnet-Node/main/kqcosmos/ica.sh &amp;&amp; chmod +x ica.sh &amp;&amp; ./ica.sh" tabindex="0" role="button" style="display: inherit;">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
<p dir="auto">Ketika Install Selesai ketik ini dong ngab</p>
<pre class="notranslate"><code>source $HOME/.bash_profile
</code></pre>
<p dir="auto">Buat Cek Node Lu False / True Kalau False Udah Ke Sync</p>
<pre class="notranslate"><code>icad status 2&gt;&amp;1 | jq .SyncInfo
</code></pre>
<p dir="auto">Buat Bikin Wallet.Mnemonicnya disave dong sayangku nanti hilang gagal jp</p>
<pre class="notranslate"><code>icad keys add $WALLET
</code></pre>
<p dir="auto">Kalau lu dah buat sebelumya ya import aja pake ini</p>
<pre class="notranslate"><code>icad keys add $WALLET --recover
</code></pre>
<p dir="auto">buat cek list wallet</p>
<pre class="notranslate"><code>icad keys list
</code></pre>
<h3 dir="auto"><a id="user-content-fund-your-wallet" class="anchor" aria-hidden="true" href="#fund-your-wallet"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Isi Wallet Lu biar bisa buat validator</h3>
<p dir="auto">masuk discordnya dulu link https://discord.gg/gTKFCbaP3C. kalau udah masuk faucet ke channel dibawah ini</p>
<ul dir="auto">
<li><strong>#qck-tap</strong> buat QCK</li>
<li><strong>#atom-tap</strong> buat ATOM</li>
</ul>
<pre class="notranslate"><code>$request &lt;ADDRESS WALLET ELU&gt; kqcosmos
</code></pre>
<p dir="auto">Buat cek balance wallet elo:</p>
<pre class="notranslate"><code>icad query bank balances $ICAD_WALLET_ADDRESS
</code></pre>
<blockquote>
<p dir="auto">kalau ga muncul berarti node lu belom sync biar cepet pake state sync atau snapshot ( Pilih Salah Satu Jangan Semua)</p>
</blockquote>
<p dir="auto">pake State Sync</a> :</p>
<pre class="notranslate"> icad tendermint unsafe-reset-all --home ~/.ica/

SNAP_RPC1="http://157.90.179.182:28657" \
&& SNAP_RPC2="http://157.90.179.182:28657"

LATEST_HEIGHT=$(curl -s $SNAP_RPC2/block | jq -r .result.block.header.height) \
&& BLOCK_HEIGHT=$((LATEST_HEIGHT - 300)) \
&& TRUST_HASH=$(curl -s "$SNAP_RPC2/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)

echo $LATEST_HEIGHT $BLOCK_HEIGHT $TRUST_HASH

sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true| ; \
s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$SNAP_RPC1,$SNAP_RPC2\"| ; \
s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT| ; \
s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"|" $HOME/.ica/config/config.toml
</code></pre>
<blockquote>
<p dir="auto"> pake command Ini Kalau Udah Ke Sync biar ga ke restart </p>
</blockquote>
<pre class="notranslate">sed -i.bak -E "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1false|" $HOME/.ica/config/config.toml 
</code></pre>
<p dir="auto">pake snapshot dari <a href="https://snapshot.testnet.run" rel="nofollow">Testnet Run</a> :</p>
<pre class="notranslate">icad tendermint unsafe-reset-all

rm -rf $HOME/.ica/data/*

URL="https://snapshot.testnet.run/testnet/kqcosmos/killerqueen-1_2022-06-30.tar"

wget -O - $URL | tar -xvf - -C $HOME/.ica/data
</code></pre>
<h2 dir="auto"><a id="user-content-usefull-commands" class="anchor" aria-hidden="true" href="#usefull-commands"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Kumpulan Command</h2>
<p dir="auto">command buat validator:</p>
<pre class="notranslate"><code>icad tx staking create-validator \
  --amount 1000000uqck \
  --from $WALLET \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.2" \
  --commission-rate "0.07" \
  --min-self-delegation "1" \
  --pubkey  $(icad tendermint show-validator) \
  --moniker $NODENAME \
  --chain-id $ICAD_CHAIN_ID
</code></pre>
<p dir="auto">Cek Log</p>
<pre class="notranslate"><code>journalctl -fu icad -o cat
</code></pre>
<p dir="auto">Mulai Service</p>
<pre class="notranslate"><code>sudo systemctl start icad
</code></pre>
<p dir="auto">stop Service</p>
<pre class="notranslate"><code>sudo systemctl stop icad
</code></pre>
<p dir="auto">Restart Service</p>
<pre class="notranslate"><code>sudo systemctl Restart icad
</code></pre>
<p dir="auto">Synchronization info</p>
<pre class="notranslate"><code>icad status 2>&1 | jq .SyncInfo
</code></pre>
<p dir="auto">Validator info</p>
<pre class="notranslate"><code>icad status 2>&1 | jq .ValidatorInfo
</code></pre>
<p dir="auto">Node info</p>
<pre class="notranslate"><code>icad status 2>&1 | jq .NodeInfo
</code></pre>
<p dir="auto">Liat node id</p>
<pre class="notranslate"><code>icad tendermint show-node-id
</code></pre>
<p dir="auto">Kirim Token</p>
<pre class="notranslate"><code>icad tx bank send $ICAD_WALLET_ADDRESS <TO_ICAD_WALLET_ADDRESS> <JUMLAHTOKEN>uqck
</code></pre>
<p dir="auto">Voting</p>
<pre class="notranslate"><code>icad tx gov vote 1 yes --from $WALLET --chain-id=$ICAD_CHAIN_ID
</code></pre>
<p dir="auto">Delegate stake</p>
<pre class="notranslate"><code>icad tx staking delegate $ICAD_VALOPER_ADDRESS 10000000uqck --from=$WALLET --chain-id=$ICAD_CHAIN_ID --gas=auto
</code></pre>
<p dir="auto">Redelegate stake</p>
<pre class="notranslate"><code>icad tx staking redelegate <srcValidatorAddress> <destValidatorAddress> 10000000uqck --from=$WALLET --chain-id=$ICAD_CHAIN_ID --gas=auto
</code></pre>
<p dir="auto">Withdraw semua rewards</p>
<pre class="notranslate"><code>icad tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$ICAD_CHAIN_ID --gas=auto
</code></pre>
<p dir="auto">Withdraw rewards dengan komisi</p>
<pre class="notranslate"><code>icad tx distribution withdraw-rewards $ICAD_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$ICAD_CHAIN_ID
</code></pre>
<p dir="auto">Edit validator</p>
<pre class="notranslate"><code>icad tx staking edit-validator \
  --moniker=$NODENAME \
  --identity="" \
  --website="" \
  --details="NAGA DAO" \
  --chain-id=$ICAD_CHAIN_ID \
  --from=$WALLET
</code></pre>
<p dir="auto">Unjail validator</p>
<pre class="notranslate"><code>icad tx slashing unjail \
  --broadcast-mode=block \
  --from=$WALLET \
  --chain-id=$ICAD_CHAIN_ID \
  --gas=auto
</code></pre>
