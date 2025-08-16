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

```py
# @category _NEW_
# @runtime Jython
import sys
from ghidra.program.model.address import Address
from ghidra.program.model.scalar import Scalar
start_addr = toAddr(0x0040100a)
end_addr = currentProgram.getMaxAddress()
results = []
instr = getInstructionAt(start_addr)
while instr and instr.getAddress().compareTo(end_addr) < 0:
    if instr.getMnemonicString() == "CALL":
        op = instr.getOpObjects(0)[0]
        if isinstance(op, Address):
            func = getFunctionAt(op)
            if func:
                print('CALL to {} at {}'.format(
                    func.getName(), instr.getAddress()))
    elif instr.getMnemonicString() == 'PUSH':
        op = instr.getOpObjects(0)[0]
        if isinstance(op, Scalar):
            value = instr.getOpObjects(0)[0].getValue()
            if value >= 0x20 and value <= 0x7e:
                results.append(value)
    instr = instr.getNext()
for value in results:
    sys.stdout.write('{:c}'.format(value))
print('')
```
