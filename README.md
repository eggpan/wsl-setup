# WSL環境をセットアップするスクリプト

## 使い方
`curl https://raw.githubusercontent.com/eggpan/wsl-setup/master/setup.sh | bash`

## 実行内容
* APTリポジトリをjpに変更
* aptitudeのインストール
* Gitのインストール
* language-pack-jaのインストール
* pipのインストール
* Ansibleのインストール  
※APTだとバージョンが若干古いのでpipで最新版Ansibleを入れてます

以下はAnsibleで実行
* APTリポジトリにppa:ondrej/phpを追加
* PHP(最新 / 7.2)のインストール
