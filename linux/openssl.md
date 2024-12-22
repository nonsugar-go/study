# OpenSSL
- https://www.tohoho-web.com/ex/openssl.html
# 自己署名証明書
```bash
sudo mkdir /etc/nginx/ssl
```

```bash
$ sudo openssl req -x509 -days 365 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt
  (snip)
-----
Country Name (2 letter code) [XX]:JP
State or Province Name (full name) []:Tokyo
Locality Name (eg, city) [Default City]:Chiyoda-ku
Organization Name (eg, company) [Default Company Ltd]:Tomato Company Ltd
Organizational Unit Name (eg, section) []:
Common Name (eg, your name or your server's hostname) []:www.tomato.test
Email Address []:
```
# easy-rsa
- https://github.com/OpenVPN/easy-rsa
- https://github.com/OpenVPN/easy-rsa/blob/master/README.quickstart.md
