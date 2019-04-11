# restapi-proxy-server
ローカルRESTfulサーバに対する認証トークンを省略できるリバースプロキシ。

## 使い方

1. .env設定
.envファイルを開き、対象サーバのホスト、ポートなどを指定。  
また、認証に使用するトークンのヘッダを指定する(値については各々用意すること)。

```
SERVER_HOST=host.docker.internal
SERVER_PORT=8080
X_AUTH_TOKEN=6d2a2af6-491f-4075-b455-39e3660f4ec0
```

2. dockerコンテナを起動

```
$> rake
```

3. リクエストする

```
$> curl -X GET http://localhost:3000/
```