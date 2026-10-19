 # Virtual environments

A virtual environment is a separate Python environment used to install Python software and run scripts without changing the main Python installation. It helps avoid conflicts between projects.

There are different tools for creating and managing virtual environments, e.g.:

- `venv` - included with Python
- `virtualenv`
- `conda`
- `mamba` / `micromamba`
- `Pipenv`
- `Poetry`
- `uv`

During the course, we will use `venv` to run scripts and install Python software, including our own projects. Documentation can be found [here](https://docs.python.org/3/library/venv.html).

The basic commands for managing virtual environments are listed below.

---

### Venv commands

1. Creating environments:
   - Windows: `python -m venv environment_name`
   - Linux: `python3 -m venv environment_name`
   - macOS: `python3.14 -m venv environment_name`

   **Note:** On macOS, the Python version number (e.g. `3.14`) depends on the version installed on your computer.

2. Environment activation:
   - Windows: `environment_name/Scripts/activate`
   - Linux: `source environment_name/bin/activate`
   - macOS: `source environment_name/bin/activate`

3. Environment deactivation:
   - `deactivate` (all systems)

4. Installing Python software:
   - `python -m pip install module_1 module_2 ...`

5. Installed modules:
   - `requirements.txt` - a file containing a list of Python software to be installed or already installed in the environment in [pip txt format](https://pip.pypa.io/en/stable/reference/requirements-file-format/#requirements-file-format)
   - `python -m pip install -r requirements.txt` - installs the software listed in the file
   - `python -m pip freeze > requirements.txt` - saves a list of installed packages and their versions, including dependencies

---

### Conda commands

> ⚠️ **Warning:** The information about the `conda` manager may be outdated (it has not been updated since 2022). ⚠️

1. Creating environments:
   - `conda create -n environment_name`
   - `conda activate environment_name`
   - `conda deactivate`

2. Installing the modules
   - `conda install module_1 module_2 ...`

3. Installed modules
   - a file containing a list of modules installed in the environment in [yaml format](https://yaml.org/spec/1.2.2/).
   - `conda env export --from-history > environment.yml`
   - `conda env create -f environment.yml`

---

# Venv vs Conda

## Basic differences

| Venv | Conda |
|---|---|
| Included with Python; uses an existing Python installation | Requires installing Conda (e.g. Miniconda or Anaconda); can install and manage Python versions |
| Environments are usually created in the project directory (one per project) | Environments are stored in one main directory by default, allowing centralized management |
| `venv` creates environments; `pip` installs Python software | `conda` manages environments and packages; `pip` can also be used |
| Does not manage non-Python system dependencies directly | Can manage binary and non-Python software dependencies |
| Sufficient for most Python projects | Useful for projects with complex software dependencies |



## When to use

**When is Conda really needed?**

If a project works with `venv`, `pip` and available system tools, there is no need to use Conda.

Conda becomes useful when required software or binary dependencies cannot be installed or managed reliably using these tools, or when a project specifically requires a Conda environment.

**Conda is not required just because a project involves scientific computing, data analysis or Jupyter.**
