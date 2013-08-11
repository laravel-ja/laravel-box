# Ubuntu 12.04 Vagrant + [Laravel4](http://four.laravel.com)+ PHP 5.4.

このリポジトリはGithubの[bryannielsen/Laravel4-Vagrant](https://github.com/bryannielsen/Laravel4-Vagrant)の日本語フォークです。以下の変更を加えてあります。

* `vagrant up`時にフェッチエラーが発生時、スクリプトが正常に終了しないため、Vagrantfileでapt-get...fix-missingを実行するように追加（問い合わせに対し、作者の方が答えて下さった内容を適用しました。）
* Laravelインストール時の依存の不具合を修正
* ポート番号を55555〜に修正（オリジナルで使用されているポート番号8888〜は[LANAで登録済](http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.txt)）
* 自分好みの変更を簡単に付け加えられるように、mySetup.shを追加しました。いくつかのパッケージを取り込むサンプルコードが入れてあります。if〜fiのブロック間を、アンコメントしてご利用ください。
* 一度作成した仮想マシンを再パッケージし使用する場合のサンプルVagrantfileをVagrantfile2として追加しました。
* 仮想マシンのディレクトリー以外からsuspend、Vagrantコマンドを実行するlinuxのbashスクリプトを追加しました。

## 動作要件

ホストマシンで必要なソフトウェアです。

* VirtualBox - フリーな仮想化ソフトウェア [ダウンロード](https://www.virtualbox.org/wiki/Downloads)
* Vagrant - Virtualbox イメージ操作ツール [Vagrantトップページ](https://www.vagrantup.com) Downloadボタンをクリックしてください
* Git - ソース管理 [ダウンロード](http://git-scm.com/downloads)

## 準備

* このリポジトリをクローンします。`git clone git://github.com/HiroKws/Laravel4-Vagrant.git`
* 新しく生成されたディレクトリーに移動し、`vagrant up`を実行します。
* 最初に実行する時、Vagrantは仮想Boxイメージを取得する必要があります。転送速度は~300mb程度ですので、ダウンロード速度により多少の時間はかかります。
* 続いてVagrantはパペットを使い、基本的な仮想Boxに対しLAMP関係の設定をします。(数分かかります。)、それからComposerのapp中のcomposer.jsonで定義されている全てのパッケージを取得する必要がありますので、最初の準備ではもう少し時間がかかります。
* 全て上手く行ったかどうか確認するためには、ブラウザでhttp:://localhost:55555へアクセスしてください。

## 使用法

VagrantのBoxに関係した基本的な設定情報です。

### ポートフォワード

* 55555 - Apache
* 55556 - MySQL
* 55557 - PostgreSQL


### デフォルトMySQL/PostgreSQLデータベース

* User: root
* Password: (空白)
* DB Name: database

### PHPmyAdmin

上記のユーザー情報で、ブラウザでhttp://localhost:55555/phpmyadminアクセスすることにより、PHPmyAdminが使用できます。

### PHP XDebug

XDebugはビルドに含まれていますが、 **デフォルトでは使用可能にしていません。** パフォーマンスに影響を与えるためです。

#### XDebugを有効にする

1. `puppet/manifests/phpbase.pp`の先頭を`$use_xdebug = "1"`に設定する
2. 続いて`vagrant up`でBoxの準備を行います。もし、既に準備済みであれば`vagrant provision`コマンドを使用してください。
3. これで、 **9001ポート** でXDebugが使用できます。

**XDebugツール**

* [SublimeXDebug](https://github.com/Kindari/SublimeXdebug) - 無料のSublimeTextプラグイン
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
* Apache - 2.2.22
* PHP    - 5.4.17
* MySQL  - 5.5.24
* PostgreSQL - 9.1
* Beanstalkd - 1.4.6
* Redis - 2.2.12
* Memcached - 1.4.13

#### 日本語版追記

試行錯誤の結果です。上手くupできないときは以下の方法をお試しください。

1. 念の為、vagrant haltを実行（仮想マシンを停止させる）
2. 念の為、vagrant destroyを実行（仮想マシンを削除する）
3. 念の為、vagrant box remove precise32 virtualboxを実行（Vagrantにより保存されているPrecise32 boxをパージする）
4. vagrant upを実行

##### 追加設定スクリプト

mySetup.shを追加しました。Bashスクリプトです。

パペットなどの知識がなくてもVagrantは設定可能です。シェルでできることはスクリプトに記述してしまえば、そのまま実行されます。もちろん、ルート権限でです。

普通にコマンドライン操作で設定ができる方でしたら、わざわざ追加の学習コストを払わなくても、追加で行いたい操作をこのスクリプトに記述すれば、オリジナルの設定の最後に実行されますので、出来上がった仮想マシンに反映されます。

ただし、毎回実行されます。if文などで制御してください。コンポーサーのパッケージを取り込むサンプルコードを入れてあります。if〜fiブロック間をアンコメントして、ご利用ください。

##### 追加スクリプト

Vagrantを使いこなす方であれば余計なお世話になるかも知れませんが、仮想マシンの操作をVagrantfileが存在するディレクトリー以外から実行するためのBashスクリプトを追加しています。

execinは`vagrant`コマンドをそのままシェルの存在するディレクトリーで実行します。例えば/home/user/vagrant-laravelにVagrantfileが存在するならば、`/home/user/vagrant-laravel/execin up`で、現在の作業ディレクトリーがどこであろうと、起動をかけることができます。

suspendはその名の通り、`vagrant suspend`を実行します。前記のexecinは引数を取りますが、GUIでスクリプトを指定する場合、引数を指定できないことがあるため、suspend動作をさせるためだけのスクリプトを作成しました。コピーし、スクリプト内のコマンドを変更すれば、他のコマンドも簡単に実行できます。

ただし、suspendはBashを終了させてしまうコマンドと同名ですので、実行させるにはコマンドのパスを忘れずに指定してください。

#### 日本語版参照

* [VagrantのUbuntu12.04+Laravel4ボックス](http://kore1server.com/141/Vagrant%E3%81%AEUbuntu12.04%2BLaravel4%E3%83%9C%E3%83%83%E3%82%AF%E3%82%B9)
* [Laravel4 Boxをもっと便利に](http://kore1server.com/143/Laravel4+Box%E3%82%92%E3%82%82%E3%81%A3%E3%81%A8%E4%BE%BF%E5%88%A9%E3%81%AB)
