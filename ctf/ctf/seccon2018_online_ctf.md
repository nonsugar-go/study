# SECCON2018 Online CTF

## Reversing

### Runme

- https://github.com/SECCON/SECCON2018_online_CTF/tree/master/Reversing/Runme

```py
#!/usr/bin/env python3
import subprocess
result = subprocess.check_output(r'''
objdump -D -M intel runme.exe|grep -o 'push \+0x..'|sed 's/push \+0x//'|tr '\n' ' '
''', shell=True)
print(bytes.fromhex(result.decode('utf8')))
```
