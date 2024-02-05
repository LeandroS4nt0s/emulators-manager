#!/usr/bin/env bash

# Function to list Android emulators using dialog
list_android_emulators_dialog() {
    list_android_emulator=$(emulator -list-avds)
    arr_android_emulators=()

    for emulator in $list_android_emulator; do
        arr_android_emulators+=("$emulator" "")
    done

    dialog --clear --backtitle "$msg_contribute_to_project" --title "$msg_android_emulator_manager" --menu "$msg_choose_android_emulator" 15 60 6 "${arr_android_emulators[@]}" 2>/tmp/option.txt

    option_selected=$(cat /tmp/option.txt)

    if [ -z "$option_selected" ]; then
        clear
        exit
    else
        emulator @"$option_selected"
    fi
}
