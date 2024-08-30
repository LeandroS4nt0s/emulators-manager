#!/usr/bin/env bash

# Obtém o diretório do script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Obtém o diretório pai do diretório do script
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Carrega os arquivos de funções
source "$PARENT_DIR/functions/android/android_functions.sh"
source "$PARENT_DIR/functions/ios/ios_functions.sh"
source "$PARENT_DIR/functions/generals/open_github.sh"
source "$PARENT_DIR/functions/generals/add_alias.sh"

# adding alias emulators to the user profile
add_alias_to_profile

# Language selection
echo "Choose your language"
echo
echo "1) English"
echo "2) Portuguese"
echo
echo "Tip: Type control + c to exit"
read -r language_choice

# Function to set language based on user's choice
set_language() {
    case $1 in
    1)  # English
        msg_install_dialog="The 'dialog' package is not installed. Do you want to install it? (y/n)"
        msg_dialog_not_installed="The script requires 'dialog' to run. Install 'dialog' and run the script again."
        msg_android_emulator_manager="ANDROID EMULATOR MANAGER"
        msg_ios_emulator_manager="IOS EMULATOR MANAGER"
        msg_choose_android_emulator="Choose an Android emulator to start"
        msg_choose_ios_emulator="Choose an IOS emulator to start"
        msg_contribute_to_project="Contribute to this Project!"
        msg_start_cycle="Select an option!"
        msg_title="IOS/ANDROID EMULATOR MANAGER"
        msg_choose_exit="Exit"
        ;;
    2)  # Português
        msg_install_dialog="O pacote 'dialog' não está instalado. Deseja instalá-lo? (s/n)"
        msg_dialog_not_installed="O script requer o 'dialog' para ser executado. Instale o 'dialog' e execute o script novamente."
        msg_android_emulator_manager="GERENCIADOR DE EMULADORES ANDROID"
        msg_ios_emulator_manager="GERENCIADOR DE EMULADORES IOS"
        msg_choose_android_emulator="Escolha um emulador Android para iniciar"
        msg_choose_ios_emulator="Escolha um emulador IOS para iniciar"
        msg_contribute_to_project="Contribua com esse Projeto!"
        msg_start_cycle="Selecione um opção!"
        msg_title="IOS/ANDROID GERENCIADOR DE EMULADORES"
        msg_choose_exit="Sair"
        ;;
    esac
}

# Set language
set_language "$language_choice"

# Verifying the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux OS
    package_manager="apt-get"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    package_manager="brew"
else
    # Unsupported OS
    echo "Unsupported operating system."
    exit 1
fi

# Verifying architecture
if [[ "$(uname -m)" == "arm64" ]]; then
    dialog_install_command="arch -arm64 brew install dialog"
else
    dialog_install_command="brew install dialog"
fi

# Verifying if dialog is installed
if ! command -v dialog &>/dev/null; then
    echo "$msg_install_dialog"
    read -r install_dialog

    if [ "$install_dialog" == "y" ]; then
        eval "$dialog_install_command"
    else
        echo "$msg_dialog_not_installed"
        exit 1
    fi
fi

# Starting the Cycle!
while true; do
    cmd=(dialog --clear --backtitle "$msg_contribute_to_project" --title "$msg_title" --menu "$msg_start_cycle" 15 60 6)
    
    # Check if the OS is macOS, then add iOS option
    if [[ "$OSTYPE" == "darwin"* ]]; then
         options=(
            1 "$msg_choose_android_emulator"
            2 "$msg_choose_ios_emulator"
            3 "$msg_contribute_to_project"
            4 "$msg_choose_exit"
        )
    
    else 
        options=(
            1 "$msg_choose_android_emulator"
            2 "$msg_contribute_to_project"
            3 "$msg_choose_exit"
        )
    fi
    
    choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

    if [[ "$OSTYPE" == "darwin"* ]]; then
        case $choice in
            1) list_android_emulators_dialog ;;
            2) list_ios_emulators_dialog ;;
            3) open_github_repository ;;
            4) exit && clear;;
        esac
    
    else 
        case $choice in
            1) list_android_emulators_dialog ;;
            2) open_github_repository ;;
            3) exit && clear ;;
        esac
    fi
    
done # Closing loop
