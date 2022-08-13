#!/bin/bash
#### Descripción: Instalador NormandyEPG docker
### Creador por: DarzLir para NormandyEPG.es | Monkey Brothers
## 08/2021


# Variables
NOMBRE_APP="NormandyEPG"
CARPETA_TVH="/storage/.kodi/userdata/addon_data/service.tvheadend43"
CARPETA_NORMANDY="/storage/.kodi/NormandyEPG/"
ACTUALIZACION_VER="Normandy_EPG.ver"
carpeta_channel="$CARPETA_TVH/channel/config/*"
carpeta_tag="$CARPETA_TVH/channel/tag/*"
ver_local=`cat $CARPETA_NORMANDY/$ACTUALIZACION_VER 2>/dev/null`
ver_web=`curl http://NormandyEPG.github.io/epg/Normandy_EPG.ver 2>/dev/null`


cat << "EOF"

███╗   ██╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ██╗   ██╗███████╗██████╗  ██████╗ 
████╗  ██║██╔═══██╗██╔══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝ 
██╔██╗ ██║██║   ██║██████╔╝██╔████╔██║███████║██╔██╗ ██║██║  ██║ ╚████╔╝ █████╗  ██████╔╝██║  ███╗
██║╚██╗██║██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║  ╚██╔╝  ██╔══╝  ██╔═══╝ ██║   ██║
██║ ╚████║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝   ██║   ███████╗██║     ╚██████╔╝
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚═╝   ╚══════╝╚═╝      ╚═════╝ 
Monkey Brothers Team | Instalador NormandyEPG universal - Docker
											
EOF
echo
echo -e Web: "\e[96mhttps://normandy.es     \e[0m"
echo -e Telegram: "\e[96mt.me/mecoolki   \e[0m"
echo


	echo
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m# Iniciando script de instalación de NormandyEPG  #\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
	echo
	echo -e "\e[38;5;198mComprobando versión instalada:\e[0m"
sleep 2
	echo -e "Versión instalada: \e[31m$ver_local\e[0m"
	echo
	echo -e "Versión a instalar: \e[32m$ver_web\e[0m"
	echo
	echo
	echo		
	echo -e "\e[38;5;198mPaso 1:\e[0m"
	echo -e "\e[32mBorrando configuración actual\e[0m"
	echo 
sleep 2
		
		
##Borramos viejos grabbers de Normandy
			rm -f tvheadend:/usr/bin/tv_grab_NormandyEPGmv
			rm -f tvheadend:/usr/bin/tv_grab_NormandyEPGnm
		
	
##Borramos configuración actual de TVH
			docker exec tvheadend sh -c "rm -rf /config/bouquet/"
			docker exec tvheadend sh -c "rm -rf /config/epggrab/"
			docker exec tvheadend sh -c "rm -rf /config/profile/"
			docker exec tvheadend sh -c "rm -rf /config/service_mapper/"
			docker exec tvheadend sh -c "rm -rf /config/input/dvb/networks/b59c72f4642de11bd4cda3c62fe080a8/"
			docker exec tvheadend sh -c "rm -rf /config/xmltv/"
			docker exec tvheadend sh -c "rm -f /config/config"
			docker exec tvheadend sh -c "rm -f /config/settings.xml"
	
		
##Descargarmos el ZIP de NormandyEPG y paramos el servicio que corresponda	
	echo	
	echo -e "\e[38;5;198mPaso 2:\e[0m"
	echo -e "\e[32mDescargando NormandyEPG\e[0m"
	echo 
		sleep 1
			wget -q https://github.com/NormandyEPG/NormandyEPG.github.io/raw/main/epg/Normandy_EPG.zip
			unzip -o Normandy_EPG.zip 'picons/*' -d Normandy_EPG/ > /dev/null 2>&1	 
			unzip -o Normandy_EPG.zip 'bindocker/*' -d Normandy_EPG/ > /dev/null 2>&1	
			unzip -o Normandy_EPG.zip 'data/*' -d Normandy_EPG/ > /dev/null 2>&1	
			unzip -o Normandy_EPG.zip 'datadocker/*' -d Normandy_EPG/ > /dev/null 2>&1	
			unzip -o Normandy_EPG.zip 'Normandy_EPG.ver' -d Normandy_EPG/ > /dev/null 2>&1	


##Paramos el docker para evitar conflictos al copiar y/o borrar archivos.
	echo	
	echo -e "\e[38;5;198mPaso 3:\e[0m"
	echo -e "\e[32mParando servicio TVHeadend\e[0m"
		docker stop tvheadend
	echo -e "\e[33mServicio TVHeadend parado\e[0m"
	echo
		sleep 2	


##Empezamos a copiar los archivos necesarios
	echo	
	echo -e "\e[38;5;198mPaso 4:\e[0m"
	echo -e "\e[32mInstalando configuración\e[0m"
	echo
		chmod +x ./Normandy_EPG/bindocker/*
		chmod +x ./Normandy_EPG/datadocker/*
		docker cp ./Normandy_EPG/picons/. tvheadend:/picons/
		docker cp ./Normandy_EPG/bindocker/. tvheadend:/usr/bin/
		docker cp ./Normandy_EPG/data/. tvheadend:/config/
		docker cp ./Normandy_EPG/datadocker/config tvheadend:/config/
		docker cp ./Normandy_EPG/datadocker/epggrab/config tvheadend:/config/epggrab
		docker cp ./Normandy_EPG/Normandy_EPG.ver tvheadend:/config/
		

##Borramos carpeta temporal
	echo	
	echo -e "\e[38;5;198mPaso 5:\e[0m"
	echo -e "\e[32mEliminando archivos temporales\e[0m"
	echo
		rm -rf Normandy_EPG.zip
		rm -rf ./Normandy_EPG/
	

##Reiniciamos el servicio de TVH
	echo	
	echo -e "\e[38;5;198mPaso 6:\e[0m"
	echo -e "\e[32mIniciando servicio TVHeadend\e[0m"
		docker restart tvheadend
	echo -e "\e[33mServicio TVHeadend iniciado\e[0m"
	echo
		sleep 2	
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m### EPG instalada, gracias por usar NormandyEPG ###\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
	echo
	
	
	echo -e "\e[31m¡¡ATENCIÓN!!\e[0m" 'Comprueba que el grabber está activo en la interfaz web de TVH (ipdeco:9981) para poder capturar la EPG'
	echo -e El grabber se encuentra en la pestaña "\e[36mCONFIGURACIÓN>CANAL/EPG>MÓDULOS PARA OBTENCIÓN DE GUÍA.\e[0m" 	
	echo La primera captura de EPG tardará unos minutos hasta que los procesos de TVH se terminen de iniciar, paciencia.
	echo
		sleep 3		