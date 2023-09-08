# ComfyUI を WSL-Ubuntu GUI で使う
Stable Diffusion (画像生成 AI) の WebUI である ComfyUI (with ComfyUI-Manager) を Windows アプリみたいに使えるようにする。

## 構成
### PC 環境
- Windows 11 Pro
- NVIDIA GeForce RTX 3060
### wsl-ubuntu, wslg 環境
- username: comfyui
- hostname: host
- distributionname: Ubuntu_WebSD

## インストールの手順
1. [専用環境 Ubuntu_WebSD の構築](deploy/ubuntu_websd.md) - クリーンな wsl-ubuntu 環境の用意
1. [Ubuntu_WebSD 上に CUDA 対応 docker の構築](deploy/docker_CUDA.md) - CUDA 対応の docker を導入
1. [ブラウザ (microsoft-edge) を導入](deploy/browser.md) - ComfyUI 用ブラウザの導入
1. [docker コンテナとして ComfyUI をデプロイ](deploy/comfyui.md) - ComfyUI を `docker-comfyui` にデプロイ

## 使い方の簡単な説明

### 起動
[comfyui.ps1](script_for_windows/comfyui.ps1) を適当なフォルダ (デスクトップとか) にコピー、
`PowerShell で実行` で起動する。
> デフォルトのセキュリティ設定では、`ps1` ファイルを直接に起動することができません。

### ワークフローのコピー
ホームページ [ComfyUI examples](https://comfyanonymous.github.io/ComfyUI_examples/) 内の画像を `ドラッグ＆ドロップ` して、`ワークフロー` をコピーする。 

### 他の使い方
この他の使い方は [ComfyUI Community Manual](https://blenderneko.github.io/ComfyUI-docs/) を参照。

ComfyUI は素晴らしい。[comfyanonymous](https://github.com/comfyanonymous) さんに感謝を。
---
