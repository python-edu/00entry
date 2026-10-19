# TOML

> Tom's Obvious Minimal Language - [url](https://toml.io/en/)
>  - a config file format for humans.

Characteristic features of the file format:
  - it is case-sensitive.
  - it must be a valid UTF-8 encoded Unicode document
  - a hash symbol (`#`) marks the rest of the line as a comment
    ```# This is a comment```
  
  - tables (hash tables or dictionaries) are collections of key/value pairs
    ```bash
      [table_name]
      key = val   # "some string", number, and others
    ```


# pyproject.toml 

## Sources
  - Python [Packaging Guide](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#writing-pyproject-toml)
  - Hatch [configuration](https://hatch.pypa.io/1.13/config/metadata/)

## Minimal toml 
**Toml for `hatchling`**:

  ```bash
    [build-system]                        # backend for python build
    requires = ["hatchling >= 1.26"]
    build-backend = "hatchling.build"



    [project]
    name = "your-app"                     # required
    version = "0.0.1"                     # required

    authors = [
      { name = "...", email = "..." },
    ]

    dependencies = [                      # required
      "...",
    ]


    [project.scripts]
    cli-name = "pkg.subpkg:func"          # after installing `cli-name` can run script
  ```


