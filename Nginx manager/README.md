# Nginx manager for Windows
This is a CLI tool for managing Nginx on Windows.  
With this manager, you can easily start/reloadp/stop Nginx using simple command.  
Also, this manager can prevent running multiple Nginx processes at the same time.  
Running multiple Nginx processes at the same time might cause Nginx not work properly.  

# Installation
## 1. Create folder for custom command
Create a folder any where on your device, add the folder's path to enviroment variable, then restart your device.  
For example, I create a folder `C:\custom-commands`, then add `C:\custom-commands` to `PATH` variable.

## 2. Download required file
Download the latest version of Nginx manager on the release page or using the following link.

- Latest version

After that, move the file to the folder you just created.  

> Warning:  
> The file should be named `nginx.bat`, otherwise the cmmand wont work.

## 4. Configuration

Use any text editor to open the file, find the configuration section:  
```bat
::: Command Config
:: Path of Nginx *required*
SET nginx_Dir=C:\Program Files\nginx-1.22.1
:: Name of preferred editor *required*
SET editor_name=code-insiders
:: Option for preferred editor *optional*
SET editor_options=-w
::: END
```
- `nginx_Dir` ***required***  
Must be the folder that contains `nginx.exe`.
- `editor_name` ***required***  
Enter the name of the editor you preferred, it will be used to open the config file.
- `editor_options` ***optional***  
The option for the editor when opening the config file.

# Usage
Basic command usage:
```bash
nginx [option]
```
## Options
- `help`  
Display a list of all avliable commands.

- `start`  
Start Nginx service.

- `config`  
Open the configuration file using editor you preferred.

- `reload`  
Reload the Nginx service with latest config file.

- `stop`  
Fast shutdown Nginx.

- `quit`  
Shutdown Nginx gracefully.

- `clear`  
Exit all current running Nginx processes.