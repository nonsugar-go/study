# GitHub

# 概要
- https://github.com/
- https://github.com/skills
- [とほほのGitHub入門 - とほほのWWW入門](https://www.tohoho-web.com/ex/github.html)

# 設定
## 名前とメアド
1. メアドを非公開にする
- [【Git】メールアドレスを非公開にする #Git - Qiita](https://qiita.com/P-man_Brown/items/66291370639294d7ffc8)

2. 名前とメアドの設定
```bash
$ git config --global user.name nonsugar-go
$ git config --global user.email "999999999+nonsugar-go@users.noreply.github.com"
```

3. アクセス トークンの作成
- [とほほのGitHub入門 - とほほのWWW入門](https://www.tohoho-web.com/ex/github.html)

## SSH での接続
- [【入門】Githubにsshで接続する手順・注意点まとめ - カゴヤのサーバー研究室](https://www.kagoya.jp/howto/it-glos
sary/develop/github_ssh/)
- [git pushの接続方式をhttpsからsshに切り替える #Git - Qiita](https://qiita.com/ryomoucmei/items/ec8c225603ef983
fc318)

1. Create Key Pair
```bash
$ ssh-keygen -t rsa -b 4096
```

2. Settings > SSH and GPG keys > New SSH Key
   - Title: (any)
   - Key Type: Authentication Key
   - Key: paste of ~/.ssh/id_rsa.pub
   - [Add SSH Key]

3. Test
```bash
$ ssh -T git@github.com
```

4. Configuring remote repo
```bash
$ git remote set-url origin git@github.com:USERNAME/REPONAME.git
$ git remote -v
```

# 手順
1. リモートリポジトリをGitHubで作成

2. リモートリポジトリをコピーして、ローカル リポジトリを作成 (clone)
```bash
$ git clone git@github.com:nonsugar-go/study.git
```

3. ローカルリポジトリでブランチ (update) を作成する
```bash
$ git checkout -b update
```

4. ファイルを編集して、作成したブランチにコミットする
```bash
$ git add .
$ git status
$ git commit -m "modify README.md"
$ git log --oneline --graph --all
```

5. ローカルリポジトリの内容をリモートリポジトリに反映する (push)
```bash
$ git remote -v                   ## リモート リポジトリに名前は origin
$ git push -u origin update  ## -u は上流ブランチの設定 / 次回は git push で OK
$ git branch -av
$ git log --oneline --graph --all
```

6. GitHub でブランチの内容を確認して良ければマージする (プルリクエストと承認)

7. リモートリポジトリの内容をローカルリポジトリに反映する (pull)
```bash
$ git checkout main
$ git pull
$ git checkout update
```





