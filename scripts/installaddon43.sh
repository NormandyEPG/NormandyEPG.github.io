#!/bin/bash
#### Descripción: Instalador NormandyEPG para TVH add-on 4.3
### Creador por: DarzLir para NormandyEPG.es | Monkey Brothers
## 08/2021


# Variables
NOMBRE_APP="NormandyEPG"
CARPETA_TVH="/storage/.kodi/userdata/addon_data/service.tvheadend43"
CARPETA_NORMANDY="/storage/.kodi/NormandyEPG"
CARPETA_NORMANDYTEMP="/storage/.kodi/NormandyEPG/tmp"
CARPETA_BIN="/storage/.kodi/addons/service.tvheadend43/bin"
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
Monkey Brothers Team | Instalador NormandyEPG universal - CoreELEC
											
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
			kodi-send -a "Notification($NOMBRE_APP,Instalacion NormandyEPG iniciada,3000)"  > /dev/null 2>&1
	echo
	echo		
	echo -e "\e[38;5;198mPaso 1:\e[0m"
	echo -e "\e[32mBorrando configuración actual\e[0m"
	echo 
sleep 2
	
	
##Borramos viejos grabbers de Normandy
			rm -f /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPG
			rm -f /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPG2
			rm -f /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGmv
			rm -f /storage/.kodi/addons/service.tvheadend43/bin/tv_grab_NormandyEPGnm
	

##Borramos configuración actual de TVH
			rm -rf $CARPETA_NORMANDY
		cd $CARPETA_TVH
			rm -f config
			rm -f settings.xml
			rm -rf bouquet/
			rm -rf epggrab/
			rm -rf profile/
			rm -rf service_mapper/
			rm -rf input/dvb/networks/b59c72f4642de11bd4cda3c62fe080a8/
			rm -rf xmltv/
	

##Borramos configuración vieja de TVH de NormandyEPG, conservando redes y canales mapeados por los usuarios
	rm -f 
	
	if [ "$1" != "ALL" ];then
		# Recorremos los ficheros de estas carpetas para borrar solo los que tengan la marca
		for fichero in $carpeta_channel $carpeta_tag
		do 
		   if [ -f "$fichero" ]; then  
			 ultima=$(tail -n 1 $fichero)
			 if [[ "$ultima" = $NOMBRE_APP ]]; then
			   rm -f $fichero 
			 fi
		   fi
		done
	else
		# Borramos todos los canales, tags y redes
		rm -rf $carpeta_channel
		rm -rf $carpeta_tag
		rm -rf input/
	fi
		
	
##Descargarmos el ZIP de NormandyEPG y paramos el servicio que corresponda	
	echo	
	echo -e "\e[38;5;198mPaso 2:\e[0m"
	echo -e "\e[32mDescargando NormandyEPG\e[0m"
	echo 
		sleep 2
		cd /storage/.kodi/
			mkdir NormandyEPG
		cd /storage/.kodi/NormandyEPG/
			wget -q https://github.com/NormandyEPG/NormandyEPG.github.io/raw/main/epg/Normandy_EPG.zip
	echo	
	echo -e "\e[38;5;198mPaso 3:\e[0m"
	echo -e "\e[32mParando servicio TVHeadend\e[0m"
			systemctl stop service.tvheadend43
	echo -e "\e[33mServicio TVHeadend parado\e[0m"
	echo
			sleep 2	

	
##Copiamos archivos de la carpeta temporal a las rutas definitivas
	echo	
	echo -e "\e[38;5;198mPaso 4:\e[0m"
	echo -e "\e[32mInstalando configuración\e[0m"
	echo
			unzip -o Normandy_EPG.zip -d $CARPETA_NORMANDYTEMP > /dev/null 2>&1		
		cd /storage/.kodi/
			cp -r $CARPETA_NORMANDYTEMP/Normandy_EPG.ver $CARPETA_NORMANDY
			cp -r $CARPETA_NORMANDYTEMP/picons/ $CARPETA_NORMANDY
			cp -r $CARPETA_NORMANDYTEMP/tpl/ $CARPETA_NORMANDY
			cp -r $CARPETA_NORMANDYTEMP/bin/* $CARPETA_BIN
			cp -r $CARPETA_NORMANDYTEMP/data/* $CARPETA_TVH
			cp -r $CARPETA_NORMANDYTEMP/data43/* $CARPETA_TVH
			sleep 2	

	
##Borramos arrchivos temporales
	echo	
	echo -e "\e[38;5;198mPaso 5:\e[0m"
	echo -e "\e[32mEliminando archivos temporales\e[0m"
	echo
			rm -rf $CARPETA_NORMANDYTEMP
			rm -rf $CARPETA_NORMANDY/Normandy_EPG.zip
			rm -rf /storage/Normandy_EPG.ver
			sleep 2	
		
	
##Reiniciamos el servicio de TVH
	echo	
	echo -e "\e[38;5;198mPaso 6:\e[0m"
	echo -e "\e[32mIniciando servicio TVHeadend\e[0m"
			systemctl start service.tvheadend43
	echo -e "\e[33mServicio TVHeadend iniciado\e[0m"
	echo
			sleep 2	
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m### EPG instalada, gracias por usar NormandyEPG ###\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
	echo
		kodi-send -a "Notification($NOMBRE_APP,Instalacion NormandyEPG finalizada,3000)"  > /dev/null 2>&1
		kodi-send -a "Notification($NOMBRE_APP,Version Instalada: $ver_local,3000)"  > /dev/null 2>&1
	echo -e "\e[31m¡¡ATENCIÓN!!\e[0m" 'Comprueba que el grabber está activo en la interfaz web de TVH (ipdeco:9981) para poder capturar la EPG'
	echo -e El grabber se encuentra en la pestaña "\e[36mCONFIGURACIÓN>CANAL/EPG>MÓDULOS PARA OBTENCIÓN DE GUÍA.\e[0m" 	
	echo La primera captura de EPG tardará unos minutos hasta que los procesos de TVH se terminen de iniciar, paciencia.
	echo
			sleep 3		