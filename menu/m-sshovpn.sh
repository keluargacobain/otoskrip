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
echo -e "\E[0;100;33m					< SSH MENU >         \E[0m"
echo -e "\e[33m==============================================\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] CREATE SSH ACCOUNT "
echo -e " [\e[36m•2\e[0m] TRIAL ACCOUNT SSH   "
echo -e " [\e[36m•3\e[0m] RENEW SSH ACCOUNT "
echo -e " [\e[36m•4\e[0m] DELETE SSH ACCOUNT "
echo -e " [\e[36m•5\e[0m] CHECK USER LOGIN SSH   "
echo -e " [\e[36m•6\e[0m] LIST MEMBER SSH   "
echo -e " [\e[36m•7\e[0m] DELETE USER EXPIRED SSH   "
echo -e " [\e[36m•8\e[0m] SET UP AUTOKILL SSH "
echo -e " [\e[36m•9\e[0m] CEK USERS WHO DO MULTI LOGIN SSH "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "PRESS X OR [ CTRL+C ] • TO-EXIT"
echo ""
echo -e "\e[33m==============================================\033[0m"
echo -e ""
read -p " SELECT MENU :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Perintah Tidak Dikenal" ; sleep 1 ; m-sshovpn ;;
esac
