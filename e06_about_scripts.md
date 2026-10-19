# Scripts and modules
---

Scripts and modules in `Python` are text files with the `.py` extension. Generally speaking, modules
contain function/class definitions and scripts use these functions/classes.

The scripts are run like programs. They contain program code, but can also contain function and class
definition code - especially if they were only defined for a specific script.

A clear division will be maintained for classes:

 - the functions will be placed in separate files - modules
 - scripts are files that run as command line programs


# Script creation rules

The script will be created in stages:

 - in the first step, individual lines of code will be tested interactively from the `ipython` text
   console or `JupyterLab`. Working code will be saved to the module file as functions.
 - in the second step the created functions will be checked by importing them to the `ipython` text
   console or `JupyterLab`
 - the third step is to build the script from working, already checked, fragments of code and functions

>Note:
>If a module is modified after being imported into IPython, it may need to be reloaded to use the updated code.


# Launching the script

The script will be launched from a system terminal (`PowerShell` on Windows):

1. Run the system terminal
2. Activate a virtual environment containing the necessary modules e.g.
   >- `your_environment/Scripts/activate` (Windows)
   >- `source your_environment/bin/activate` (Linux / macOS)

3. Run the script by typing:
   > `python script_name.py arg1 arg2 ...`

---

# Basic script architecture

The following code shows the general architecture of a Python script. It is a scheme, not a complete program intended
to be executed directly.

```python
# -*- coding: utf-8 -*-

# ---
# modules / functions import section
# examples:

import sys
import codecs
import argparse


# ---
#script description and constants creation section

description = '''
Create a description of how your script works
'''

# ---
# function definition section

def parser_function():
    '''Function parsing command line arguments'''
    parser = argparse.ArgumentParser(description = description)

    # Add arguments to your script: mandatory, i.e. positional and optional
    # parser.add_argument('someArg', type=str, help='help text')

    args = parser.parse_args()
    return args

# ---

def fun1():
    pass


def fun2():
    pass


def fun3():
    pass


# ---
#code execution section after running the script as a program

if __name__ == '__main__':

    #... load command line arguments .............
    args = parser_function()

    # next steps of the program

```

### First line

```python
# -*- coding: utf-8 -*-
```

Python 3 uses `UTF-8` as the default encoding for source files. The encoding declaration is optional, but can be included for clarity.

>Note:
>The character `#` indicates that the line is a comment

---

Good practice is also:

  >- setting the editor to encode `utf-8`
  >- not to use diacritical marks, especially in file names, directories, variables
  >- not use white characters (spaces, tabs) or special characters (e.g. `!`) in file names, directories, variables


### Function `parser_function()`

The recommended module to get script arguments from the command line is `argparse`:

> "This tutorial is intended to be a gentle introduction to argparse, the recommended command-line parsing module in the Python standard library."

(from *https://docs.python.org/3/howto/argparse.html*)

The use of the module can be reduced to creating a function that will handle the arguments of the script:

```python
def parser_function():
```

Inside the function:

  - a parser object is created: `parser = argparse.ArgumentParser()`
  - further arguments are added: `parser.add_argument("someArg")`

An example showing how the script works is referenced in the [course GitHub
repository](https://github.com/python-edu/00entry). Find the file `script_demo.py` and run it in the console:

  - `python script_demo.py -h` - to display help
  - `python script_demo.py 5 2 -p someFolderName` - to see how the script works, where `5` and `2` are positional
  arguments and `-p` specifies an optional folder path


### Variable `__name__`

```python
if __name__ == '__main__':
```

When the Python interpreter executes a file, it sets the value of a special variable `__name__`:

  - the module name if it is imported, e.g.: `import myImProc` then `__name__ == 'myImProc'` inside that module
  - `'__main__'` if it is run as a program: `__name__ == '__main__'`

In practice, if a script is run as a program, the code inside the `if __name__ == '__main__':` block is executed. If the file is imported as a module, this block is not executed.

