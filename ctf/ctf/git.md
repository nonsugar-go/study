# Git

git でアーカイブの特定のディレクトリ以下からダウンロードする方法

```zsh
git clone --no-checkout https://github.com/SECCON/Beginners_CTF_2020.git
cd Beginners_CTF_2020
git sparse-checkout init --cone
git sparse-checkout set misc/readme
git checkout master
```
