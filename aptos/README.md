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
    
<p dir="auto">Pake Command Dibawah untuk otomatis sat set sat set:</p>
<div class="snippet-clipboard-content notranslate position-relative overflow-auto"><pre class="notranslate"><code>wget -qO aptos.sh https://github.com/ApizGans/Testnet-Node/blob/main/aptos/aptos.sh &amp;&amp; chmod +x aptos.sh &amp;&amp; ./aptos.sh
    </code></pre><div class="zeroclipboard-container position-absolute right-0 top-0">
        <clipboard-copy aria-label="Copy" class="ClipboardButton btn js-clipboard-copy m-2 p-0 tooltipped-no-delay" data-copy-feedback="Copied!" data-tooltip-direction="w" value="wget -qO aptos.sh https://github.com/ApizGans/Testnet-Node/blob/main/aptos/aptos.sh &amp;&amp; chmod +x aptos.sh &amp;&amp; ./aptos.sh" tabindex="0" role="button" style="display: none;">
          <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon m-2">
        <path fill-rule="evenodd" d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 010 1.5h-1.5a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-1.5a.75.75 0 011.5 0v1.5A1.75 1.75 0 019.25 16h-7.5A1.75 1.75 0 010 14.25v-7.5z"></path><path fill-rule="evenodd" d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0114.25 11h-7.5A1.75 1.75 0 015 9.25v-7.5zm1.75-.25a.25.25 0 00-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 00.25-.25v-7.5a.25.25 0 00-.25-.25h-7.5z"></path>
    </svg>
          <svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-check js-clipboard-check-icon color-fg-success d-none m-2">
        <path fill-rule="evenodd" d="M13.78 4.22a.75.75 0 010 1.06l-7.25 7.25a.75.75 0 01-1.06 0L2.22 9.28a.75.75 0 011.06-1.06L6 10.94l6.72-6.72a.75.75 0 011.06 0z"></path>
    </svg>
        </clipboard-copy>
      </div></div>   
      
