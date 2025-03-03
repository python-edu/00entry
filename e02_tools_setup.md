# Contents

 - [General](#general)
 - [Scoop instalation](scoop-instalation)
 - [Micro instalation](micro-instalation)
 - [fzf instalation](fzf-instalation)
 

# General

For working with Python, a tool environment will be prepared to facilitate work using the keyboard:
- scoop: a program manager supporting open source
- micro: a console text editor
- setting environment variables, aliases and functions



# Scoop instalation

From [Scoop](https://scoop.sh/#/):
 >- a command-line installer for Windows.
 >- Open a PowerShell terminal (version 5.1 or later) and from the PS C:\> prompt, run:

 ```Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
 Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression```



# Micro instalation

From [micro web](https://micro-editor.github.io/):
>a modern and intuitive terminal-based text editor

```scoop install micro```

If you really don't want to learn micro you can use any other text editor e.g. [Nnotepad++](https://notepad-plus-plus.org/).



# fzf instalation

From [fzf github](https://github.com/junegunn/fzf):
>- Warp, the intelligent terminal for developers
>- Available for MacOS, Linux, & Windows
>- fzf is a general-purpose command-line fuzzy finder

```scoop install fzf```


# Notepad++ editor configuration

1. EDITOR variable
Setting the EDITOR environment variable points to the default text editor. Thanks to this setting,
calling the `ipython` magic function `%edit` (alias `%ed`) will run the indicated text etior.

Windows:
 - open system settings
 - click the Advanced system settings link
 - click `Environment Variables`, click `New`
 - in the `Variable name` box, enter: `EDITOR`
 - in the `Variable value` box, enter the path to the executable file: notepad.exe, e.g. `C:/Program Files/Notepad++/notepad++.exe` 


On Linux:
 - edit your `~/.bashrc` (or `~./profile`) file
 - add line: `export EDITOR=notepad++`
---


# Settings
 - menu `Language` -> `Python`
 - menu `Preferences` -> `New Document` -> `Default Language` -> `Python`
 - menu `Preferences` -> `New Document` -> `Encoding` -> `UTF-8`
 - menu `Preferences` -> `Language` -> `Tab Settings` -> `Tab Size`: 4
 - menu `Preferences` -> `Language` -> `Tab Settings` -> `Replace by space`
