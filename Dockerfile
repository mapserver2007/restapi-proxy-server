FROM debian:stretch-slim

RUN apt-get update && \
    apt-get -y install \
    wget \
    git \
    gcc \
    libxml2-dev \
    libxslt-dev \
    libgd-dev \
    libpq-dev \
    libpcre3 \
    libpcre3-dev \
    libgeoip-dev \
    nginx \
    openssl \
    gettext \
    libssl-dev \
    zlib1g-dev \
    make

RUN  wget https://openresty.org/download/openresty-1.13.6.2.tar.gz
RUN  tar xvfz openresty-1.13.6.2.tar.gz
RUN  cd openresty-1.13.6.2 && \
        ./configure --with-luajit --with-http_addition_module --with-http_dav_module --with-http_geoip_module --with-http_gzip_static_module --with-http_image_filter_module --with-http_realip_module --with-http_stub_status_module --with-http_ssl_module --with-http_sub_module --with-http_xslt_module --with-ipv6 --with-http_postgres_module --with-pcre-jit && \
        make && \
        make install

EXPOSE 8080
CMD ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
