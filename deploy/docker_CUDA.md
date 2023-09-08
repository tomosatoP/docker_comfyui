# Ubuntu_WebSD 上に CUDA 対応 docker (rootless mode) の構築 
`CUDA` 対応の `docker (rootless mode)` 環境を構築する。
- username: comfyui
- hostname: host
- distributionname: Ubuntu_WebSD
> 前提: [専用環境 Ubuntu_WebSD の構築](ubuntu_websd.md) が適用済み

## Ubuntu_WebSD で CUDA (nvidia GPU) の動作確認
https://docs.nvidia.com/cuda/wsl-user-guide/contents.html

~~~sh
# 動作確認のみ
comfyui@host:~$ nvidia-smi -L
| GPU 0: NVIDIA GeForce RTX 3060 (UUID: 略)
~~~

## CUDA 対応 docker (rootless mode) の構築
https://learn.microsoft.com/ja-jp/windows/wsl/tutorials/gpu-compute#setting-up-nvidia-cuda-with-docker

### docker (rootless mode) の手動インストールとサービス有効化
関連パッケージのインストール
~~~sh
comfyui@host:~$ sudo apt install uidmap
~~~
docker 手動インストール
~~~sh
# docker (root mode) 手動インストール
comfyui@host:~$ curl https://get.docker.com | sh

# 念の為、docker (root mode) を停止
comfyui@host:~$ sudo systemctl disable --now docker.service docker.socket

# docker (rootless mode) 手動インストール
comfyui@host:~$ dockerd-rootless-setuptool.sh check
comfyui@host:~$ dockerd-rootless-setuptool.sh install --skip-iptables
~~~
DNS 設定
~~~sh
# 起動時に /etc/resolv.conf を自動更新しないように変更
comfyui@host:~$ sudo nano /etc/wsl.conf
~~~
~~~diff
+ [network]
+ generateResolvConf = false
~~~
~~~sh
comfyui@host:~$ sudo nano /etc/resolv.conf
~~~
~~~diff
- nameserver xxx.xxx.xxx.xxx
+ nameserver 8.8.8.8
~~~
> 再起動を推奨

docker デーモンの開始
~~~sh
comfyui@host:~$ systemctl --user daemon-reload
comfyui@host:~$ systemctl --user enable docker
comfyui@host:~$ systemctl --user start docker
~~~

### NVIDIA Container Toolkit をインストール
NVIDIA Container Toolkit リポジトリを設定
~~~sh
comfyui@host:~$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
comfyui@host:~$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-docker-keyring.gpg
comfyui@host:~$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-docker-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
~~~
NVIDIA ランタイム パッケージと依存関係をインストール
~~~sh
comfyui@host:~$ sudo apt update
comfyui@host:~$ sudo apt install -y nvidia-docker2
~~~
設定変更
~~~sh
# 非cgroups ユーザーを許可 
comfyui@host:~$ sudo nano /etc/nvidia-container-runtime/config.toml
~~~
~~~diff
- #no-cgroups = false
+ no-cgroups = true
~~~
動作確認
~~~sh
comfyui@host:~$ sudo docker run hello-world
comfyui@host:~$ sudo docker run -it --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi
~~~
---
[READMEに戻る](../README.md)
---
