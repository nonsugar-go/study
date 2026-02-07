# Tools

## ~/CTF/aliases.sh

```zsh
[ -x "$HOME/CTF/ida-free-pc-9.1/ida" ] && alias ida='~/CTF/ida-free-pc-9.1/ida'
[ -x "$HOME/CTF/idafree84_linux.run" ] && alias ida='~/CTF/idafree84_linux.run'
alias angr='sudo docker run -it --rm -v $PWD:/local angr/angr'
alias c='curl -LO'
alias chromium='/snap/bin/chromium'
alias firefox='/snap/bin/firefox'
alias g='grep -Rin'
alias gdb='gdb -q'
alias ghidra='~/CTF/ghidra_*.*.*_PUBLIC/ghidraRun'
alias m='mydir=$(printf %02d $(($(ls -d [0-9][0-9]|tail -1)+1)))&&mkdir $mydir&&cd $mydir'
alias myenv='source ~/CTF/myenv/bin/activate'
alias p='source ~/CTF/pwncheck.sh'
alias q='vi Question.txt'
alias w='vi Writeup.md'
myenv
```

## ~/ctf/pwncheck.sh

```zsh
f="${1:-chall}"
file $f
(strings -n 5 $f; strings -n 5 -el $f)|sort -u >strings.output
checksec $f >checksec.output
hexdump -C $f >hexdump.output
objdump -DCM intel $f >objdump.output
pwn template $f >solver.py
readelf -SW $f >sections.output
readelf -r $f >relocs.output
readelf -sW $f >syms.output
```

## ltrace

```zsh
ltrace $T
```
