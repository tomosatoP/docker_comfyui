# GitHub を使ったプロジェクト管理

## ローカルの環境構築
~~~sh
user@host:~ $ git config --global user.name [username]
user@host:~ $ git config --global user.email [useremailaddress]
~~~
## GitHub への SSH ログイン認証
~~~sh
user@host:~ $ gh auth login
~~~
|質問(?)、指示(!, -)、確認(✓)|選択、回答|
|---|---|
|? What account do you want to log into?|GitHub.com|
|? What is your preferred protocol for Git operations?|SSH|
|? Generate a new SSH key to add to your GitHub account? (Y/n)|y|
|? Enter a passphrase for your new SSH key (Optional)|*********|
|? How would you like to authenticate GitHub CLI?|Login with a web browser|
|! First copy your one-time code: \*\*\*\*-****|one-time code をメモ|
|- Press Enter to open github.com in your browser...|Enter を押す(ブラウザ起動)<br>one-time code を入力<br>GitHub で認証|
|✓ Authentication complete. Press Enter to continue...|Enter を押す|
|||
|- gh config set -h github.com git_protocol ssh||
|✓ Configured git protocol||
|✓ Uploaded the SSH key to your GitHub account: [公開鍵ファイル名]||
|✓ Logged in as [username]||
> 途中で Web ブラウザを起動することになるので、直接に起動可能な Web ブラウザが必須<br>
> デフォルトでは `~/.ssh/` に公開鍵と秘密鍵のファイルが配置される<br>
> [Github のホームページ](https://github.com/settings/keys)で認証鍵の登録を確認しておく
---
# ローカルリポジトリの管理

## GitHub にリモートレポジトリ([username]/[project])を作成
README.md, LICENSE, .gitignore などを簡単に作れるので

## ローカルに配置
リモート名は、origin
~~~sh
user@host:~/[project] $ git init
user@host:~/[project] $ git remote add origin git@github.com:[username]/[project].git
# ローカルに取り込み
# branch(remote): origin/main -> branch(local): main
user@host:~/[project] $ git pull origin main
user@host:~/[project] $ git remote -v
user@host:~/[project] $ git status
~~~

## タグ付け
`tagname` はバージョン番号 (v1.0.0) とかにすると解り易い
~~~sh
# 軽量版 tag
user@host:~/[project] $ git tag [tagname]
# 注釈付き tag
user@host:~/[project] $ git tag -a [tagname] -m [comment]
# リモートリポジトリに反映
user@host:~/[project] $ git push origin [tagname]
~~~

## ブランチ
### 作成
~~~sh
user@home:~/[project] $ git branch [branch1]
user@home:~/[project] $ git branch
~~~
### \[branch1] に移動
~~~sh
user@home:~/[project] $ git checkout [branch1]
user@home:~/[project] $ git branch
~~~
### \[branch1] をメインブランチに結合
~~~sh
user@home:~/[project] $ git checkout main
user@home:~/[project] $ git branch
user@home:~/[project] $ git merge [branch1]
~~~

## リモートリポジトリ→ローカルリポジトリ
~~~sh
# pull
# branch(remote): origin/main -> branch(local): main
user@host:~/[project] $ git pull origin main
user@host:~/[project] $ git remote -v
user@host:~/[project] $ git status
~~~

## ローカルリポジトリ→リモートリポジトリ
~~~sh
# push
# branch(remote): origin/main <- branch(local): main
user@host:~/[project] $ git add <file>
user@host:~/[project] $ git commit -m "add <file>"
user@host:~/[project] $ git push origin main
~~~
---
# サブモジュール の管理

## サブモジュールを追加
[submodule_username]/[submodule_project]<br>
branch: main
~~~sh
# ローカルに追加
user@host:~/[project] $ git submodule add https://github.com/[submodule_username]/[submodule_project].git [submodule_path]
user@host:~/[project] $ git submodule update --init --recursive

# リモートに反映
# branch(remote): origin/min <- branch(local): main
user@host:~/[project] $ git commit -m "add submodule"
user@host:~/[project] $ git push origin main
~~~

## ローカルにサブモジュール更新を取り込み
~~~sh
user@host:~/[project] $ git submodule update --remote --recursive
user@host:~/[project] $ git add [submodule_path]
user@host:~/[project] $ git commit -m "update submodule"
~~~
---