#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/keluargacobain/otoskrip/main/permission/ip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/keluargacobain/otoskrip/main/permission/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";

exit 0
fi
clear 
echo -e "\e[33m==============================================\033[0m"
echo -e "\E[0;100;33m				< SYSTEM MENU >      \E[0m"
echo -e "\e[33m==============================================\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] PANEL DOMAIN"
echo -e " [\e[36m•2\e[0m] STATUS SERVICE"
echo -e " [\e[36m•3\e[0m] WEBMIN MENU"
echo -e " [\e[36m•4\e[0m] SPEEDTEST VPS"
echo -e " [\e[36m•5\e[0m] SET AUTO REBOOT"
echo -e " [\e[36m•6\e[0m] RESTART ALL SERVICE"
echo -e " [\e[36m•7\e[0m] INSTALL TCP BBR"
echo -e " [\e[36m•8\e[0m] CHECK BANDWITH"
echo -e " [\e[36m•9\e[0m] CLEAR CACHE"
echo -e " [\e[36m•10\e[0m] CHANGE TIMEZONE"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "PRESS X OR [ CTRL+C ] • TO-EXIT"
echo -e   ""
echo -e "\e[33m==============================================\033[0m"
echo -e ""
read -p " SELECT MENU : " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; running ; exit ;;
3) clear ; m-webmin ; exit ;;
4) clear ; speedtest ; exit ;;
5) clear ; about ; exit ;;
6) clear ; restart ; exit ;;
7) clear ; m-bbr ; exit ;;
8) clear ; bw ; exit ;;
9) clear ; clearcache ; exit ;;
10) clear ; dpkg-reconfigure tzdata ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Perintah Tidak Dikenal" ; sleep 1 ; m-system ;;
esac
