# Emulators Manager
Boot your Android and IOS emulator in a quick and easy way

The `emulators-manager` is a tool to manage Android and iOS emulators on yours systems.

## Installation

1. Clone the GitHub repository to your local machine:

    ```bash
    git clone https://github.com/LeandroS4nt0s/emulators-manager.git
    ```

2. Navigate to the project directory:

    ```bash
    cd emulators-manager
    ```

3. Navigate to the folder called main:

    ```bash
    cd main
    ```

4. Grant execute permission to the script:

    ```bash
    chmod +x emulators-manager.sh
    ```

## Usage

The `emulators-manager.sh` script provides an interactive interface to list and start Android and iOS emulators. To execute the script, simply use the following command into `main` folder:

```bash
./emulators-manager.sh
```


When you run the script for the first time, you will see this message bellow. This show to you where the alias `em` was added and it drives you to run a code that helps you to load the alias from anywhere in the terminal.

  ![message](https://github.com/LeandroS4nt0s/emulators-manager/blob/main/resources/message.png)

## 

After stop the script you must run the code suggested by the script (optional). the code is dynamic, it depends about your shell file. in this example `.bash_profile`. but maybe it will show to you `.bashrc` ,  `.bash_login `, `.zshrc` etc:

```bash
 source ~/.bash_profile  
```
## 

Now you can just type `em` in any directory in the terminal:
- **Exemple**:
  
 ![language](https://github.com/LeandroS4nt0s/emulators-manager/blob/main/resources/language.png)
  
## Menu Options

- **Choose a language:**
  - Before starting, you will have the option to choose between English and Portuguese. Just type the number to select and press enter key.
   
    ![language](https://github.com/LeandroS4nt0s/emulators-manager/blob/main/resources/language.png)

- **Menu:**
  - The menu you can see all options available to your system.
 
    ![menu](https://github.com/LeandroS4nt0s/emulators-manager/blob/main/resources/menu.png)

- **Android Emulators Manager:**
  - When you select this option, you can list and start available Android emulators on your system.
 
    ![android](https://github.com/LeandroS4nt0s/emulators-manager/blob/main/resources/android.png)

- **iOS Emulators Manager:**
  - This option allows you to list and start available iOS emulators on your system. This option is only available if you are on a macOS system.
 
     ![ios](https://github.com/LeandroS4nt0s/emulators-manager/blob/main/resources/ios.png)

- **Contribute to this Project:**
    - This option opens the default browser to the GitHub page of the project, where you can contribute with suggestions, report issues, or submit pull requests.

- **Exit:**
  - Terminates the script.
