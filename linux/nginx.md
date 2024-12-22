# Nginx
- https://nginx.org/en/docs/
- - [第2章 NGINX の設定および設定 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/deploying_web_servers_and_reverse_proxies/setting-up-and-configuring-nginx_deploying-web-servers-and-reverse-proxies)
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
$ sudo firewall-cmd --list-ports
80/tcp 443/tcp 10050/tcp
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
- [第6章 PHP スクリプト言語の使用 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/installing_and_using_dynamic_programming_languages/assembly_using-the-php-scripting-language_installing-and-using-dynamic-programming-languages#installing-the-php-scripting-language_assembly_using-the-php-scripting-language)                - [6.2. Web サーバーでの PHP スクリプト言語の使用 | Red Hat Product Documentation](https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/installing_and_using_dynamic_programming_languages/using-the-php-scripting-language-with-a-web-server_assembly_using-the-php-scripting-language#using-php-with-the-apache-http-server_using-the-php-scripting-language-with-a-web-server) 

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
$ sudo dnf module list php
サブスクリプション管理リポジトリーを更新しています。
メタデータの期限切れの最終確認: 0:58:49 前の 2024年12月22日 11時58分33秒 に実施しました。
Red Hat Enterprise Linux 9 for x86_64 - AppStream (RPMs)
Name         Stream         Profiles                              Summary
php          8.1            common [d], devel, minimal            PHP scripting language
php          8.2 [e]        common [d] [i], devel, minimal        PHP scripting language

ヒント: [d]efault, [e]nabled, [x]disabled, [i]nstalled

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
## Core
- https://nginx.org/en/docs/http/ngx_http_core_module.html#location
- https://nginx.org/en/docs/http/ngx_http_core_module.html#try_files
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
# Varibales
- https://nginx.org/en/docs/varindex.html
- https://nginx.org/en/docs/http/ngx_http_core_module.html#var_arg_
- https://nginx.org/en/docs/http/ngx_http_ssi_module.html#var_date_local
# Reverse Proxy
- https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/deploying_web_servers_and_reverse_proxies/setting-up-and-configuring-nginx_deploying-web-servers-and-reverse-proxies
