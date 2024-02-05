#!/usr/bin/env bash

# Função para adicionar o alias ao perfil do usuário
add_alias_to_profile() {
    PROFILE_FILE=""
    INITIALIZER_PERFIL=""

    if [ -f "$HOME/.bash_profile" ]; then
        PROFILE_FILE="$HOME/.bash_profile"
        INITIALIZER_PERFIL="~/.bash_profile"

    elif [ -f "$HOME/.bashrc" ]; then
        PROFILE_FILE="$HOME/.bashrc"
        INITIALIZER_PERFIL="~/.bashrc"

    elif [ -f "$HOME/.zshrc" ]; then
        PROFILE_FILE="$HOME/.zshrc"
        INITIALIZER_PERFIL="~/.zshrc"

    else
        echo "Could not detect profile file (.bash_profile, .bashrc, .zshrc)"
        exit 1
    fi

    ALIAS_COMMAND='alias em="'"$SCRIPT_DIR/emulators.sh"'"'

    # Verifica se o alias já está no perfil
    if ! grep -q "$ALIAS_COMMAND" "$PROFILE_FILE"; then
        echo "$ALIAS_COMMAND" >> "$PROFILE_FILE"
        echo "Alias added to profile file: $PROFILE_FILE"
        echo -e  "You must run \033[1msource $INITIALIZER_PERFIL\033[0m after closing Emulators Manager for the first time to use the emulators alias from any directory"
        echo
    fi
}
