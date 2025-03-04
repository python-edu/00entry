# Introduction

Preparing your computer for the lab requires installing:

 1. Python interpreter, one of the methods:
  - download the official [distribution](https://www.python.org/)
  - using a package manager for a given system, e.g. apt (Debian), the Microsoft Store (Windows), etc.
  - special distribution such as Miniconda/Anaconda

 2. Install text editor (python syntax support function is helpful). Sample open source editors:
  - micro [url](https://github.com/zyedidia/micro/tree/master)
  - notepad++ [url](https://notepad-plus-plus.org/)
  - atom [url](https://atom.io/)
  - spyder [url](https://www.spyder-ide.org/)

---


# Install the official distribution

 1. Download the latest source [release](https://www.python.org/downloads/) or look for a specific release.
 2. Run the installation and follow the appearing tips.
 3. Select/mark:
  - location: user's default folder eg. `C:\Users\your-account\AppData\Local\Programs\Python`
  - check the box: `Add python.exe to PATH` (applies to the current user's variable)
  - if the `Install for all users` option is available - uncheck it (installation only for the current account!)

 4. After installation:
   - run PowerShell
   - enter: `python -V / --version` to check if python is working
   - enter: `python -m pip install -U pip` to update pip manager

