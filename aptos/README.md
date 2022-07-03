<p align="center" dir="auto">
    <a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/50621007/165930080-4f541b46-1ae3-461c-acc9-de72d7ab93b7.png"><img width="100" height="auto" src="https://user-images.githubusercontent.com/50621007/165930080-4f541b46-1ae3-461c-acc9-de72d7ab93b7.png" style="max-width: 100%;"></a>
  </p>
  <h1 dir="auto"><a id="user-content-aptos-validator-node-setup-for-ait2-updated-30062022" class="anchor" aria-hidden="true" href="#aptos-validator-node-setup-for-ait2-updated-30062022"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Aptos validator node setup buat AIT2</h1>
  <p dir="auto">Dokumen Asli:</p>
  <blockquote>
    <p dir="auto"><a href="https://aptos.dev/tutorials/validator-node/intro" rel="nofollow">Aptos </a><br>
    <a href="https://node.aptos.zvalid.com/" rel="nofollow">Node Tester by Andrew | zValid</a></p>
    </blockquote>
    <h4 dir="auto"><a id="user-content-for-running-an-aptos-node-on-incentivized-testnet-we-recommend-the-following" class="anchor" aria-hidden="true" href="#for-running-an-aptos-node-on-incentivized-testnet-we-recommend-the-following"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Buat Running aptos gua rekomendasiin spek seperti ini:</h4>
    <ul dir="auto">
        <li>CPU: 4 cores (Intel Xeon Skylake or newer)</li>
        <li>Memory: 8GiB RAM</li>
        <li>Storage: 300GB </li>
    </ul>
<h2 dir="auto"><a id="user-content-post-installation" class="anchor" aria-hidden="true" href="#post-installation"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Instalasi</h2>    
<p dir="auto">Pake Command Dibawah untuk otomatis sat set sat set:</p>
<pre class="notranslate"><code>wget -qO aptos.sh https://github.com/ApizGans/Testnet-Node/blob/main/aptos/aptos.sh &amp;&amp; chmod +x aptos.sh &amp;&amp; ./aptos.sh
    </code></pre>
<p dir="auto">Ketika Instalasi Selesai Masukan Command ini:</p>     
<pre class="notranslate"><code>source $HOME/.bash_profile</code></pre>
<h2 dir="auto"> Cara Cek Node </h2>