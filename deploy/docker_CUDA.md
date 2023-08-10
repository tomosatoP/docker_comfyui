# Ubuntu_WebSD 上に CUDA 対応 docker の構築 
`CUDA` 対応の `docker` 環境を構築する。
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

## CUDA 対応 docker の構築
https://learn.microsoft.com/ja-jp/windows/wsl/tutorials/gpu-compute#setting-up-nvidia-cuda-with-docker

### docker の手動インストールとサービス有効化
~~~sh
# docker 手動インストール
comfyui@host:~$ curl https://get.docker.com | sh
# docker デーモンの開始
comfyui@host:~$ sudo systemctl daemon-reload
comfyui@host:~$ sudo systemctl enable docker
comfyui@host:~$ sudo systemctl start docker
~~~

### NVIDIA Container Toolkit をインストール
~~~sh
# NVIDIA Container Toolkit リポジトリを設定
comfyui@host:~$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
comfyui@host:~$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-docker-keyring.gpg
comfyui@host:~$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-docker-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
~~~
~~~sh
# NVIDIA ランタイム パッケージと依存関係をインストール
comfyui@host:~$ sudo apt update
comfyui@host:~$ sudo apt install -y nvidia-docker2
~~~
~~~sh
# 動作確認
comfyui@host:~$ sudo docker run hello-world
comfyui@host:~$ sudo docker run -it --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi
~~~
---
[READMEに戻る](../README.md)
---