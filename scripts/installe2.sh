#!/bin/bash
#### Descripción: Instalador NormandyEPG enigma2
### Creador por: DarzLir para NormandyEPG.es | Monkey Brothers
## 08/2021


##Variables
carpeta_providers="/usr/crossepg/providers"


cat << "EOF"

███╗   ██╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ██╗   ██╗███████╗██████╗  ██████╗ 
████╗  ██║██╔═══██╗██╔══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝ 
██╔██╗ ██║██║   ██║██████╔╝██╔████╔██║███████║██╔██╗ ██║██║  ██║ ╚████╔╝ █████╗  ██████╔╝██║  ███╗
██║╚██╗██║██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║  ╚██╔╝  ██╔══╝  ██╔═══╝ ██║   ██║
██║ ╚████║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝   ██║   ███████╗██║     ╚██████╔╝
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚═╝   ╚══════╝╚═╝      ╚═════╝ 
Monkey Brothers Team | Instalador NormandyEPG universal - Enigma2/CrossEPG
											
EOF
echo
echo -e Web: "\e[96mhttps://normandy.es     \e[0m"
echo -e Telegram: "\e[96mt.me/mecoolki   \e[0m"
echo


	echo
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m# Iniciando script de instalación de NormandyEPG  #\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
sleep 2
	
	
##Actualizamos fuentes
	echo
	echo
	echo -e "\e[38;5;198mPaso 1:\e[0m"
	echo -e "\e[32mActualizando Fuentes\e[0m"
			opkg update > /dev/null 2>&1 
wait
sleep 2

	
##Instalamos CrossEPG
	echo
	echo
	echo -e "\e[38;5;198mPaso 2:\e[0m"
	echo -e "\e[32mInstalando CrossEPG\e[0m"
			opkg install enigma2-plugin-systemplugins-crossepg > /dev/null 2>&1
wait
sleep 2
	
	
##Borramos antiguo archivo si existiera
	echo
	echo
	echo -e "\e[38;5;198mPaso 3:\e[0m"
	echo -e "\e[31mBorrando anterior configuración\e[0m"
		cd $carpeta_providers
			rm -f NormandyEPG.conf
wait
sleep 2
	

##Descargamos .conf
	echo
	echo
	echo -e "\e[38;5;198mPaso 4:\e[0m"
	echo -e "\e[32mDescargando proveedor NormandyEPG para CrossEPG\e[0m"
		cd $carpeta_providers
			curl -O http://NormandyEPG.github.io/epg/NormandyEPG.conf > /dev/null 2>&1 
sleep 2


##Final instalación y aviso de activación
	echo
	echo
	echo -e "\e[38;5;198mPaso 5:\e[0m"
	echo -e "\e[32mArchivos descargados\e[0m"
	echo
	echo
	echo 'Por favor, activa el proveedor NormandyEPG en los ajustes de CrossEPG'
	echo -e "\e[36mAjustes->EPG->CrossEPG->Proveedor Script\e[0m" 	
	echo Será necesario activarlo y posteriormente hacer una descarga.
	echo
	sleep 5		