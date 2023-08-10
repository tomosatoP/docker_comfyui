# 専用環境 Ubuntu_WebSD の構築
クリーンな環境の `Ubuntu` を `WSL2` 上に作成する。
- username: comfyui
- hostname: host
- distributionname: Ubuntu_WebSD
> 前提: 既に WSL2 に Ubuntu がインストールされている。

---
## 注意事項
Windows PC に nvidia GPU に対応した[ドライバー](https://www.nvidia.co.jp/Download/index.aspx?lang=jp)をインストールしてあること。

---
## Ubuntu on WSL2
1. 既存の Ubuntu 環境をバックアップ
1. クリーンな環境を作成
1. クリーンな環境を複製
1. 環境変数の修正

### 既存の Ubuntu 環境をバックアップ
~~~sh
# 既存の Ubuntu の NAME を確認
PS C:\home> wsl --list --verbose 
|   NAME      STATE           VERSION
| * Ubuntu    Stopped         2
# 停止
PS C:\home> wsl --terminate Ubuntu
# tarファイルとしてバックアップ
PS C:\home> wsl --export Ubuntu C:\Ubuntu\Ubuntu.backup.tar
# 登録解除
PS C:\home> wsl --unregister Ubuntu
~~~
> 作業ディレクトリを C:\home としている。

### クリーンな環境を作成
- スタート > 設定 > アプリ > インストールされているアプリ > Ubuntu > 詳細オプション > リセット - リセット
> `リセット` は、Microsoft Store でインストールしたディストリビューションにのみ適用できる。
- スタート > Ubuntu
- ターミナルが起動するので、`ユーザー名 (comfyui)` と `パスワード` を設定する。 
> これでクリーンな環境の `Ubuntu` ができました。

### クリーンな環境を複製
~~~sh
# tarファイルとしてバックアップ
PS C:\home> wsl --export Ubuntu C:\Ubuntu\Ubuntu.origin.tar
# tarファイルから複製
# ディストリビューション名・フォルダの重複は不可
PS C:\home> wsl --import Ubuntu_WebSD C:\Ubuntu\Web_SD C:\Ubuntu\Ubuntu.origin.tar 
~~~

### 環境変数の修正
~~~sh
PS C:\home> wsl --distribution Ubuntu_WebSD --cd ~ --user comfyui
~~~
~~~sh
comfyui@host:~$ sudo nano /etc/profile
~~~
~~~diff
+ export LD_LIBRARY_PATH='/usr/lib/wsl/lib':LD_LIBRARY_PATH
~~~

この `Ubuntu_WebSD` を専用環境として運用する。
---
[READMEに戻る](../README.md)
---
## その他の主な wsl コマンド
> wsl --distribution \<Distro> --cd ~ --user \<UserName><br>
> wsl --export \<Distro> \<Filename> [Options]<br>
> wsl --import \<Distro> \<InstallLocation> \<Filename> [Options]<br>
> wsl --terminate \<Distro><br>
> wsl --unregister \<Distro><br>
> wsl --list --verbose<br>
> wsl --list --online<br>
> wsl --install [Distro] [Options...]
---
## 最新の LTS バージョンにアップグレードしたい場合
~~~sh
# ユーザー名:user, PC名:host
user@host:~$ sudo do-release-upgrade
~~~
---
## CUDA toolkit を入れたい場合
[ここを参照](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local)
~~~sh
# ユーザー名:user, PC名:host
user@host:~$ wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
user@host:~$ sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
user@host:~$ wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb
user@host:~$ sudo dpkg -i cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb
user@host:~$ sudo cp /var/cuda-repo-wsl-ubuntu-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
user@host:~$ sudo apt-get update
user@host:~$ sudo apt-get -y install cuda
~~~
---
## WSL イメージファイルのサイズ最適化
イメージファイル内の利用されなくった領域を開放する。

~~~sh
PS C:\home> wsl --shutdown
PS C:\home> diskpart
# CMDウィンドウに移行
DISKPART> select vdisk file="C:\Ubuntu\Web_SD\ext4.vhdx"
DISKPART> detail vdisk  # 処理前の状態
DISKPART> compact vdisk # 非利用領域の開放
DISKPART> detail vdisk  # 処理後の状態
DISKPART> detach vdisk  # 念の為に開放
DISKPART> exit
# ターミナルウィンドウに戻る
PS C:\home>
~~~
---