#!/usr/bin/env bash
# Gerenciando meus emuladores IOS/Android
Sleep 2s
clear

# iniciando o Ciclo!
while true; do
echo
echo "GERENCIADOR DE EMULADORES IOS/ANDROID"
echo
echo "1 - Listar emuladores Android"
echo "2 - Listar emuladores IOS"
echo "3 - Sair"
echo
read -p "Selecione uma opção :" opcao

Sleep 2s
clear

case $opcao in
        1)
		list_android_emulator=$(emulator -list-avds)
		android_index=$[0]
		echo
		echo "SELECIONE QUAL EMULADOR ANDROID DEVE INICIAR"
		echo

		for emulator in $list_android_emulator
		do
		echo "${android_index} - Iniciar o emulador $emulator"
		list_android_emulator[$android_index]=$emulator
		android_index=$[android_index+1]			
		done
		echo "${android_index} - Sair"
		echo
		
		read -p "Selecione qual emulador iniciar :" option_selected
		option_selected=${list_android_emulator[$option_selected]}
		
		if [ -z ${option_selected} ]; then
			clear
			exit
		else
    		emulator @${option_selected}
		fi

		exit
	 ;;
	2) 
		string_with_all_devices_names_together=$(xcrun simctl list devices available -j | grep  name | sed 's/"name" ://g')
		ios_index=$[0]
		arr_devices_names=()
		echo
		echo "SELECIONE QUAL EMULADOR IOS DEVE INICIAR"
		echo

		# Use o comando read para ler as device_names entre aspas duplas
		while IFS='"' read -r _ device_name _; do
			arr_devices_names+=("$device_name")
		done <<< "$string_with_all_devices_names_together"

		# Exibindo o conteúdo do array
		for device_name in "${arr_devices_names[@]}"; do
			echo "${ios_index} - $device_name"
			ios_index=$[ios_index+1]
		done
		echo "${ios_index} - Sair"
		echo
		
		read -p "Selecione qual emulador iniciar :" option_selected
		option_selected=${arr_devices_names[$option_selected]}
	
		if [ -z "${option_selected[@]}" ]; then
			clear
			exit
		else
			xcrun simctl boot "$option_selected"
			open -a Simulator
		fi
		clear
		exit
	;;
	3) exit ;;
esac

done # Fechando ciclo