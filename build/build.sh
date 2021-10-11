cd /tmp
apk add --no-cache --virtual .builders  gcc make g++ zlib-dev linux-headers pcre-dev
adduser nginx
addgroup nginx
mkdir nginx
wget -O nginx.tar.gz http://nginx.org/download/nginx-1.20.1.tar.gz
tar -xzf nginx.tar.gz  -C nginx --strip-components=1
cd nginx
./configure \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --http-client-body-temp-path=/var/cache/nginx/client_temp \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --user=nginx \
    --group=nginx \
    --with-threads \
    --with-file-aio \
    --with-http_realip_module \
    --with-http_gunzip_module \
    --with-http_v2_module \
    --without-http_ssi_module \
    --without-http_geo_module \
    --without-http_map_module \
    --without-http_split_clients_module \
    --without-http_referer_module \
    --without-http_rewrite_module \
    --without-http_proxy_module \
    --without-http_fastcgi_module \
    --without-http_uwsgi_module  \
    --without-http_scgi_module \
    --without-http_grpc_module \
    --without-http_memcached_module \
    --without-http_limit_conn_module \
    --without-http_limit_req_module \
    --without-http_empty_gif_module \
    --without-http_browser_module \
    --without-http_upstream_hash_module \
    --without-http_upstream_ip_hash_module \
    --without-http_upstream_least_conn_module \
    --without-http_upstream_random_module \
    --without-http_upstream_zone_module \
    --without-http_upstream_keepalive_module \
    --without-http_userid_module \
    --without-http_mirror_module \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module \
    --without-stream_limit_conn_module \
    --without-stream_geo_module \
    --without-stream_map_module \
    --without-stream_split_clients_module \
    --without-stream_return_module \
    --without-stream_set_module \
    --without-stream_upstream_hash_module \
    --without-stream_upstream_least_conn_module \
    --without-stream_upstream_random_module \
    --without-stream_upstream_zone_module
mkdir -p /var/cache/nginx/client_temp/
make
make install
apk del .builders
rm -rf /tmp/*