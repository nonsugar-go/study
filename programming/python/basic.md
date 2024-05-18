# 基礎
CENTER:Python
RIGHT:Created by: 2018-05-15 non sugar
RIGHT:Modified by: 2022-12-04 non sugar
* 目次
#contents
* 基礎
- https://docs.python.org/ja/3/tutorial/index.html
- https://docs.python.org/ja/3/howto/argparse.html
- https://docs.python.org/ja/3/library/csv.html

* クラス
- https://docs.python.org/ja/3/tutorial/classes.html
- https://docs.python.org/ja/3/library/functions.html#super
- https://docs.python.org/ja/3/library/operator.html
- https://docs.python.org/ja/3/library/functions.html#classmethod
- https://docs.python.org/ja/3/library/functions.html#staticmethod
- [[Pythonの特殊メソッド一覧を備忘録としてまとめてみた。 - Qiita>https://qiita.com/y518gaku/items/07961c61f5efef13cccc]]

* パッケージ管理
** 確認
 ## pexpect を確認する例
 $ python3
 >>> import pexpect      ## エラーが無ければ pexpect は存在する
 >>> pexpect.__file__    ## インストールパスの確認
 >>> pexpect.__version__ ## バージョンの確認
 >>> quit()
** pip
- Cygwin をインストール
- Packages: Python/python3-pip (pip)
 $ pip3 list            ## インストールされたパッケージの一覧
 $ pip3 search PACKAGE  ## PACKAGE を検索
 $ pip3 install PACAKGE ## PACKAGE をインストール
 $ pip3 show PACKAGE    ## PACKAGE の情報を表示
* netaddr
- インストール
 $ pip3 install netaddr
- print_oui.py
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
* openpyxl
- インストール
 $ pip3 install openpyxl
* python-docx
- インストール
 $ pip3 install python-docx
* Pexpect の使用例
概要: ネットワーク機器にログインして、コマンドを実行するスクリプト
- Cygwin をインストール
- Packages: Python/python3-pexpect
-           Net/inetutils (telnet, ftp)
-           Net/openssh (ssh, sftp)

作成中...
* Jinja2
- Cygwin をインストール
- Packages: Python/python3-jinja2

* Ansible
作成中...
- Cygwin と 以下のパッケージをインストール
-- Devel/gcc-core
-- Devel/make
-- Libs/libffi-devel
-- Net/openssl-devel
-- Python/python-crypto
-- Python/python2-devel
-- Python/python2-pip

 $ pip2 install ansible
 $ ssh-copy-id USER@IpAddress
* 参考
-[[はじめに &mdash; pep8-ja 1.0 ドキュメント>http://pep8-ja.readthedocs.io/ja/latest/]]
-[[ネットワーク自動化、なに使う？ ～自動化ツール紹介～　(2017/07/21開催)>https://www.slideshare.net/akira6592/networkautomationtools20170721-78191620]]
-[[Python for Network Engineers>https://pynet.twb-tech.com/blog/]]
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
