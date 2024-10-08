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
- [zshの外部プラグインまとめ #Zsh - Qiita](https://qiita.com/mollifier/items/1220c0eeaa93e82f8afc)
## Oh My Zsh
- https://ohmyz.sh/
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cat ~/.zshrc.pre-oh-my-zsh >>~/.zshrc
```
### Plugins
- https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
- https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z
- https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
- https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python
- https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
## zsh-syntax-highlighting
- https://github.com/zsh-users/zsh-syntax-highlighting
```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
## zsh-autosuggestions
- https://github.com/zsh-users/zsh-autosuggestions
```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
## powerlevel10k
- https://github.com/romkatv/powerlevel10k
1. Fonts のインストール
   - MesloLGS NF Regular.ttf
   - MesloLGS NF Bold.ttf
   - MesloLGS NF Italic.ttf
   - MesloLGS NF Bold Italic.ttf
2. Windows Terminal のフォント設定
   - ⚙設定 > プロファイル > 規定値 > 外観 > フォント フェイス: MesloLGS NF
3. Powerlevel10k をインストール
```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
4. `~/.zshrc` を編集 `(ZSH_THEME="powerlevel10k/powerlevel10k")`
5. `exec zsh`
### 再設定
```zsh
p10k configure
```
