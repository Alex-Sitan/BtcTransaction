#!/bin/bash
# Author: S1T4N

source style.sh
cud="[*] "
adm="[!]"


#variables
unconfirmed_transactions="https://www.blockchain.com/es/explorer/mempool/btc"
inspect_transaction_url="https://www.blockchain.com/explorer/transactions/btc/"
inspect_transaction_adress="https://www.blockchain.com/explorer/addresses/btc"



helpPanel(){
	echo -e "\n\n${redColour}$adm ${endColour}${grayColour}use: ./ProyectOne ${endColour}"
	for i in $(seq 1 65); do echo -ne "${blueColour}-"; done; echo -ne "${endColour}"
        echo -e "\n\t${naranjaColour}[-e] ${endColour}${skyblueColour}Modo exploracion${endColour}"
        echo -e "\t\t${purpleColour}unconfirmed_transaction${endColour}\t${greenColour}Listar transacciones no confirmadas${endColour}"
        echo -e "\t\t${purpleColour}inspect${endColour}\t${greenColour}Inspeccionar hash de una transacciom${endColour}"
        echo -e "\t\t${purpleColour}adress${endColour}\t${greenColour}Inspeccionar direccion de una transaccion ${endColour}"
        echo -e "\t${naranjaColour}[-h] ${endColour}${skyblueColour}Mostrar panel de ayuda${endColour}"
        echo -e "\n\n"
        exit 1
}


function unconfirmedTransaction(){
    echo -e "\n\tListando ....\n"
}


declare -i parameter_counter=0;while getopts "i:e:h" arg; do
    case $arg in
        e) exploration_mode=$OPTARG;let parameter_counter+=1;;
        h) helpPanel;;
    esac
done

if [ $parameter_counter -eq 0 ]; then
    helpPanel
else
    if [ "$(echo $exploration_mode)" == "unconfirmed_transaction" ]; then
        echo -e "\n\tLISTANDO....\n"
    fi
fi
