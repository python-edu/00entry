# Introduction

Preparing your computer for the lab requires installing:

1. Python interpreter:
   - Windows: the official [distribution](https://www.python.org/downloads/)
   - Linux (Ubuntu / Debian): the system Python with additional packages
   - macOS: Python installed using Homebrew
2. Text editor (Python syntax support is helpful).
3. `pipx` [url](https://pipx.pypa.io/stable/)

---

# Python installation

Python packages used in the course will be installed in virtual environments (`venv`), not in the system Python.

1. Windows (10 / 11):

   > - log in to the `python_course` account
   > - open [link](https://www.python.org/downloads/windows/) and download the **Python install manager** (`Installer (MSIX)`)
   > - run the downloaded file and click `Install` (do not run it as an administrator)
   > - open PowerShell
   > - enter: `python -V / --version` to check if Python is working (follow the instructions if Python needs to be installed or configured)
   > - check `pip`:

   ```powershell
   python -m pip --version
   ```

   **Note:** You can also install the same Python install manager from the [Microsoft Store](https://apps.microsoft.com/detail/9nq7512cxl7t). If `python` does not work, check `Manage app execution aliases` in Windows Settings.

2. Linux (Debian / Ubuntu):

   Python 3 is usually already installed. To install the additional Python components (including `venv`):

   ```bash
   sudo apt update
   sudo apt install python3-full
   python3 --version
   ```

   **Note:** Do not use `sudo pip install` to install Python packages for the course.

3. macOS:

   If Homebrew is already installed (see the previous setup instructions):

   ```bash
   brew install python@3.14
   python3.14 --version
   ```

   **Note:** Do not modify the Python provided by Apple.

---

# Text editor

We will use `micro`, a simple open source editor working in the terminal. It is easy to use, supports Python syntax
highlighting and works on all three systems.

You can use any text editor, but **for this course it should work in the terminal**. If you already use a terminal
editor (e.g. `vim` or `nano`), you can continue using it. Otherwise, install `micro`.

1. Windows:

   ```powershell
   winget install --id zyedidia.micro -e
   ```

2. Linux (Debian / Ubuntu):

   ```bash
   sudo apt install micro
   ```

3. macOS:

   ```bash
   brew install micro
   ```

Check the installation:

```text
micro -version
```

---

# pipx

From docs:
> pipx is a tool to help you install and run end-user applications written in Python.

Some Python tools (e.g., linters/formatters for *.py files) are convenient to install once per user, not in every
virtual environment. Use pipx: it installs each tool into its own isolated venv and exposes a global command in your
user PATH.

1. Windows:

   ```powershell
   python -m pip install --user pipx
   python -m pipx ensurepath
   # restart PowerShell
   ```

2. Linux (Debian / Ubuntu):

   ```bash
   sudo apt install pipx
   pipx ensurepath
   # restart the terminal
   ```

3. macOS:

   ```bash
   brew install pipx
   pipx ensurepath
   # restart the terminal
   ```

Check the installation:

```text
pipx --version
```
