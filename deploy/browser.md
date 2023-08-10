# ブラウザ (microsoft-edge) を導入
`WSLg` 対応の ブラウザ `microsoft-edge` を導入する。
ついでに、`Nautilus` も。
- username: comfyui
- hostname: host
- distributionname: Ubuntu_WebSD
> 前提: [専用環境 Ubuntu_WebSD の構築](ubuntu_websd.md) が適用済み, WSLg が利用可能。

## microsoft-edge をインストール

[ダウンロードページ](https://www.microsoft.com/ja-jp/edge/download)から [Linux 用 .deb ファイル](https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_115.0.1901.188-1_amd64.deb)をダウンロード

~~~sh
comfyui@host:~ $ sudo apt update
comfyui@host:~ $ sudo apt full-upgrade -y
# 日本語フォントをインストール
comfyui@host:~ $ sudo apt install -y fonts-ipaexfont
# microsoft-edge をインストール
comfyui@host:~ $ sudo apt install (ダウンロードした .deb ファイルを指定)
comfyui@host:~ $ sudo apt install nautilus
# 動作確認
comfyui@host:~ $ microsoft-edge
~~~
---
[READMEに戻る](../README.md)
---
