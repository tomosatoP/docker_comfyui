# docker コンテナとして ComfyUI をデプロイ `編集中`
docker コンテナとして `ComfyUI` をデプロイする。
- username: comfyui
- hostname: host
- distributionname: Ubuntu_WebSD
> 前提: [Ubuntu_WebSD 上に CUDA 対応 docker の構築](docker_CUDA.md) が適用済み

## ComfyUI をデプロイ
ダウンロード
~~~sh
comfyui@host:~ $ git clone --depth 1 https://github.com/tomosatoP/docker_comfyui.git
comfyui@host:~/docker_comfyui $ git submodule update
comfyui@host:~/docker_comfyui $ bash script/download_models.sh
comfyui@host:~/docker_comfyui $ ln -s script/launch_comfyui.sh ~/launch_comfyui.sh
~~~

docker コンテナ作成と開始 (detach mode)
~~~sh
comfyui@host:~/docker_comfyui $ sudo docker compose up --build -d
~~~

> `docker_comfyui/script_for_windows/comfyui.ps1` を適当なフォルダ (デスクトップとか) にコピー
>> ファイルの内容 (username, distributionname) は適宜に編集


## メンテナンス
更新
> ComfyUI のアップデート間隔が短いので、定期的に更新するのがお勧め
~~~sh
# 停止と削除
comfyui@host:~/docker_comfyui $ sudo docker compose down --rmi all
comfyui@host:~/docker_comfyui $ sudo docker system prune
# 作成と開始 (detach mode)
comfyui@host:~/docker_comfyui $ git submodule update
comfyui@host:~/docker_comfyui $ sudo docker compose up --build -d
~~~
---
[READMEに戻る](../README.md)
---

## サブモジュール 
まず github にリモートリポジトリを作って、 README.md, LICENCE, .gitignore 等をおく。
ローカルリポジトリに add する。
~~~sh
# initialize
comfyui@host:~ $ git config username <unsername>
comfyui@host:~ $ git config usermailen <mailadress>
comfyui@host:~/docker_comfyui $ git init

# ssh の場合: sshkey が必要
comfyui@host:~/docker_comfyui $ git remote add origin git@github.com:tomosatoP/docker_comfyui.git

# https の場合: 個人用アクセストークンが必要
comfyui@host:~/docker_comfyui $ git remote add origin https://github.com/tomosatoP/docker_comfyui.git

comfyui@host:~/docker_comfyui $ git pull origin main
comfyui@host:~/docker_comfyui $ git remote -v
comfyui@host:~/docker_comfyui $ git status
~~~
サブモジュールを追加する。
~~~sh
# add submodule
comfyui@host:~/docker_comfyui $ git submodule add https://github.com/comfyanonymous/ComfyUI.git comfyui
# pull all submodule
comfyui@host:~/docker_comfyui $ git submodule update
# commit
comfyui@host:~/docker_comfyui $ git commit -m "update submodule"
# push 
comfyui@host:~/docker_comfyui $ git push origin main
~~~
