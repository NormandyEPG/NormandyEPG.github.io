#!/bin/bash
#### Descripción: Instalador NormandyEPG universal
### Creador por: DarzLir para NormandyEPG.es | Monkey Brothers
## 08/2021


cat << "EOF"

███╗   ██╗ ██████╗ ██████╗ ███╗   ███╗ █████╗ ███╗   ██╗██████╗ ██╗   ██╗███████╗██████╗  ██████╗ 
████╗  ██║██╔═══██╗██╔══██╗████╗ ████║██╔══██╗████╗  ██║██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗██╔════╝ 
██╔██╗ ██║██║   ██║██████╔╝██╔████╔██║███████║██╔██╗ ██║██║  ██║ ╚████╔╝ █████╗  ██████╔╝██║  ███╗
██║╚██╗██║██║   ██║██╔══██╗██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║  ╚██╔╝  ██╔══╝  ██╔═══╝ ██║   ██║
██║ ╚████║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝   ██║   ███████╗██║     ╚██████╔╝
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚═╝   ╚══════╝╚═╝      ╚═════╝ 
Monkey Brothers Team | Instalador NormandyEPG universal
											
EOF
echo
echo -e Web: "\e[96mhttps://normandy.es     \e[0m"
echo -e Telegram: "\e[96mt.me/mecoolki   \e[0m"
echo
echo
echo
	
	
## Borramos posibles residuos anteriores
		rm -rf install.sh
		rm -rf installaddon43.sh
		rm -rf installaddonae.sh
		rm -rf installdocker.sh
		rm -rf installpic.sh
		rm -rf nepge2.sh


## Menu Principal
function _menuPrincipal()
{
    echo "Elige la opción adecuada a tu sistema"
    echo
    echo -e "1) Instalar en \e[0;31mCoreELEC\e[0m TVH 4.3"
    echo -e "2) Instalar en \e[0;36mAlexELEC/CoreELEC ae\e[0m TVH 4.3"
	echo -e "3) Instalar en \e[0;33mDocker\e[0m"
    echo -e "4) Instalar en \e[0;32mEnigma2\e[0m CrossEPG"
    echo -e "5) Instalar/Reinstalar \e[38;5;198mPicons\e[0m"
    echo -e "6) \e[31mSalir del instalador\e[0m"
    echo
    echo -n "Indica una opcion: "
}
 
 
 
 
## establecemos un valor por defecto
opc=0
 
 
## Bucle hasta que no pulsemos 3 para salir del Menú Principal
until [ $opc -eq 2 ]
do
    case $opc in
        0)
            # Se inicia submenú 1, bucle hasta que no pulsemos 5 para salir del submenú
            opc1=0
            until [ $opc1 -eq 7 ]
            do
                case $opc1 in
                    1)
						sleep 1
						wget -q -c http://NormandyEPG.github.io/scripts/installaddon43.sh;sh installaddon43.sh;rm installaddon43.sh
                        _menuPrincipal
                        ;;
					2)
						sleep 1
						wget -q -c http://NormandyEPG.github.io/scripts/installaddonae.sh;sh installaddonae.sh;rm installaddonae.sh
						_menuPrincipal
						;;
					3)
						sleep 1
						wget -q -c http://NormandyEPG.github.io/scripts/installaddondocker.sh;sh installaddondocker.sh;rm installaddondocker.sh
						_menuPrincipal
						;;
					4)
						sleep 1
						wget -q -c http://NormandyEPG.github.io/scripts/installe2.sh;sh installe2.sh;rm installe2.sh
						_menuPrincipal
						;;
					5)
						sleep 1
						wget -q -c http://NormandyEPG.github.io/scripts/installpic.sh;sh installpic.sh;rm installpic.sh
						_menuPrincipal
						;;
                    6)
						exit
                        ;;
                    *)
                        _menuPrincipal
                        ;;
                esac
                read opc1
            done
            _menuPrincipal
            ;;
    esac
 
    # esperamos solicitando una nueva opción de menu
    read opc
done