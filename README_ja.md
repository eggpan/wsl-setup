## WSL2の開発環境をセットアップするスクリプト

## 使い方
`curl https://raw.githubusercontent.com/eggpan/wsl-setup/main/setup.sh | bash`

## 実行内容
- コマンド実行ユーザーがパスワードなしでsudoを実行できるように設定を変更
- aptリポジトリの国を変更
- pipをインストール
- Ansibleをインストール
(aptのバージョンが少し古いので、pipを使って最新版のAnsibleをインストールします)

Ansibleで以下を実行します。
- aptリポジトリに Docker / Google Chrome のリポジトリを追加
- docker-ceをインストール
  - 実行ユーザーにdockerコマンド実行権限を追加
