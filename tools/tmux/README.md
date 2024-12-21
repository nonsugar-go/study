# Tools/tmux

# 概要
- https://github.com/tmux/tmux/wiki/Getting-Started
- https://www.tohoho-web.com/ex/tmux.html
- https://tmuxcheatsheet.com/
# コピーモード
```
:setw -g mode-keys vi
```

Key bind | Description
-- | --
CTRL+B [|コピーモードに入る
CTRL+B ]|ペースト

# ペイン
| Key bind         | Description                                              |
|------------------|----------------------------------------------------------|
| :join-pane -s :2 | 他のウインドウをアクティブなウインドウにペインとして追加 |
| !                | ペインを新規ウインドウにする                             |

