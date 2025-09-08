# Tools

## ~/CTF/aliases.sh

```zsh
alias angr='sudo docker run -it --rm -v $PWD:/local angr/angr'
alias c='curl -LO'
alias chromium='/snap/bin/chromium'
alias firefox='/snap/bin/firefox'
alias g='grep -Rin'
alias gdb='gdb -q'
alias ghidra='~/ghidra_11.4.1_PUBLIC/ghidraRun'
alias ida='~/ida-free-pc-9.1/ida'
alias m='mydir=$(printf %02d $(($(ls -d [0-9][0-9]|tail -1)+1)))&&mkdir $mydir&&cd $mydir'
alias myenv='source ~/myenv/bin/activate'
alias p='source ~/CTF/pwncheck.sh'
alias q='vi Question.txt'
alias w='vi Writeup.md'
```

## ~/CTF/pwncheck.sh

```zsh
f="${1:-chall}"
file $f
checksec $f
(strings -n 5 $f; strings -n 5 -el $f)|sort -u >strings.output
objdump -d -M intel $f >objdump.output
readelf -SW $f >sections.output
readelf -s $f >syms.output
hexdump -C $f >hexdump.output
pwn template $f >solver.py
```

## ltrace

```zsh
ltrace $T
```
