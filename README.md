# jphs_bruteforce
Patch for jphide bruteforcing

## Steps to reproduce
0) Get `jphs` first!
1) Unzip `jpegsr9a.zip`
2) Patch `Makefile` and `jpseek.c`
3) `make` (`make clean` if compiled before making the changes)
4) Export `JPSEEK_STDIN=true` to env.
5) Use stdin to supply passwords to try.*

### bruteforce.sh
This is a small script supplied for that purpose:
```bash
$ sh bruteforce.sh hidden_info.jpg ./dictionary.txt
PASSWORD: mlem
output: ASCII text
```

**jpseek truncates passwords to 120 chars*

_Note: This is a very slow way of bruteforcing so have that in mind..._
