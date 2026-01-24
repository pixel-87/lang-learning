# first local program

Challenge: 09-first-local-program
Chapter: 11-packages-and-modules

Create a new dir and enter it:

```bash
mkdir hellogo
cd hellogo
```

Inside that dir declare your module's name:

```bash
go mod init {REMOTE}/{USERNAME}/hellogo
```

Where `{REMOTE}` is your preferred remote source provider (i.e. `github.com`) and {USERNAME} is your git username. if you dont use a remote provider just use `example.com/username/hellogo`

print go.mod 

```bash
cat go.mod
```
