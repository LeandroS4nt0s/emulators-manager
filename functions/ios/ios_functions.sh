#!/usr/bin/env bash

# Function to list iOS emulators using dialog
list_ios_emulators_dialog() {
    string_with_all_devices_names_together=$(xcrun simctl list devices available -j | grep  name | sed 's/"name" ://g')
    arr_devices_names=()

    while IFS='"' read -r _ device_name _; do
        arr_devices_names+=("$device_name" "")
    done <<< "$string_with_all_devices_names_together"

    dialog --clear --backtitle "$msg_contribute_to_project" --title "$msg_ios_emulator_manager" --menu "$msg_choose_ios_emulator" 15 60 6 "${arr_devices_names[@]}" 2>/tmp/option.txt

    option_selected=$(cat /tmp/option.txt)

    if [ -z "$option_selected" ]; then
        clear
        exit
    else
        xcrun simctl boot "$option_selected"
        open -a Simulator
    fi
}
