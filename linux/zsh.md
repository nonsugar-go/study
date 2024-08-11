# zsh
- https://zsh.sourceforge.io/Doc/Release/zsh_toc.html
- https://zsh.sourceforge.io/Doc/Release/Options.html
## カーソル移動
| key | description |
| ---- | ------ |
| C-a \| C-e | 先頭へ \| 行末へ |
| C-k \| C-u | カーソルから行末まで削除 \| カーソルから先頭まで削除 |
| C-b \| C-f | 一文字戻る \| 一文字進む |
| C-d \| C-h | カーソル位置の文字を削除 \| カーソル位置の左を削除|

## コマンド
| command | description |
| ------- | ----------- |
| % !!      | 直前のコマンドの実行 |
| % !vim    | 直前の vim コマンドの実行 |
| % source ~/.zshrc | ~/.zshrc の再読み込み |
| C-R | コマンド履歴 |
  
# Plugin
## Oh My Zsh
- https://ohmyz.sh/
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cat ~/.zshrc.pre-oh-my-zsh >>~/.zshrc
```
