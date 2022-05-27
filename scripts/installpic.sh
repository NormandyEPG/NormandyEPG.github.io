#!/bin/bash
#### Descripción: Instalador Picons/NormandyEPG para TVH add-on 4.3 
#### Creador por: DarzLir para NormandyEPG.es | Monkey Brothers
## 08/2021

# Variables
CARPETA_NORMANDY="/storage/.kodi/NormandyEPG/"
CARPETA_PICONS="/storage/.kodi/NormandyEPG/picons/"
URL_PICONS="https://github.com/NormandyEPG/Picons-NormandyEPG/archive/master.zip"

# Comprobamos si tenemos instalado el wget-ssl
[ -f /storage/.opt/bin/wget ] && ncert="--no-check-certificate"

	rm -rf installpic.sh

# Cuenta atrás
#
function CuentaAtras() {

	echo "Pulsa Ctrl+C para abortar"
	secs=$2
	while [ $secs -gt -1 ]; do
	   echo -ne "$1 en ${RED}$secs${NC} segundos\033[0K\r"
	   sleep 1
	   : $((secs--))
	done

	printf "\n"
}

echo
	echo
	echo
	echo
cat << "EOF"

███╗   ██╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ██╗   ██╗███████╗██████╗  ██████╗ 
████╗  ██║██╔═══██╗██╔══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝ 
██╔██╗ ██║██║   ██║██████╔╝██╔████╔██║███████║██╔██╗ ██║██║  ██║ ╚████╔╝ █████╗  ██████╔╝██║  ███╗
██║╚██╗██║██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║  ╚██╔╝  ██╔══╝  ██╔═══╝ ██║   ██║
██║ ╚████║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝   ██║   ███████╗██║     ╚██████╔╝
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚═╝   ╚══════╝╚═╝      ╚═════╝ 
Monkey Brothers Team | Instalador Picons universal
											
EOF
	echo
echo -e Web: "\e[96mhttps://normandy.es     \e[0m"
echo -e Telegram: "\e[96mt.me/mecoolki   \e[0m"
	echo


# Funciones de limpieza
function _limpiezarestart()
{
	echo
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m# Picons instalados, gracias por usar NormandyEPG #\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
	echo
	echo -e "\e[32mReiniciando dispositivo\e[0m"
	echo	
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/imagecache/*
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend42/imagecache/*
rm -rf /storage/.kodi/userdata/Thumbnails/*
rm -rf /storage/nepgpict.sh
rm -rf /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master
rm -rf /storage/.kodi/NormandyEPG/master.zip
sleep 3
reboot
}

function _limpiezarestart2()
{
	echo
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m# Limpieza realizada gracias por usar NormandyEPG #\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
	echo
	echo -e "\e[32mReiniciando dispositivo\e[0m"
	echo	
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend43/imagecache/*
rm -rf /storage/.kodi/userdata/addon_data/service.tvheadend42/imagecache/*
rm -rf /storage/.kodi/userdata/Thumbnails/*
rm -rf /storage/nepgpict.sh
rm -rf /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master
rm -rf /storage/.kodi/NormandyEPG/master.zip
sleep 3
reboot
}
	
# Menu Principal
function _menuPrincipal()
{
    echo "-----------------------------------------------"
    echo
    echo -e "1) \e[32mInstalar Picons\e[0m"
	echo -e "2) \e[33mArreglar Picons\e[0m"
    echo -e "3) \e[31mSalir del instalador\e[0m"
    echo
	rm -rf /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master
	rm -rf /storage/.kodi/NormandyEPG/master.zip
    echo -n "Indica una opcion: "
}
 
# Menu de instalación de picons
function _submenu1()
{
	echo
	echo -e "\e[36m###################################################\e[0m" 
	echo -e "\e[36m### Iniciando script de instalación de picons   ###\e[0m" 
	echo -e "\e[36m###################################################\e[0m" 
	echo
	echo -e "\e[38;5;198mDescargando archivos necesarios...\e[0m"
		sleep 2
	cd "$CARPETA_NORMANDY"
	wget ${ncert} -q "$URL_PICONS"
	unzip -o -qq $CARPETA_NORMANDY/master.zip -d $CARPETA_NORMANDY 2>/dev/null
	echo 
    echo "-----------------------------------------------"
    echo
    echo -e "1) Instalar \e[37mLightTransparent\e[0m"
    echo -e "2) Instalar \e[37mLightBlack\e[0m"
    echo -e "3) Instalar \e[37mLightBlue\e[0m"
    echo -e "4) Instalar \e[94mDarkTransparent\e[0m"
    echo -e "5) Instalar \e[94mDarkWhite\e[0m"
    echo -e "6) Instalar \e[94mDarkReflection\e[0m"
    echo -e "7) \e[33mSalir al menú principal\e[0m"
    echo -e "8) \e[31mSalir del instalador\e[0m"
    echo
    echo -n "Indica una opcion: "
}
 
# Menu de arreglado de picons
function _submenu2()
{
    echo "-----------------------------------------------"
    echo
	echo -e "1) \e[32mIniciar script arreglado picons\e[0m (elimina Thumbnails e Imagecache y reinicia el dispositivo)"
    echo -e "2) \e[33mSalir al menú principal\e[0m"
    echo -e "3) \e[31mSalir del instalador\e[0m"
    echo -n "Indica una opcion: "
}
 
# establecemos un valor por defecto
opc=0
 
# Bucle hasta que no pulsemos 3 para salir del Menú Principal
until [ $opc -eq 3 ]
do
    case $opc in
        1)
            # Se inicia submenú 1, bucle hasta que no pulsemos 8 para salir del submenú
            opc1=0
            until [ $opc1 -eq 7 ]
            do
                case $opc1 in
                    1)
						sleep 1
						CuentaAtras "Vamos a instalar los picons LightTransparent" 3
                        cp -r /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master/LightTransparent/* /storage/.kodi/NormandyEPG/picons
                        _limpiezarestart
                        ;;
                    2)
						sleep 1
						CuentaAtras "Vamos a instalar los picons LightBlack" 3
                        cp -r /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master/LightBlack/* /storage/.kodi/NormandyEPG/picons
                        _limpiezarestart
                        ;;
					3)
						sleep 1
						CuentaAtras "Vamos a instalar los picons LightBlue" 3
                        cp -r /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master/LightBlue/* /storage/.kodi/NormandyEPG/picons
                        _limpiezarestart
                        ;;
					4)
						sleep 1
						CuentaAtras "Vamos a instalar los picons DarkTransparent" 3
                        cp -r /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master/DarkTransparent/* /storage/.kodi/NormandyEPG/picons
                        _limpiezarestart
                        ;;
					5)
						sleep 1
						CuentaAtras "Vamos a instalar los picons DarkWhite" 3
                        cp -r /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master/DarkWhite/* /storage/.kodi/NormandyEPG/picons
                        _limpiezarestart
                        ;;
					6)
						sleep 1
						CuentaAtras "Vamos a instalar los picons DarkReflection" 3
                        cp -r /storage/.kodi/NormandyEPG/Picons-NormandyEPG-master/DarkReflection/* /storage/.kodi/NormandyEPG/picons
                        _limpiezarestart
                        ;;
                    8)
						exit
                        _submenu1
                        ;;
                    *)
                        _submenu1
                        ;;
                esac
                read opc1
            done
            _menuPrincipal
            ;;
 
        2)
            # Se inicia submenú 2, bucle hasta que no pulsemos 3 para salir del submenú
            opc2=0
            until [ $opc2 -eq 2 ]
            do
                case $opc2 in
                    1)
						sleep 1
						CuentaAtras "Iniciando limpieza de miniaturas y picons" 3
						_limpiezarestart2
                        ;;
                    3)
						exit
                        _submenu2
                        ;;
                    *)
                        _submenu2
                        ;;
                esac
                read opc2
            done
            _menuPrincipal
            ;;
 
        3)
            echo "Esta opcion no dispone de submenu"
            _menuPrincipal
            ;;
 
        *)
            _menuPrincipal
            ;;
    esac
 
    # esperamos solicitando una nueva opción de menu
    read opc
done