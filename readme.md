# Ubuntu 12.04 Vagrant + Laravel4.1 + PHP 5.5.

このリポジトリはGithubの[bryannielsen/Laravel4-Vagrant](https://github.com/bryannielsen/Laravel4-Vagrant)のReadmeのみ訳した日本語フォークです。本体の提供は止めましたので、オリジナルを参照してください。Readmeの翻訳としてのみ、利用してください。

## 動作要件

ホストマシンで必要なソフトウェアです。

* VirtualBox - フリーな仮想化ソフトウェア [ダウンロード](https://www.virtualbox.org/wiki/Downloads)
* Vagrant **1.3+** - Virtualbox イメージ操作ツール [Vagrantトップページ](https://www.vagrantup.com) Downloadボタンをクリックしてください
* Git - ソース管理 [ダウンロード](http://git-scm.com/downloads)

## 準備

* このリポジトリをクローンします。`git clone git://github.com/HiroKws/Laravel4-Vagrant.git`
* 新しく生成されたディレクトリーに移動し、`vagrant up`を実行します。
* 最初に実行する時、Vagrantは仮想Boxイメージを取得する必要があります。転送速度は~300mb程度ですので、ダウンロード速度により多少の時間はかかります。
* 続いてVagrantはパペットを使い、基本的な仮想Boxに対しLAMP関係の設定をします。(数分かかります。)、それからComposerのapp中のcomposer.jsonで定義されている全てのパッケージを取得する必要がありますので、最初の準備ではもう少し時間がかかります。
* 全て上手く行ったかどうか確認するためには、ブラウザでhttp:://localhost:8888へアクセスしてください。

*注意：ホストOS上で、www/app/storageフォルダーのパーミッションを777に変更する必要があるかもしれません。*

例えば、`chmod -R 777 www/app/storage/`を実行します。


## 使用法

VagrantのBoxに関係した基本的な設定情報です。

### ポートフォワード

* 8888 - Apache
* 8889 - MySQL
* 5433 - PostgreSQL


### デフォルトMySQL/PostgreSQLデータベース

* ユーザ名: root
* パスワード: (空白)
* データベース名: database

### PHPmyAdmin

上記のユーザー情報で、ブラウザでhttp://localhost:8888/phpmyadminアクセスすることにより、PHPmyAdminが使用できます。

### PHP XDebug

XDebugはビルドに含まれていますが、 **デフォルトでは使用可能になっていません。** パフォーマンスに影響を与えるためです。

XDebugを有効にするには：

1. `puppet/manifests/phpbase.pp`の先頭を`$use_xdebug = "1"`に設定する
2. 続いて`vagrant up`でBoxの準備を行います。もし、既に準備済みであれば`vagrant provision`コマンドを使用してください。
3. これで、 **9001ポート** でXDebugが使用できます。

**XDebugツール**

* [MacGDBP](http://www.bluestatic.org/software/macgdbp/) - 無料のMac OSXツール
* [Codebug](http://www.codebugapp.com/) - 有料のMac OSXツール


_注目：全XDebugの設定は`puppet/modules/php/templates/php.ini.erb`の中のphp.iniテンプレートで変更可能です。_

### Vagrant

Vagrantには[英語で書かれた素晴らしいドキュメント](http://vagrantup.com/v1/docs/index.html) がありますが、いくつかのコマンドを紹介します。

* `vagrant up` 仮想マシンを開始し準備する
* `vagrant suspend` 基本的にマシンを'sleep'状態にします。バックアップを利用し再開するには`vagrant resume`を使用します。
* `vagrant halt` マシンをシャットダウンします。再開には`vagrant up`を実行します。
* `vagrant ssh` 仮想マシンへシェルアクセスします。

##### 仮想マシンのスペック

* OS     - Ubuntu 12.04
* Apache - 2.4.6
* PHP    - 5.5.4
* MySQL  - 5.5.32
* PostgreSQL - 9.1
* Beanstalkd - 1.4.6
* Redis - 2.2.12
* Memcached - 1.4.13


#### 日本語参照

* [VagrantのUbuntu12.04+Laravel4ボックス](http://kore1server.com/141/Vagrant%E3%81%AEUbuntu12.04%2BLaravel4%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9)
* [Laravel4 Boxをもっと便利に](http://kore1server.com/143/Laravel4+Box%E3%82%92%E3%82%82%E3%81%A3%E3%81%A8%E4%BE%BF%E5%88%A9%E3%81%AB)
