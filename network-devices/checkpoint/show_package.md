# Show Package Tool

- https://support.checkpoint.com/results/sk/sk120342
- https://github.com/CheckPointSW/ShowPolicyPackage

## 使い方

```bash
# $FWDIR/scripts/web_api_show_package.sh -h

# $FWDIR/scripts/web_api_show_package.sh
Script finished running successfully!
Result file location: show_package-2026-05-01_11-51-44.tar.gz
```

## tar.gz ファイルのダウンロード

SMS 上から tar.gz ファイルをダウンロードしたいが、scp クライアントで取得できない。
以下、Python で簡易 http サーバを立ち上げてダウンロードする方法を説明します。

```bash
# ss -ltn|grep :4444
# python3 -m http.server 4444
Serving HTTP on 0.0.0.0 port 4444 (http://0.0.0.0:4444/) ...
```

Windows PC からファイルを取得します。

```powershell
PS C:\Users\Administrator> wget http://192.168.1.40:4444/show_package-2026-05-01_11-51-44.tar.gz -o show_package-2026-05-01_11-51-44.tar.gz
```
