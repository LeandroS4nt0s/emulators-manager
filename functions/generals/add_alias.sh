#!/usr/bin/env bash

# Função para adicionar o alias ao perfil do usuário
add_alias_to_profile() {
    PROFILE_FILE=""
    if [ -f "$HOME/.bash_profile" ]; then
        PROFILE_FILE="$HOME/.bash_profile"
    elif [ -f "$HOME/.bashrc" ]; then
        PROFILE_FILE="$HOME/.bashrc"
    elif [ -f "$HOME/.zshrc" ]; then
        PROFILE_FILE="$HOME/.zshrc"
    else
        echo "Could not detect profile file (.bash_profile, .bashrc, .zshrc)"
        exit 1
    fi

    ALIAS_COMMAND='alias emulators="'"$SCRIPT_DIR/emulators.sh"'"'

    # Verifica se o alias já está no perfil
    if ! grep -q "$ALIAS_COMMAND" "$PROFILE_FILE"; then
        echo "$ALIAS_COMMAND" >> "$PROFILE_FILE"
        echo "Alias ​​added to profile file: $PROFILE_FILE"
    fi
}
