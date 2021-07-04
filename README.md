# WSL環境をセットアップするスクリプト

## 使い方
`curl https://raw.githubusercontent.com/eggpan/wsl-setup/master/setup.sh | bash`

## 実行内容
* APTリポジトリをjpに変更
* aptitudeのインストール
* Gitのインストール
* pipのインストール
* Ansibleのインストール  
※APTだとバージョンが若干古いのでpipで最新版Ansibleを入れてます

以下はAnsibleで実行
* APTリポジトリに php / docker / nodejs / yarn のリポジトリを追加
* language-pack-jaのインストール
* PHP8.0 のインストール
* Node.js のインストール
* Yarn のインストール
