# Angr

- https://angr.io/
- https://github.com/angr/angr-doc/blob/master/INSTALL.md
- https://saotake.hatenablog.com/entry/2016/06/03/213100
- https://qiita.com/HirMtsd/items/807f12e40c6b0d75301f

# インストール

```bash
sudo apt-get install python3-dev libffi-dev build-essential python3-venv
python3 -m venv angr
cd angr
pip3 install -U angr
```

# Docker

> [!INFOMATION]
> Docker がお勧め

- https://hub.docker.com/r/angr/angr/

```zsh
sudo docker run -it --rm -v $PWD:/local angr/angr
```

# angr が対応しているライブラリ関数

```python
#!/usr/bin/env python3
import angr
for lib, funcs in angr.SIM_PROCEDURES.items():
    print(f'[{lib}]')
    for func in funcs:
        print('  ', func)
```

# サンプル

## 引数にフラグを指定

```python
#!/usr/bin/env python3
import angr
import claripy
proj = angr.Project("./chall", auto_load_libs=False)
N = 64
PREFIX = b'FLAG{'
arg1 = claripy.BVS("arg1", 8*N)
state = proj.factory.entry_state(args=[proj.filename, arg1])
for c in arg1.chop(8):
    state.solver.add(claripy.Or(claripy.And(0x20 <= c, c <= 0x7e), c == 0))
for i, ch in enumerate(PREFIX):
    state.solver.add(arg1.get_byte(i) == ch)
simgr = proj.factory.simgr(state)
simgr.explore(find=lambda s: b"Correct" in s.posix.dumps(1),
              avoid=lambda s: b"Wrong" in s.posix.dumps(1))
print(simgr)
if simgr.found:
    found = simgr.found[0]
    flag = found.solver.eval(arg1, cast_to=bytes)
    print("FLAG:", flag.split(b"\0")[0].decode())
else:
    print("No solution found")
```

## 標準入力にフラグを指定

```
#!/usr/bin/env python3
import angr
import claripy
proj = angr.Project('./chall', auto_load_libs=False)
N = 64
PREFIX = b'FLAG{'
inp = claripy.BVS('inp', 8*N)
state = proj.factory.entry_state(stdin=inp)
for c in inp.chop(8):
    state.solver.add(
        claripy.Or(claripy.And(0x20 <= c, c <= 0x7e), c == 0, c == 0xa))
for i, ch in enumerate(PREFIX):
    state.solver.add(inp.get_byte(i) == ch)
simgr = proj.factory.simgr(state)
simgr.explore(find=lambda s: b'Correct' in s.posix.dumps(1),
              avoid=lambda s: b'Wrong' in s.posix.dumps(1))
if simgr.found:
    found = simgr.found[0]
    flag = found.solver.eval(inp, cast_to=bytes)
    print('FLAG:', flag.split(b'\0')[0].decode())
else:
    print('No solution found')
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
