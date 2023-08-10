# docker コンテナとして ComfyUI をデプロイ `編集中`
docker コンテナとして `ComfyUI` をデプロイする。
- username: comfyui
- hostname: host
- distributionname: Ubuntu_WebSD
> 前提: [Ubuntu_WebSD 上に CUDA 対応 docker の構築](docker_CUDA.md) が適用済み

## ComfyUI をデプロイ
ダウンロード
~~~sh
comfyui@host:~ $ git clone --depth 1 https://github.com/tomosatoP/docker-comfyui.git
comfyui@host:~/docker-comfyui $ bash script/download_files_comfyui.sh
comfyui@host:~/docker-comfyui $ bash script/download_files_models.sh
comfyui@host:~/docker-comfyui $ ln -s script/launch_comfyui.sh ~/launch_comfyui.sh
~~~

docker コンテナ作成と開始 (detach mode)
~~~sh
comfyui@host:~/docker-comfyui $ sudo docker compose up --build -d
~~~

> `docker-comfyui/script_for_windows/comfyui.ps1` を適当なフォルダ (デスクトップとか) にコピー
>> ファイルの内容 (username, distributionname) は適宜に編集


## メンテナンス
更新
> ComfyUI のアップデート間隔が短いので、定期的に更新するのがお勧め
~~~sh
# 停止と削除
comfyui@host:~/docker-comfyui $ sudo docker compose down --rmi all
comfyui@host:~/docker-comfyui $ sudo docker system prune
# 作成と開始 (detach mode)
comfyui@host:~/docker-comfyui $ sudo docker compose up --build -d
~~~
---
[READMEに戻る](../README.md)
---