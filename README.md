# HOP_API_ReverseProxy
ローカルRESTfulサーバに対するリクエスト時に認証トークンを省略できるリバースプロキシ。

## 使い方

### .env設定
.envファイルを開き、対象サーバのホスト、ポートなどを指定。  
また、認証に使用するトークンのヘッダを指定する(値については各々用意すること)。

```
SERVER_HOST=host.docker.internal
SERVER_PORT=8080
NGINX_PORT=3000
X_AUTH_TOKEN=6d2a2af6-491f-4075-b455-39e3660f4ec0
```

* SERVER_HOST: 開発環境のサーバのホスト名またはIPアドレス。ホストマシンのlocalhostの場合、host.docker.internalを指定する。
* SERVER_PORT: 開発環境のサーバのポート番号。
* NGINX_PORT: リバースプロキシサーバのポート番号。
* X_AUTH_TOKEN: 認証トークン。

### dockerコンテナを起動

```
$> rake
```

### リバースプロキシ経由で開発サーバへリクエストする

```
$> curl -X PUT http://localhost:3000/accounts -d 'mail_address=hoge@meleap.com' -i
```
リバースプロキシ経由のリクエストは、
```
$> curl -X PUT http://localhost:8080/accounts -H 'X-Auth-Token: xxxxxxxxxxxxxxxxxxxxxxxx' -d 'mail_address=hoge@meleap.com' -i
```
と同じになる。