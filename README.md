# Terraform AWS Project Template

## 概要

AWSリソースをTerraformで管理するプロジェクトを始めるためのテンプレートです。
Terraform、AWS CLI、TFLintをあらかじめ用意したDev Containerで、一貫した開発環境を提供します。

## 主な機能

- **Dev Container**: Terraform、AWS CLI、TFLintを含む開発環境
- **Terraform**: AWSプロバイダーとS3バックエンドの基本設定
- **TFLint**: AWSルールセットを利用したTerraformの静的解析
- **VS Code連携**: Terraformの保存時フォーマットとTFLintの自動実行

## 前提条件

ローカル開発には次のツールが必要です。

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/products/docker-desktop/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

Dev Containerを使わない場合は、Terraform、AWS CLI、TFLintをローカル環境にインストールしてください。

## 使用方法

1. GitHubでこのテンプレートから新しいリポジトリを作成します。
   1. このリポジトリの **Use this template** を選択します。
   2. **Create a new repository** を選択し、リポジトリ名と公開範囲を指定します。
2. 作成したリポジトリをローカルにクローンします。

   ```bash
   git clone https://github.com/<OWNER>/<REPOSITORY>.git
   cd <REPOSITORY>
   ```

3. VS Codeでリポジトリを開き、**Dev Containers: Reopen in Container** を実行します。
4. [src/providers.tf](src/providers.tf) のAWSリージョンとプロファイルを環境に合わせて変更します。
5. [src/backend.tf](src/backend.tf) のS3バケット名、stateファイルのキー、リージョンを変更します。

## ディレクトリ構成

```text
.
├── .devcontainer/             # Dev Containerの定義
├── .github/                   # Issue・Pull Request・Copilotの設定
├── docs/                      # プロジェクトの補足ドキュメント
├── src/                       # Terraformの構成ファイル
│   ├── backend.tf             # Terraform stateのS3バックエンド設定
│   ├── main.tf                # AWSリソースの定義
│   ├── providers.tf           # AWSプロバイダーの設定
│   ├── terraform.tf           # Terraformとプロバイダーのバージョン制約
│   ├── terraform.tfvars       # 変数値の例
│   ├── variables.tf           # 入力変数の定義
│   └── .tflint.hcl            # TFLintとAWSルールセットの設定
└── README.md                  # このファイル
```

## 開発手順

### Dev Containerを起動する

VS Codeでリポジトリを開き、コマンドパレットから **Dev Containers: Reopen in Container** を実行します。
コンテナにはTerraform、AWS CLI、TFLintがインストールされます。

### AWS認証情報を設定する

Dev Containerはホストの`~/.aws`ディレクトリをコンテナの`/home/vscode/.aws`へマウントします。
AWS CLIプロファイルを設定したうえで、[src/providers.tf](src/providers.tf) の`profile`を対応する名前に変更してください。

### 初期化と検証を実行する

リポジトリのルートディレクトリから実行します。

```bash
terraform fmt -check -recursive
terraform -chdir=src init -backend=false
terraform -chdir=src validate
tflint --chdir=src --init
tflint --chdir=src
```

`tflint --init`は、AWSルールセットを初めて利用するとき、およびルールセットのバージョンを変更したときに実行してください。

VS Codeでは`.tf`ファイルの保存時にもTFLintが実行されます。

### インフラ変更を確認する

バックエンド設定とAWS認証情報を設定した後、次のコマンドで変更予定を確認します。

```bash
terraform -chdir=src init
terraform -chdir=src plan
```

## カスタマイズ方法

- **プロジェクト名**: [devcontainer.json](.devcontainer/devcontainer.json) の`name`を変更します。
- **AWS設定**: [providers.tf](src/providers.tf) のリージョンとプロファイル、[backend.tf](src/backend.tf) のstate保存先を変更します。
- **Terraformリソース**: [main.tf](src/main.tf) に必要なAWSリソースを追加します。
- **変数**: [variables.tf](src/variables.tf) に変数を定義し、[terraform.tfvars](src/terraform.tfvars) に環境ごとの値を設定します。
- **プロバイダーのバージョン**: [terraform.tf](src/terraform.tf) の`required_providers`を変更します。
- **Lintルール**: [.tflint.hcl](src/.tflint.hcl) のルールやAWSルールセットのバージョンを調整します。


