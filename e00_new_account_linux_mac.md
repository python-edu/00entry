# Intro

On Linux and macOS, creating a separate account for the course is **optional** because:

- both systems separate user files and settings
- Python virtual environments (`venv`) allow us to install Python packages without changing the system Python
- most course tools can be used without changing the system configuration

A separate account can still be useful to keep all course files and settings in one place and remove them after the course.

# Linux (Ubuntu / Debian)

Ubuntu and Debian use `apt` as the default package manager. It allows us to install, update and remove software using the terminal.

For example:

```bash
sudo apt update
sudo apt install git
```

The `sudo` command allows a user with administrator privileges to install system packages.

## New account (optional)

To create a separate account for the course:

> - open the terminal
> - create a new user (in the example it is `python_course`):

```bash
sudo adduser python_course
```

> - follow the instructions and set a password
> - add the new user to the `sudo` group to allow software installation:

```bash
sudo usermod -aG sudo python_course
```

> - log out and log in to the new account
> - check if `sudo` works:

```bash
sudo apt update
```

The new account can now install software using `apt`.

**Note:** The `sudo` group gives the new account administrator privileges. Packages installed with `apt` are available system-wide and will not be removed when the account is deleted.

# macOS

Unlike Linux, macOS does not provide a package manager like `apt`.

For this purpose, we will use [Homebrew](https://brew.sh/) – a free and open source package manager for macOS.

Homebrew allows us to install and update tools using the terminal.

## Homebrew installation

> - open the terminal
> - check if Homebrew is already installed:

```bash
brew --version
```

If Homebrew is not installed:

> - open [Homebrew](https://brew.sh/)
> - copy and run the installation command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> - follow the instructions (administrator password may be required)
> - follow any additional instructions displayed after installation
> - check the installation:

```bash
brew --version
```

## New account (optional)

To create a separate account for the course:

> - open `System Settings`
> - go to `Users & Groups`
> - click `Add User`
> - select `Standard` as the account type
> - enter the account name (e.g. `python_course`) and password
> - click `Create User`
> - log out and log in to the new account

