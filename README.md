# variable-request-reverse-proxy
A reverse proxy that converts GET requests into GET/POST/PUT /DELETE and sends them.

`http://localhost:3000/{method}/{domain}/{path}`

## Start reverse proxy server
```
$> docker-compose build
$> docker-compose up -d
$> docker ps
CONTAINER ID        IMAGE                                          COMMAND                  CREATED             STATUS              PORTS                    NAMES
6b528684dc22        mapserver2007/variable-request-reverse-proxy   "/bin/sh -c 'envsubs…"   21 hours ago        Up 16 minutes       0.0.0.0:3000->8080/tcp   http-reverse-proxy-server
27092abe50cf        mapserver2007/variable-request-reverse-proxy   "/bin/sh -c 'envsubs…"   21 hours ago        Up 16 minutes       0.0.0.0:3001->8080/tcp   https-reverse-proxy-server
```

## Access via reverse proxy
* http://localhost:3000/get/www.example.com/top
* http://localhost:3001/post/www.example.com/login?id=aaa&password=aaa