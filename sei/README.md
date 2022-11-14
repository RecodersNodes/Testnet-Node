<p align="center" dir="auto">
  <a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/50621007/169664551-39020c2e-fa95-483b-916b-c52ce4cb907c.png"><img height="100" src="https://user-images.githubusercontent.com/50621007/169664551-39020c2e-fa95-483b-916b-c52ce4cb907c.png" style="max-width: 100%;"></a>
</p>

<h1 dir="auto"><a id="user-content-sei-node-setup-for-testnet--sei-testnet-2" class="anchor" aria-hidden="true" href="#sei-node-setup-for-testnet--sei-testnet-2"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Cara Menjalankan Node Sei Testnet — Sei-Testnet-2</h1>

<p dir="auto">Dokumen Asli:</p>

<blockquote>
<ul dir="auto">
<li><a href="https://docs.seinetwork.io/nodes-and-validators/joining-testnets">Validator setup instruksi</a></li>
</ul>
</blockquote>

<p dir="auto">Explorer:</p>
<blockquote>
<ul dir="auto">
<li><a href="https://sei.explorers.guru/" rel="nofollow">Dari Node Guru</a></li>
</ul>
</blockquote>

<h2 dir="auto"><a id="user-content-hardware-requirements" class="anchor" aria-hidden="true" href="#hardware-requirements"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Spek VPS Yang Dibutuhkan</h2>
<p dir="auto">Seperti Jaringan Cosmos Yang Lain, Speknya Lumayan Menguras Dompet :V.</p>
<h3 dir="auto"><a id="user-content-minimum-hardware-requirements" class="anchor" aria-hidden="true" href="#minimum-hardware-requirements"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Minimal Spek</h3>
<ul dir="auto">
<li>3x CPUs; the faster clock speed the better</li>
<li>4GB RAM</li>
<li>80GB Disk</li>
<li>Permanent Internet connection (Internet Harus Kenceng Sudah Pasti Inet VPS kenceng)</li>
</ul>

<h3 dir="auto"><a id="user-content-recommended-hardware-requirements" class="anchor" aria-hidden="true" href="#recommended-hardware-requirements"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Rekomendasi Spek</h3>
<ul dir="auto">
<li>4x CPUs; the faster clock speed the better</li>
<li>8GB RAM</li>
<li>200GB of storage (SSD atau NVME)</li>
<li>Permanent Internet connection (Internet Harus Kenceng Sudah Pasti Inet VPS kenceng)</li>
</ul>
<h2 dir="auto"><a id="user-content-set-up-your-quicksilver-fullnode" class="anchor" aria-hidden="true" href="#set-up-your-SEI-fullnode"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Set up your SEI fullnode</h2>
<h3 dir="auto"><a id="user-content-option-1-automatic" class="anchor" aria-hidden="true" href="#option-1-automatic"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Otomatis</h3>
<p dir="auto">Lu bisa setup otomatis menggunakan skrip dibawah ini dengan sat set sat set.</p>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto"><pre class="notranslate"><code>wget -O sei.sh https://raw.githubusercontent.com/RecodersNodes/Testnet-Node/main/sei/sei.sh &amp;&amp; chmod +x sei.sh &amp;&amp; ./sei.sh
</code></pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="wget -O sei.sh https://raw.githubusercontent.com/RecodersNodes/Testnet-Node/main/sei/sei.sh &amp;&amp; chmod +x sei.sh &amp;&amp; ./sei.sh" tabindex="0" role="button" style="display: inherit;">
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
    <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
</svg>
      <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
    <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
</svg>
    </clipboard-copy>
  </div></div>
  <h2 dir="auto"><a id="user-content-optimize-validator-config" class="anchor" aria-hidden="true" href="#optimize-validator-config"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Optimisasi validator config</h2>
<p dir="auto"><a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/50621007/176101397-cbc216a4-1c11-4d1e-9e1d-33a84280d508.png"><img src="https://user-images.githubusercontent.com/50621007/176101397-cbc216a4-1c11-4d1e-9e1d-33a84280d508.png" alt="image" style="max-width: 100%;"></a></p>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto"><pre class="notranslate"><code>wget -qO optimize-configs.sh https://raw.githubusercontent.com/sei-protocol/testnet/main/sei-testnet-2/optimize-configs.sh
sudo chmod +x optimize-configs.sh &amp;&amp; ./optimize-configs.sh
sudo systemctl restart seid
</code></pre><div class="zeroclipboard-container position-absolute right-0 top-0">
    <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="wget -qO optimize-configs.sh https://raw.githubusercontent.com/sei-protocol/testnet/main/sei-testnet-2/optimize-configs.sh
sudo chmod +x optimize-configs.sh &amp;&amp; ./optimize-configs.sh
sudo systemctl restart seid" tabindex="0" role="button">
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
<pre class="notranslate"><code>seid status 2&gt;&amp;1 | jq .SyncInfo
</code></pre>
<p dir="auto">Buat Bikin Wallet.Mnemonicnya disave dong sayangku nanti hilang gagal jp</p>
<pre class="notranslate"><code>seid keys add $WALLET
</code></pre>
<p dir="auto">Kalau lu dah buat sebelumya ya import aja pake ini</p>
<pre class="notranslate"><code>seid keys add $WALLET --recover
</code></pre>
<p dir="auto">buat cek list wallet</p>
<pre class="notranslate"><code>seid keys list
</code></pre>
<p dir="auto">Ketik dibawah ini buat tambah wallet sama address validator ke system biar enak kalau ga mau pake ya terah lo anjg</p>
<pre class="notranslate"><code>SEI_WALLET_ADDRESS=$(seid keys show $WALLET -a)
SEI_VALOPER_ADDRESS=$(seid keys show $WALLET --bech val -a)
echo 'export SEI_WALLET_ADDRESS='${SEI_WALLET_ADDRESS} &gt;&gt; $HOME/.bash_profile
echo 'export SEI_VALOPER_ADDRESS='${SEI_VALOPER_ADDRESS} &gt;&gt; $HOME/.bash_profile
source $HOME/.bash_profile
</code></pre>
<h3 dir="auto"><a id="user-content-fund-your-wallet" class="anchor" aria-hidden="true" href="#fund-your-wallet"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Isi Wallet Lu biar bisa buat validator</h3>
<p dir="auto">masuk discordnya dulu link ada di twitternya. kalau udah masuk faucet ke channel dibawah ini</p>
<ul dir="auto">
<li><strong>#testnet-faucet</strong> buat SEI</li>
</ul>
<pre class="notranslate"><code>$request &lt;ADDRESS WALLET ELU&gt; killerqueen
</code></pre>
<p dir="auto">Buat cek balance wallet elo:</p>
<pre class="notranslate"><code>seid query bank balances $SEI_WALLET_ADDRESS
</code></pre>
<blockquote>
<p dir="auto">kalau ga muncul berarti node lu belom sync</p>
</blockquote>
<p dir="auto">command buat validator:</p>
<pre class="notranslate"><code>seid tx staking create-validator \
  --amount 1000000usei \
  --from $WALLET \
  --commission-max-change-rate "0.01" \
  --commission-max-rate "0.2" \
  --commission-rate "0.07" \
  --min-self-delegation "1" \
  --pubkey  $(seid tendermint show-validator) \
  --moniker $NODENAME \
  --chain-id $SEI_CHAIN_ID
</code></pre>
<h2 dir="auto"><a id="user-content-usefull-commands" class="anchor" aria-hidden="true" href="#usefull-commands"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Kumpulan Command</h2>
<p dir="auto">Cek Log</p>
<pre class="notranslate"><code>journalctl -fu seid -o cat
</code></pre>
<p dir="auto">Mulai Service</p>
<pre class="notranslate"><code>sudo systemctl start seid
</code></pre>
<p dir="auto">stop Service</p>
<pre class="notranslate"><code>sudo systemctl stop seid
</code></pre>
<p dir="auto">Restart Service</p>
<pre class="notranslate"><code>sudo systemctl Restart seid
</code></pre>
<p dir="auto">Synchronization info</p>
<pre class="notranslate"><code>seid status 2>&1 | jq .SyncInfo
</code></pre>
<p dir="auto">Validator info</p>
<pre class="notranslate"><code>seid status 2>&1 | jq .ValidatorInfo
</code></pre>
<p dir="auto">Node info</p>
<pre class="notranslate"><code>seid status 2>&1 | jq .NodeInfo
</code></pre>
<p dir="auto">Liat node id</p>
<pre class="notranslate"><code>seid tendermint show-node-id
</code></pre>
<p dir="auto">Kirim Token</p>
<pre class="notranslate"><code>seid tx bank send $SEI_WALLET_ADDRESS <TO_SEI_WALLET_ADDRESS> <JUMLAHTOKEN>usei
</code></pre>
<p dir="auto">Voting</p>
<pre class="notranslate"><code>seid tx gov vote 1 yes --from $WALLET --chain-id=$SEI_CHAIN_ID
</code></pre>
<p dir="auto">Delegate stake</p>
<pre class="notranslate"><code>seid tx staking delegate $SEI_VALOPER_ADDRESS 10000000usei --from=$WALLET --chain-id=$SEI_CHAIN_ID --gas=auto
</code></pre>
<p dir="auto">Redelegate stake</p>
<pre class="notranslate"><code>seid tx staking redelegate <srcValidatorAddress> <destValidatorAddress> 10000000usei --from=$WALLET --chain-id=$SEI_CHAIN_ID --gas=auto
</code></pre>
<p dir="auto">Withdraw semua rewards</p>
<pre class="notranslate"><code>seid tx distribution withdraw-all-rewards --from=$WALLET --chain-id=$SEI_CHAIN_ID --gas=auto
</code></pre>
<p dir="auto">Withdraw rewards dengan komisi</p>
<pre class="notranslate"><code>seid tx distribution withdraw-rewards $SEI_VALOPER_ADDRESS --from=$WALLET --commission --chain-id=$SEI_CHAIN_ID
</code></pre>
<p dir="auto">Edit validator</p>
<pre class="notranslate"><code>seid tx staking edit-validator \
  --moniker=$NODENAME \
  --identity="" \
  --website="" \
  --details="NAGA DAO" \
  --chain-id=$SEI_CHAIN_ID \
  --from=$WALLET
</code></pre>
<p dir="auto">Unjail validator</p>
<pre class="notranslate"><code>seid tx slashing unjail \
  --broadcast-mode=block \
  --from=$WALLET \
  --chain-id=$SEI_CHAIN_ID \
  --gas=auto
</code></pre>
