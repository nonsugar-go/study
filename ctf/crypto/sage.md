# Sage
- https://doc.sagemath.org/html/ja/tutorial/index.html
- https://sagecell.sagemath.org/

# Install / Ubuntu
```bash
$ sudo apt install sagemath    ## ディスク容量を大量消費します
```

# 使い方

```sage
#! /usr/bin/env sage
p = var('p')
q = 2 * p + 1
n = 292927367433510948901751902057717800692038691293351366163009654796102787183601223853665784238601655926920628800436003079044921928983307813012149143680956641439800408783429996002829316421340550469318295239640149707659994033143360850517185860496309968947622345912323183329662031340775767654881876683235701491291
print(solve(p * q == n , p))
```