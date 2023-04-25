#!/bin/bash
# Author: S1T4N

source style.sh
cud="[*] "
adm="[!]"


#variables
unconfirmed_transactions="https://www.blockchain.com/es/explorer/mempool/btc"
inspect_transaction_url="https://www.blockchain.com/explorer/transactions/btc/"
inspect_transaction_adress="https://www.blockchain.com/explorer/addresses/btc"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\tSALIENDO......\n"
	rm ut.tmp
	rm ut.table
	exit 0
}


helpPanel(){
	echo -e "\n\n${redColour}$adm ${endColour}${grayColour}use: ./ProyectOne ${endColour}"
	for i in $(seq 1 65); do echo -ne "${blueColour}-"; done; echo -ne "${endColour}"
        echo -e "\n\t${naranjaColour}[-e] ${endColour}${skyblueColour}Modo exploracion${endColour}"
        echo -e "\t\t${purpleColour}unconfirmed_transaction${endColour}\t${greenColour}Listar transacciones no confirmadas${endColour}"
        echo -e "\t\t${purpleColour}inspect${endColour}\t${greenColour}Inspeccionar hash de una transacciom${endColour}"
        echo -e "\t\t${purpleColour}adress${endColour}\t${greenColour}Inspeccionar direccion de una transaccion ${endColour}"
        echo -e "\t${naranjaColour}[-n]${endColour}\t${purpleColour}Mostrar Numero De Lineas.${endColour}${greenColour} Ejemplo: -n 10${endColour}\n"
				echo -e "\t${naranjaColour}[-h] ${endColour}${skyblueColour}Mostrar panel de ayuda${endColour}"
        echo -e "\n\n"
        exit 1
}


function unconfirmedTransaction(){
	number_output=$1
	echo '' > ut.tmp
	while [ "$(cat ut.tmp | wc -l)" == "1" ]; do
		curl -s "$unconfirmed_transactions" | html2text > ut.tmp
	done
	hashes=$(cat ut.tmp | grep "-"  | awk 'NF{print $NF}'| grep -v '>'| grep "\-" | tail -n $number_output)
	for i in $(seq 1 69); do echo -ne "*"; done;
	echo -e "\n| HASHES\tTIEMPO\t\tBITCOINS\t\tCANTIDAD    |"
	for i in $(seq 1 69); do echo -ne "*"; done;
	echo -e "\n|"
	for hash in $hashes;do
		echo -e "| ${hash}\t$(cat ut.tmp | grep "$hash" -A 1    | tail -n 1 | awk 'NF{print $NF}')\t$(cat    ut.tmp | grep "$hash" -A 2 | tail -n 1)\t\t$(cat ut.tmp | grep "$hash" -A 3 | tail -n 1)" >> ut.table
	done
	cat ut.table
	for i in $(seq 1 69); do echo -ne "*"; done; echo "|"
	sleep 2
#	rm ut.*
}



declare -i parameter_counter=0;while getopts ":n:e:h" arg; do
    case $arg in
        e) exploration_mode=$OPTARG;let parameter_counter+=1;;
				n) number_output=$OPTARG; let parameter_counter+=1;;
				h) helpPanel;;
    esac
done

if [ $parameter_counter -eq 0 ]; then
    helpPanel
else
    if [ "$(echo $exploration_mode)" == "unconfirmed_transaction" ]; then
			if [ ! "$number_output" ]; then
				number_output=100
				unconfirmedTransaction $number_output
			else
				unconfirmedTransaction $number_output
			fi
    fi
fi
