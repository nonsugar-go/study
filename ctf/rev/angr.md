# Angr
# インストール
- https://angr.io/
- https://github.com/angr/angr-doc/blob/master/INSTALL.md
- https://saotake.hatenablog.com/entry/2016/06/03/213100
- https://qiita.com/HirMtsd/items/807f12e40c6b0d75301f

```bash
sudo apt-get install python3-dev libffi-dev build-essential python3-venv
python3 -m venv angr
cd angr
pip3 install -U angr
```
# Docker
- https://hub.docker.com/r/angr/angr/

```bash
sudo docker run -it --rm -v $PWD:/local angr/angr
```
# 使用方法
- https://docs.angr.io/en/latest/examples.html
- https://docs.angr.io/en/latest/appendix/cheatsheet.html
- https://kashiwaba-yuki.com/ctf-angr-bigginer
- https://gist.github.com/k3170makan/e01ee70ec1b99b22be36e5fc53d218fa

```bash
#! /usr/bin/env python3
import angr
p = angr.Project('./jumpout')
print(p.loader.main_object)
s = p.factory.entry_state(args=[p.filename])
sm = p.factory.simgr(s)
sm.explore(find=0x401247, avoid=0x401254)
#sm.explore(find=lambda s: b'Correct!' in s.posix.dumps(1))
if len(sm.found) > 0:
    print('FOUND:', sm.found[0].posix.dumps(0))
```
# Tim Nosco
- https://www.youtube.com/watch?v=9dQFM5O4KFk
- https://github.com/Tim-Nosco/z3_lessons/tree/master/angr_ctf
