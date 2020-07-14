

# Dockerでの共同開発環境構築方法

以下にDockerでの共同開発環境構築方法を記す。

##  Introduction

共同開発にあたり、特定の開発環境で不具合が発生している（主にDBのエラー）ため、
docker開発環境の構築手法を手順化（文書化）し、共有する。これにより、開発環境の差異を吸収する。

## How to build

1. DockerHubへの登録

    以下リンクからDockerHubへ登録お願いします。 
    
    - [登録はこちら](https://hub.docker.com/signup)

1. dockerのインストール

    各環境に併せて以下のうちいずれかをインストールして下さい。(公式ドキュメントも併せてご覧下さい。)

    - [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
    - [Docker for Windows](https://docs.docker.com/docker-for-windows/install/)

1. docker、docker-composeのインストール確認

    下記コマンドでそれぞれのバージョンを確認して、インストールできたかを確認します。

    ```shell
    $ docker -v

    $ docker-compose -v
    ```

    いずれもバージョンが確認出来たらdockerの実行環境は整いました。

1. git clone の実行
    任意のディレクトリで以下を実行する。

    ```shell
    $ git clone https://github.com/daisuke8000/Taskun.git
    ```
    cloneが正常に行われたらディレクトリへ移動します。

1. Dockerfile (docker build .)

    前述にあるようにすでにDockerfileなどの作成は終わっているため、ディレクトリに移動後に以下のコマンドを実行します。

    ```shell
    $ docker build .

    #buildが正常に実行出来ていればターミナルに以下が表示されている。

    Successfully built <<docker-imageID>>
    ```

1. docker-compose (build,up)

    前述のbuildが正常に実行出来たら以下を入力する。

    ```shell
    $ docker-compose build
    ```
    こちらも正常に実行された後に次のコマンドを入力する。

    ```shell
    $ docker-compose up -d
    ```
    dockerのコンテナが正常に起動しているかを確認する。
    また、`docker-compose build`は`docker-compose.yml`を編集した際のみ同様の手順を実行すれば良い。

    ```shell
    $ docker ps
    ```
    正常であれば`STATUS`の部分が`UP`になっている。
ここで`Exit`になっているようであれば前述の手順で正常に実行されていない可能性が高い。
    
1. コンテナでの実行環境の確認と設定①

    コンテナに入る為、以下のコマンドを入力する。

    ```shell
    $ docker exec -it rails5_web /bin/bash
    ```

    (※これで入れなかった場合は`/bin/bash` → `bash`でお願いします。)
    lsコマンドでホスト側にマウント出来ていることを確認する。(appやconfig、Gemfile等の表示がされていればOK!)

    ```shell
    $ ls
    ```
    次にbundlerをインストールする必要があるため以下のgemをインストールする。

    ```ruby
    $ gem install bundler:2.1.4
    ```

    その後、bundle installを実行する。
    ```ruby
    $ bundle install
    ```

1. コンテナでの実行環境の確認と設定②

    以下のファイルを選択し、ファイル内の加筆してください。

    ```shell
    $ config/database.yml
    ```

    ```yaml
    default: &default
      adapter: mysql2
      encoding: utf8
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      username: root
      #passwordはroot(多分任意で設定可能だけどここではroot)
      password: root
      #host: dbは追記してください
      host: db
      socket: /tmp/mysql.sock
    ```

    上記ファイルの修正後に以下を入力する。

    ```ruby
    $ rails db:create
    ```

    ここまでで特にエラーが発生していなければ以下のコマンドでhomes#indexが確認出来ます。

    ```ruby
    $ bundle exec rails s -p 3000 -b '0.0.0.0'
    ```

    また、DBを確認する際は一度コンテナから出ます。

    ```shell
    $ exit
    ```

    今度はDBのコンテナへ入ります。

    ```shell
    $ docker exec -it rails_db /bin/bash
    ```

    以下のコマンドを入力してデータベースを見る。

    ```mysql
    $ mysql -u root -p
    ```

    ★`「Enter password:」`と聞かれるので、さきほど`config/database.yml`の`password:`で加筆したものを入力する。

    以下のコマンドを入力し、`taskun_development`  と`taskun_test`を確認出来たら環境構築は終了です。

    ```sql
    $ SHOW DATABASES;
    ```

## Appendix

- Dockerfile
- docker-compose.yml

★今回、ディレクトリに既に作成した`Dockerfile`と`docker-compose.yml`があるため内容の詳細は省略する。