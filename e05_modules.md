# Using `Python` modules

Generally speaking, Python code is divided into parts called `modules`. Modules are usually text files
with the `.py` extension. Modules can be:

- included in the Python standard library (e.g. `sys`, `math`)
- installed from external packages (e.g. `numpy`, `matplotlib`)
- created by the user

To use a module:

- external packages must first be installed in the active Python environment
- modules are loaded using the `import` statement

## Module search paths

Because modules are stored in files, Python must `know` where to look for them.
Python searches for modules using directories stored in the `sys.path` list. These include:

- the directory containing the executed script (or the current directory in interactive Python)
- directories specified in the system environment variable `PYTHONPATH`
- directories containing the Python standard library and installed packages (`site-packages`)

### `PYTHONPATH` vs `sys.path`

- `PYTHONPATH` - an optional system environment variable containing additional directories where Python should look for
modules
- `sys.path` - a Python list containing the search paths used to find modules

When Python starts, directories specified in `PYTHONPATH` are added to `sys.path`, together with other default directories.

The `sys.path` list can be modified while the interpreter is running. Such modifications are lost after ending the Python
session.


### Checking `PYTHONPATH`

Windows (PowerShell):

```powershell
$env:PYTHONPATH
```

Linux (Bash):

```bash
echo "$PYTHONPATH"
```

macOS (Zsh):

```bash
echo "$PYTHONPATH"
```

**Note:** If nothing is displayed, `PYTHONPATH` may be unset or empty. This is normal - Python still uses its default module search paths.



### Checking `sys.path`

In IPython (all systems):

```python
import sys
sys.path
```

---



# Making modules available for import

There are several ways to make Python modules available for import.

## 1. Place the module in the script directory

The simplest solution is to place the module in the same directory as the executed script.

| Advantages | Disadvantages |
|---|---|
| Simple solution, no additional configuration | The module is not automatically available to scripts in other directories |
| Works immediately using `import` | Inconvenient when sharing modules between projects |




## 2. Modify `sys.path`

Add the directory containing modules to the Python search path.

Example (Windows):

```python
import sys
sys.path.insert(0, r'C:\my_modules')
```

- `sys.path.insert(0, path)` - adds a directory at the beginning of the search list
- `sys.path.append(path)` - adds a directory at the end of the search list

The `r` prefix indicates a raw string, allowing Windows paths to be written using backslashes without escaping them.

| Advantages | Disadvantages |
|---|---|
| Simple and flexible | Must be repeated in each new Python session |
| Works with modules stored in different directories | Adds configuration code to scripts |
| Useful for experiments | May cause conflicts with modules of the same name |



## 3. Set the `PYTHONPATH` environment variable

Add directories to `PYTHONPATH` before starting Python. They will be included in `sys.path`.

The variable can be set temporarily (for one terminal session) or permanently in the system or user environment settings.

| Advantages | Disadvantages |
|---|---|
| No changes to Python code | Depends on system configuration |
| Can make modules available to multiple scripts | May affect different Python environments, including `venv` |
| Can be set temporarily or permanently | Makes projects less portable |



## 4. Install a module or package in the Python environment

External packages can be installed using `pip`:

```bash
python -m pip install numpy
```

A properly configured local Python project can also be installed from its directory:

```bash
python -m pip install .
```

| Advantages | Disadvantages |
|---|---|
| Standard solution | Installation required in each environment |
| Modules available regardless of the working directory | Local projects need installation configuration (usually `pyproject.toml`) |
| Dependencies managed within the selected environment | Changes to local source code may require reinstallation |



## 5. Install a local project in editable mode

From a properly configured Python project directory:

```bash
python -m pip install -e .
```

| Advantages | Disadvantages |
|---|---|
| Modules available regardless of the working directory | Requires installation configuration (usually `pyproject.toml`) |
| Changes to Python source files do not normally require reinstallation | Depends on the original source directory |
| Useful during project development | Must be installed separately in each environment |

# Which method should you use?

- **A small project with one or several scripts** - place your modules in the script directory whenever possible.
- **Quick experiments in Python or IPython** - use `sys.path.insert()` to temporarily add a directory containing modules.
- **An external library (e.g. NumPy, Pandas)** - install it using `pip` in the active virtual environment.
- **Your own reusable module or package** - consider installing it in the selected environment.
- **A larger project under development** - consider an editable installation (`pip install -e .`).
- **Special cases requiring environment-level configuration** - use `PYTHONPATH` if justified. Avoid setting it globally without a specific reason.

