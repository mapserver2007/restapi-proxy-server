# variable-request-reverse-proxy
GETリクエストをGET/POST/PUT/DELETEに変換して送信するリバースプロキシ。

`http://localhost:3000/{method}/{domain}/{path}`

## サーバを起動する
```
$> docker-compose build
$> docker-compose up -d
$> docker ps
CONTAINER ID        IMAGE                                          COMMAND                  CREATED             STATUS              PORTS                    NAMES
6b528684dc22        mapserver2007/variable-request-reverse-proxy   "/bin/sh -c 'envsubs…"   21 hours ago        Up 16 minutes       0.0.0.0:3000->8080/tcp   http-reverse-proxy-server
27092abe50cf        mapserver2007/variable-request-reverse-proxy   "/bin/sh -c 'envsubs…"   21 hours ago        Up 16 minutes       0.0.0.0:3001->8080/tcp   https-reverse-proxy-server
```

## リバースプロキシ経由でアクセス
* http://localhost:3000/get/www.example.com/top
* http://localhost:3001/post/www.example.com/login?id=aaa&password=aaa
    * `application/x-www-form-urlencoded`で送信する場合
* http://localhost:3001/post/api.example.com/login?_body={"name":"name1"}
    * `application/json`で送信する場合
