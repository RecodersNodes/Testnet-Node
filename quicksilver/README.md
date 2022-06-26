<p align="center" dir="auto">
  <a target="_blank" rel="noopener noreferrer" href="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png"><img height="100" src="https://user-images.githubusercontent.com/50621007/166148846-93575afe-e3ce-4ca5-a3f7-a21e8a8609cb.png" style="max-width: 100%;"></a>
</p>

<h1 dir="auto"><a id="user-content-quicksilver-node-setup-for-testnet--killerqueen-1" class="anchor" aria-hidden="true" href="#quicksilver-node-setup-for-testnet--killerqueen-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Cara Menjalankan Node Quicksilver Testnet — killerqueen-1</h1>

<p dir="auto">Dokumen Asli:</p>

<blockquote>
<ul dir="auto">
<li><a href="https://github.com/ingenuity-build/testnets">Validator setup instruksi</a></li>
</ul>
</blockquote>

<p dir="auto">Explorer:</p>
<blockquote>
<ul dir="auto">
<li><a href="https://quicksilver.explorers.guru/" rel="nofollow">https://quicksilver.explorers.guru/</a></li>
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
