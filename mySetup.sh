#!/bin/bash
# 上記、必要

# provisionの最後に、自分好みの設定を付け加えるためのBashシェル
# このシェルは、仮想マシンで実行されます。
# 毎回起動されるため、初回以降は内容を削除するか、IF文でチェックしましょう。



# 例） Nginxをインストールし、起動する
# 注意：細かい設定は行なっていません。
# sudo apt-get install nginx-extras
# sudo sudo /etc/init.d/apache2 stop
# sudo sudo /etc/init.d/nginx start



# Composer追加パッケージを追加する
# ペアのif〜fiの間のコードをアンコメントしてください。


# << PHPUnit >>　ユニットテストライブラリー

#if [ ! -d /var/www/vendor/phpunit ]
#then
#  cd /var/www
#  composer require "phpunit/phpunit:3.7.*@dev"
#fi


# << Mockery >>　モックフレームワーク

#if [ ! -d /var/www/vendor/mockery ]
#then
#  cd /var/www
#  composer require "mockery/mockery:dev-master"
#fi


# << Way Generators >>　Laravel4向けコードジェネレーター

#if [ ! -d /var/www/vendor/way/generators ]
#then
#  cd /var/www
#  composer require "way/generators:1.0.*@dev"
#  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Way\\\\Generators\\\\GeneratorsServiceProvider',+" app/config/app.php
#fi


# << Juy Profiler >>　プロファイラー

#if [ ! -d /var/www/vendor/juy ]
#then
#  cd /var/www
#  composer require "juy/profiler:dev-master"
#  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Juy\\\\Profiler\\\\Providers\\\\ProfilerServiceProvider',+" app/config/app.php
#  sed -i -e "s+'Illuminate\\\\Support\\\\Facades\\\\View',+'Illuminate\\\\Support\\\\Facades\\\\View',\\n\\t\\t'Profiler' => 'Juy\\\\Profiler\\\\Facades\\\\Profiler',+" app/config/app.php
#  php artisan config:publish juy/profiler
#fi


# << IDE コード補完ヘルパー >>

#if [ ! -d /var/www/vendor/barryvdh ]
#then
#  cd /var/www
#  composer require "barryvdh/laravel-ide-helper:dev-master"
#  sed -i -e "s+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',+'Illuminate\\\\Workbench\\\\WorkbenchServiceProvider',\\n\\t\\t'Barryvdh\\\\LaravelIdeHelper\\\\IdeHelperServiceProvider',+" app/config/app.php
#  php artisan migrate
#  php artisan ide-helper:generate
#fi
