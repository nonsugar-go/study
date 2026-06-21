# AutohotKey

# AutoHotkey (v2.0)

- https://www.autohotkey.com/

1. インストール
   - Install to: `C:\Program Files\AutoHotkey`
   - Install Mode: All users
2. ファイル名を指定して実行: `shell:startup`
3. 新規作成 > AutoHotkey Script: `AutohotKey Script.ahk`

```
#Requires AutoHotkey v2.0

; 無変換
vk1D::Send "{vk1D}"

vk1D & h::Backspace
vk1D & j::Send "{Enter}"
vk1D & m::Send "{Enter}"

; 変換
vk1C::Send "{vk1C}"

vk1C & h::Left
vk1C & j::Down
vk1C & k::Up
vk1C & l::Right

vk1C & u::Send "{Home}"
vk1C & o::Send "{End}"

vk1C & i::Send "{PgUp}"
vk1C & ,::Send "{PgDn}"

vk1C & n::Send "#^{Left}"
vk1C & m::Send "#^{Right}"

vk1C & e::MouseMove(0, -25, 0, "R")
vk1C & s::MouseMove(-25, 0, 0, "R")
vk1C & d::MouseMove(0, 25, 0, "R")
vk1C & f::MouseMove(25, 0, 0, "R")
vk1C & Space::Click "Left"
```
