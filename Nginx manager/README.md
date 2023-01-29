# Nginx manager for Windows
This CLI tool simplifies the management of Nginx on Windows.  
You can easily start, reload, and stop Nginx using simple commands.  
Additionally, this manager prevents the simultaneous running of multiple Nginx processes, which can cause Nginx to malfunction.

# Installation
## 1. Create a folder for custom commands
Create a folder anywhere on your device, add the folder's path to the `PATH` variable, and then restart your device.  
For example, create a folder `C:\custom-commands`, then add `C:\custom-commands` to the `PATH` variable.

## 2. Download the required file
Download the latest version of the Nginx manager from the release page or use the following link:

- [Latest version](https://github.com/OnCloud125252/Windows-Helper/releases/latest)

After downloading, move the file to the folder you created in step 1.

> Warning:
> The file must be named `nginx.bat`, otherwise the command will not work.

## 4. Configuration
Use any text editor to open the `nginx.bat` file and locate the configuration section:
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
- `nginx_Dir` is ***required***  
It must be the folder that contains `nginx.exe`.
- `editor_name` is ***required***  
Enter the name of your preferred editor, it will be used to open the config file.
- `editor_options` is ***optional***  
Enter any options you want to pass to the editor when opening the config file.

# Usage
Basic command usage:
```bash
nginx [option]
```
## Options
- `help`  
Display a list of all avliable commands.  
![](https://i.ibb.co/jvD1Sp2/image.png)

- `start`  
Start the Nginx service.  
![](https://i.ibb.co/3BY5j6d/image.png)

- `config`  
Open the configuration file using your preferred editor.  
![](https://i.ibb.co/L96P70W/image.png)

- `reload`  
Reload the Nginx service with the latest config file.  
![](https://i.ibb.co/hDk6j2L/image.png)

- `stop`  
Perform a fast shutdown of Nginx.  
![](https://i.ibb.co/R2hZ0qc/image.png)

- `quit`  
Shut down Nginx gracefully.  
![](https://i.ibb.co/B4STmFx/image.png)


- `clear`  
Exit all currently running Nginx processes.  
![](https://i.ibb.co/6mzt7Pm/image.png)

# Screenshots
### Provide smarter output
![](https://i.ibb.co/J7LJq0m/image.png)

### Works on both Command Prompt and Powershell
![](https://i.ibb.co/CWKfK1h/image.png)