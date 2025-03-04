## Directory structure
During the course, scripts and notebooks will be created, data files, raster images will be downloaded and created, and
virtual environments will be created. All this data needs to be placed on the disk in some order (some organization of
files and directories). Below is a diagram showing such a structure, where:

- `my_account` - is the name of the user's home directory. All data and programs will be placed in this directory.
- `pyhon_course` - is a directory that will contain all the files related to the python course
- `jupyter` - will contain everything related to working in the `jupyter-lab` application: notebook files, environments,
  etc.
- `projects` - will contain everything related to working in the `ipython` terminal and python scripts. Each
  subdirectory (eg. `example_proj`) is a separate project with its own file and directory structure.
- `src` - is the commonly used name of the directory in which `*.py` files are placed


```plaintext
C:\Users\my_account\python_course\    - main python course folder
|
+---\data\                            - data shared between projects
|
+---\imgs\                            - images shared between projects
|
+---\jupyter\                         - includes notebooks and jupyter environments
|
+---\projects\                        - directory with exercises/projects
    |   
    +---\example_proj\                - project folder: data format conversion (csv, json, xml)
        |    pyproject.toml           - configuration file for script installation
        |    requirements.txt         - file for `pip` manager: list of modules to be installed
        |                               in the script's virtual environment
        |    README.md                - a file with a description of the project and how the script works
        |    
        +----\env_example_proj\       - directory with the installed virtual environment
        +----\example_proj\           - python package: directory containing python files
             |    main.py             - main script file
             |    
             +----\src\               - directory with python modules
                  |    parser.py
                  |    my_mod1.py
                  |    my_mod2.py
                  |    my_mod3.py
                  |
                  \templates\         - directory with report template files
                       template1.md
                       template2.md
```
