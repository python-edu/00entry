# Contents

 - [General](#general)
 - [Scoop instalation](#scoop-instalation)
 - [Micro instalation](#micro-instalation)
 - [fzf instalation](#fzf-instalation)
 - [PowerShell setup](#powershell-setup)
 

# General

For working with Python, a tool environment will be prepared to facilitate work using the keyboard:
- scoop: a program manager supporting open source
- micro: a console text editor
- setting environment variables, aliases and functions



# Scoop instalation

From [Scoop](https://scoop.sh/#/):
 >- a command-line installer for Windows.
 >- Open a PowerShell terminal (version 5.1 or later) and from the PS C:\> prompt, run:

 ```
 Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
 Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
 ```



# Micro instalation

From [micro web](https://micro-editor.github.io/):
>a modern and intuitive terminal-based text editor

In the PowerShell terminal, type:
```
scoop install micro
```

If you really don't want to learn micro you can use any other text editor e.g. [Nnotepad++](https://notepad-plus-plus.org/).



# fzf instalation

From [fzf github](https://github.com/junegunn/fzf):
>- Warp, the intelligent terminal for developers
>- Available for MacOS, Linux, & Windows
>- fzf is a general-purpose command-line fuzzy finder

In the PowerShell terminal, type:
```
scoop install fzf
```



# PowerShell setup

## PROFILE

`$PROFILE`: A PowerShell system variable that stores the path to the user's profile file. This is a script that is
automatically executed when PowerShell starts. In the PowerShell terminal:

1. `echo $PROFILE`: this will show you the location of the PowerShell configuration file eg.:
`C:\Users\test1\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
2. `dir Documents`: this will show if there is a folder `WindowsPowerShell` in the `Documents` directory:
 - `mkdir .\Documents\WindowsPowerShell`: use this command to create directory `WindowsPowerShell` if it does not exist
3. `micro $PROFILE`: editor will open/create the file for editing


## EDITOR variable

`$EDITOR`: An environment variable that indicates the default text editor used in the terminal. Many programs can use
this variable, such as Git, VS Code, ipython, etc. In the `$PROFILE` file add the following entry:

```
$EDITOR = "micro"
```


On Linux:
 - edit your `~/.bashrc` (or `~./profile`) file
 - add line: `export EDITOR=micro`
---

## Aliases

For frequently executed commands, you can define shortcuts, so-called aliases, which speed up work, e.g.:

```micro $PROFILE
Set-Alias mc micro
```
- this allows you to launch the micro editor by typing 2 characters `mc`.
