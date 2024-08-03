# Python の基礎
# PIP 8
- https://peps.python.org/pep-0008/
- https://pep8-ja.readthedocs.io/ja/latest/
## 命名規則
| 種別 | 説明 | 例 |
|----|----|----|
| Packages | 短い、小文字、アンダースコアは無し | utilities |
| Modules | 短い、小文字、アンダースコアを含むこともある | db_utils db_utils |
| Classes | upper camel case | BankAccount |
| Functions | 小文字、snake case | open_account |
| Variables | 小文字、snake case | accout_id |
| Constatns | 大文字、upper snake case | MIN_APR


# 基礎
- https://docs.python.org/ja/3/tutorial/index.html
- https://docs.python.org/ja/3/howto/argparse.html
- https://docs.python.org/ja/3/library/csv.html


# パッケージ管理
## 確認
```python
## pexpect を確認する例
$ python3
>>> import pexpect      ## エラーが無ければ pexpect は存在する
>>> pexpect.__file__    ## インストールパスの確認
>>> pexpect.__version__ ## バージョンの確認
>>> quit()
```

## pip
- Cygwin をインストール
- Packages: Python/python3-pip (pip)
```bash
$ pip3 list            ## インストールされたパッケージの一覧
$ pip3 search PACKAGE  ## PACKAGE を検索
$ pip3 install PACAKGE ## PACKAGE をインストール
$ pip3 show PACKAGE    ## PACKAGE の情報を表示
```

# netaddr
- インストール
```bash
$ pip3 install netaddr
```

- print_oui.py
```python
#! /usr/bin/env python3
import sys
import csv
import netaddr

reader = csv.reader(sys.stdin)
for row in reader:
    oui = ''
    if len(sys.argv) > 1:
        i = int(sys.argv[1])
    else:
        i = 0
    try:
        mac = netaddr.EUI(row[i])
        row[i] = str(mac)
        oui = mac.oui.registration().org
    except netaddr.core.AddrFormatError:
        pass
    except netaddr.core.NotRegisteredError:
        pass
    row.append(oui)
    print(','.join(row))
```

# openpyxl
- インストール
```bash
$ pip3 install openpyxl
```

# python-docx
- インストール
```bash
$ pip3 install python-docx
```

# Jinja2
- Cygwin をインストール
- Packages: Python/python3-jinja2

# 参考
- [はじめに &mdash; pep8-ja 1.0 ドキュメント](http://pep8-ja.readthedocs.io/ja/latest/)
- [ネットワーク自動化、なに使う？ ～自動化ツール紹介～　(2017/07/21開催)](https://www.slideshare.net/akira6592/networkautomationtools20170721-78191620)
- [Python for Network Engineers](https://pynet.twb-tech.com/blog/)
-[[コーシンラボ>http://kooshin.hateblo.jp/]]
-[[Network Automation  Template Configurations with Jinja2 and YAML &#8211; Network Otaku>http://networkotaku.com/2017/06/06/network-automation-template-configurations-with-jinja2-and-yaml/]]
-[[Load a Jinja2 template from the filesystem and render it>http://matthiaseisen.com/pp/patterns/p0198/]]
-[[python jinja2(part1) cisco機器のconfig作成に便利なjinja2.Environment()設定 - 技術メモ>http://mocas.hatenablog.com/entry/2015/11/14/154337]]
-[[Template Designer Documentation &#8212; Jinja2 Documentation (2.10)>http://jinja.pocoo.org/docs/2.10/templates/]]
-[[クロス集計をBash(とawk)だけで実装した話>https://www.slideshare.net/iktakahiro/bashawk]]
-[[TextFSMHowto.md>https://github.com/harro/textfsm/blob/master/TextFSMHowto.md]]
-[[Programmatic Access to CLI Devices with TextFSM | Jason Edelman's Blog>http://jedelman.com/home/programmatic-access-to-cli-devices-with-textfsm/]]
-[[VimeoKirk Byers>https://vimeo.com/user31890934]]
-[[Automate the Boring Stuff with Python>https://automatetheboringstuff.com/#toc]]
-[[pexpect - 対話アプリの自動運転|Engineering のまにまに>http://eng-manima.blogspot.com/2014/09/pexpect.html]]
