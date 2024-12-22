# Nginx
- https://nginx.org/en/docs/
- [第2章 NGINX の設定および設定 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/deploying_web_servers_and_reverse_proxies/setting-up-and-configuring-nginx_deploying-web-servers-and-reverse-proxies)
# Install
```bash
$ dnf info nginx | grep バージョン
バージョン   : 1.20.1
```

```bash
$ dnf module list nginx
root ではありません。サブスクリプション管理リポジトリーは更新されていません
メタデータの期限切れの最終確認: 0:26:01 前の 2024年12月20日 23時10分55秒 に実施しました。
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs)
Name                  Stream                 Profiles                   Summary
nginx                 1.22                   common [d]                 nginx webserver
nginx                 1.24                   common [d]                 nginx webserver

ヒント: [d]efault, [e]nabled, [x]disabled, [i]nstalled
```

```bash
sudo dnf module enable nginx:1.24 -y
sudo dnf install nginx -y
sudo firewall-cmd --permanent --add-port={80/tcp,443/tcp}
sudo firewall-cmd --reload
sudo systemctl enable nginx --now
sudo systemctl status nginx
```

```bash
$ sudo firewall-cmd --list-ports
80/tcp 443/tcp 10050/tcp
```

```bash
$ dnf list installed nginx
root ではありません。サブスクリプション管理リポジトリーは更新されていません
インストール済みパッケージ
nginx.x86_64             1:1.24.0-4.module+el9.5.0+22074+d5873014             @rhel-9-for-x86_64-appstream-rpms
```

```bash
$ rpm -qa | grep nginx
nginx-filesystem-1.24.0-4.module+el9.5.0+22074+d5873014.noarch
nginx-core-1.24.0-4.module+el9.5.0+22074+d5873014.x86_64
nginx-1.24.0-4.module+el9.5.0+22074+d5873014.x86_64
```

```bash
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log
```

```bash
sudo vi /etc/nginx/nginx.conf
```

```bash
$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

```bash
sudo systemctl reload nginx
```
# php-fpm
- [第6章 PHP スクリプト言語の使用 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/installing_and_using_dynamic_programming_languages/assembly_using-the-php-scripting-language_installing-and-using-dynamic-programming-languages#installing-the-php-scripting-language_assembly_using-the-php-scripting-language)
- [6.2. Web サーバーでの PHP スクリプト言語の使用 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/installing_and_using_dynamic_programming_languages/using-the-php-scripting-language-with-a-web-server_assembly_using-the-php-scripting-language#using-php-with-the-apache-http-server_using-the-php-scripting-language-with-a-web-server) 

```bash
$ sudo dnf info php | grep バージョン
バージョン   : 8.0.30
```

```bash
$ sudo dnf module list php
サブスクリプション管理リポジトリーを更新しています。
メタデータの期限切れの最終確認: 0:53:50 前の 2024年12月22日 11時58分33秒 に実施しました。
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs)
Name          Stream          Profiles                           Summary
php           8.1             common [d], devel, minimal         PHP scripting language
php           8.2             common [d], devel, minimal         PHP scripting language

ヒント: [d]efault, [e]nabled, [x]disabled, [i]nstalled
```

```bash
sudo dnf module install php:8.2/common -y
```

```bash
$ dnf module list php
root ではありません。サブスクリプション管理リポジトリーは更新されていません
メタデータの期限切れの最終確認: 0:49:54 前の 2024年12月22日 12時59分47秒 に実施しました。
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs)
Name         Stream         Profiles                              Summary
php          8.1            common [d], devel, minimal            PHP scripting language
php          8.2 [e]        common [d] [i], devel, minimal        PHP scripting language

ヒント: [d]efault, [e]nabled, [x]disabled, [i]nstalled
```

```
$ rpm -qa | grep ^php
php-common-8.2.25-1.module+el9.5.0+22477+5fdac06d.x86_64
php-fpm-8.2.25-1.module+el9.5.0+22477+5fdac06d.x86_64
php-cli-8.2.25-1.module+el9.5.0+22477+5fdac06d.x86_64
php-mbstring-8.2.25-1.module+el9.5.0+22477+5fdac06d.x86_64
php-xml-8.2.25-1.module+el9.5.0+22477+5fdac06d.x86_64
```

```bash
sudo systemctl enable php-fpm --now
sudo systemctl status php-fpm
```
## Configraion file
- /etc/nginx/nginx.conf
- /etc/nginx/conf.d/php-fpm.conf
- /etc/php-fpm.conf
- /etc/php-fpm.d/www.conf
# Configuration
## Location
- https://nginx.org/en/docs/http/ngx_http_core_module.html#location
- https://www.slingacademy.com/article/nginx-location-block-the-complete-guide/#location-block-precedence
## Core
- https://nginx.org/en/docs/http/ngx_http_core_module.html#try_files
- https://nginx.org/en/docs/ngx_core_module.html#worker_processes
- https://nginx.org/en/docs/ngx_core_module.html#worker_connections
- https://nginx.org/en/docs/ngx_core_module.html#pid
- https://nginx.org/en/docs/ngx_core_module.html#user
- https://nginx.org/en/docs/http/ngx_http_core_module.html#client_header_buffer_size
- https://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size
- https://nginx.org/en/docs/http/ngx_http_core_module.html#client_header_buffer_size
- https://nginx.org/en/docs/http/ngx_http_core_module.html#client_body_timeout
- https://nginx.org/en/docs/http/ngx_http_core_module.html#client_header_timeout
- https://nginx.org/en/docs/http/ngx_http_core_module.html#keepalive_timeout
- https://nginx.org/en/docs/http/ngx_http_core_module.html#send_timeout
- https://nginx.org/en/docs/http/ngx_http_core_module.html#sendfile
- https://nginx.org/en/docs/http/ngx_http_core_module.html#tcp_nopush
## Log
- https://nginx.org/en/docs/http/ngx_http_log_module.html#access_log
- https://nginx.org/en/docs/ngx_core_module.html#error_log
- https://docs.nginx.com/nginx/admin-guide/monitoring/logging/
## Rewrite
- https://nginx.org/en/docs/http/ngx_http_rewrite_module.html#rewrite
## Index
- https://nginx.org/en/docs/http/ngx_http_index_module.html#index
## Heders
- https://nginx.org/en/docs/http/ngx_http_headers_module.html#add_header
- https://nginx.org/en/docs/http/ngx_http_headers_module.html#expires
## Fastcgi
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_pass
## Fastcgi cache
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_cache_path
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_cache_key
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_cache
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_cache_valid
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_cache_bypass
- https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_no_cache
## Varibales
- https://nginx.org/en/docs/varindex.html
- https://nginx.org/en/docs/http/ngx_http_core_module.html#var_arg_
- https://nginx.org/en/docs/http/ngx_http_ssi_module.html#var_date_local
- https://nginx.org/en/docs/http/ngx_http_upstream_module.html#var_upstream_cache_status
## Gzip
- https://nginx.org/en/docs/http/ngx_http_gzip_module.html#gzip
- https://nginx.org/en/docs/http/ngx_http_gzip_module.html#gzip_comp_level
- https://nginx.org/en/docs/http/ngx_http_gzip_module.html#gzip_types
# Module ngx_http_image_filter_module
- https://runebook.dev/ja/docs/nginx/http/ngx_http_image_filter_module
- https://nginx.org/en/docs/http/ngx_http_image_filter_module.html
```bash
sudo dnf group install 'Development Tools' -y
sudo dnf install pcre-devel gd-devel libxml2-devel libxslt-devel perl-ExtUtils-Embed -y
curl -O http://nginx.org/download/nginx-1.24.0.tar.gz
tar xvf nginx-1.24.0.tar.gz
cd nginx-1.24.0
nginx -V
./configure --with-http_image_filter_module=dynamic \
--prefix=/usr/share/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/var/lib/nginx/tmp/client_body --http-proxy-temp-path=/var/lib/nginx/tmp/proxy --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi --http-scgi-temp-path=/var/lib/nginx/tmp/scgi --pid-path=/run/nginx.pid --lock-path=/run/lock/subsys/nginx --user=nginx --group=nginx --with-compat --with-debug --with-file-aio --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_degradation_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_mp4_module --with-http_perl_module=dynamic --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-http_xslt_module=dynamic --with-mail=dynamic --with-mail_ssl_module --with-openssl-opt=enable-ktls --with-pcre --with-pcre-jit --with-stream=dynamic --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-threads --with-cc-opt='-O2 -flto=auto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -march=x86-64-v2 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection' --with-ld-opt='-Wl,-z,relro -Wl,--as-needed -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -Wl,-E'
make
sudo mkdir /etc/nginx/modules
sudo cp ./objs/ngx_http_image_filter_module.so /etc/nginx/modules
sudo vi /etc/nginx/nginx.conf
sudo systemctl reload nginx
```

`/etc/nginx/nginx.conf`
```
load_module /etc/nginx/modules/ngx_http_image_filter_module.so;
  (snip)
        location /thumb.png {
            image_filter resize 150 100;
            image_filter rotate 180;
        }
  (snip)
```
# https
- https://docs.nginx.com/nginx/admin-guide/security-controls/terminating-ssl-http/
- https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_certificate
- https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_certificate_key
- https://nginx.org/en/docs/http/ngx_http_v2_module.html#http2_push

`/etc/nginx/nginx.conf`
```
http {
    server {
        listen 443 ssl http2;
        ssl_certificate /etc/nginx/ssl/server.crt;
        ssl_certificate_key /etc/nginx/ssl/server.key;
    }
    location = /index.html {
        http2_push /style.css;
        http2_push /thumb.png;
    }
}
```
# Reverse Proxy
- [第2章 NGINX の設定および設定 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/deploying_web_servers_and_reverse_proxies/setting-up-and-configuring-nginx_deploying-web-servers-and-reverse-proxies)
