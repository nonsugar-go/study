# Tools

## ~/CTF/aliases.sh

```zsh
[ -f "$HOME/CTF/myenv/bin/activate" ] && alias myenv='source ~/CTF/myenv/bin/activate'
[ -f "$HOME/myenv/bin/activate" ] && alias myenv='source ~/myenv/bin/activate'
[ -x "$HOME/CTF/ida-free-pc-9.1/ida" ] && alias ida='~/CTF/ida-free-pc-9.1/ida'
[ -x "$HOME/CTF/idafree84_linux.run" ] && alias ida='~/CTF/idafree84_linux.run'
[ -x "$HOME/ida-free-pc-9.1/ida" ] && alias ida='~/ida-free-pc-9.1/ida'
[ -x "$HOME/idafree84_linux.run" ] && alias ida='~/idafree84_linux.run'
alias angr='sudo docker run -it --rm -v $PWD:/local angr/angr'
alias c='curl -LO'
alias chromium='/snap/bin/chromium'
alias firefox='/snap/bin/firefox'
alias g='grep -Rin'
alias gdb='gdb -q'
alias ghidra='~/CTF/ghidra_11.4.2_PUBLIC/ghidraRun'
alias m='mydir=$(printf %02d $(($(ls -d [0-9][0-9]|tail -1)+1)))&&mkdir $mydir&&cd $mydir'
alias p='source ~/CTF/pwncheck.sh'
alias q='vi Question.txt'
alias w='vi Writeup.md'
myenv
```

```zsh
f="${1:-chall}"
file $f
checksec $f
(strings -n 5 $f; strings -n 5 -el $f)|sort -u >strings.output
objdump -d -M intel $f >objdump.output
readelf -SW $f >sections.output
readelf -s $f >syms.output
readelf -r $f >relocs.output
hexdump -C $f >hexdump.output
pwn template $f >solver.py
```

## ltrace

```zsh
ltrace $T
```
