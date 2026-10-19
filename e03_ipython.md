# Ipython

> - `ipython`: interactive Python interpreter console, see [here](https://ipython.readthedocs.io/en/stable/index.html)
> - ipython tutorial: [here](https://ipython.readthedocs.io/en/stable/interactive/index.html)


### IPython installation

> - activate the virtual environment in which you want to work
> - install `ipython`:

```bash
python -m pip install ipython
```

**Note:** IPython should be installed in each virtual environment where you want to use it. This allows access to the
Python packages installed in that environment.


### Start `ipython`:

> in the system terminal (`PowerShell` on Windows) write `ipython`:

```bash
ipython
```

### Keyboard shortcuts:

- `TAB` - completes and suggests syntax
- `name_object + ?` e.g. `myFunction?` displays description (docstring) if available
- `%hist / %hist -n` - displays history of entered commands / with line numbers
- `ctrl + o` - inserts a new line after the cursor
- `ctrl + a` - moves the cursor to the beginning of the line
- `ctrl + e` - moves the cursor to the end of the line
- `ctrl + l` - clears the screen
- `ctrl + c` - interrupts the current action
- `ctrl + u` - deletes text from the beginning of the line to the cursor

### Magic commands

In the `ipython` console you can run the so-called magic commands. These commands are preceded by the `%` character, e.g.:

- `%ls` shows the contents of the current directory
- `%cd` allows you to change the current directory

List and description of available commands: [here](https://ipython.readthedocs.io/en/stable/interactive/magics.html#line-magics)

# Saving (logging) a session

All work done in ipython can be saved to a text file using one of the magic commands:

> - `%logstart`
> - `%history` / `%hist`
> - `%save`

Example with `%hist`:

> `%hist -n -o -f path_to_my_history_file.txt`

Where:

- `-n` - includes line numbers
- `-o` - includes outputs
- `-f` - saves the history to a file

# Working with ipython

You can run the code in the text console:
- single lines of code
- multi-line code
- you can define functions and classes

The `%edit` (in short `%ed`) magic function allows you to quickly navigate to the text editor associated with `ipython`.

To use `micro` as the editor, execute in IPython:

```ipython
%config TerminalInteractiveShell.editor = 'micro'
```

This setting applies only to the current IPython session.

### Example:

- define function:

```python
def f1():
    print('abc')
```

- call the magic function: `%save file_name.py line_number` defining the function definition, e.g.:
  > - `%save test.py 5` - if the function was defined in input `In [5]`

- a `test.py` file will be created in the working directory
- run function: `f1()`
- modify function code:
  > - execute: `%edit test.py`
  > - modify function code
  > - save the changes and close the file, which will take you back to the console

- call the updated `f1()` function
- you can also immediately indicate the function to be edited by giving its name instead of the file name:
  > - `%ed f1`
