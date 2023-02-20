#!/bin/bash

#Toute les fonctions
function carte () {
    cat text.txt
}
function choisirPlats () {
    
    read -p " Choisis ton plats " H ;
    
    if [ $H -ge 12 ] 
    then 
    echo " Choisi entre 0 et 11 :" ;
    read -p " Choisis ton plats " H ;
    fi ;
   Prix=$(grep -w [-]$H text.txt | grep -o '\([0-9]\{1,2\}\)[€]' | sed 's/€//g') ;
}
function quantite () {
    read -p " Combien en faut-il ? " A ;
}

function calcul () {
    total=$(echo "$Prix*$A*1.1167" | bc ) ;
    printf "\nTu me dois %.2f €\n" $total ;
    echo " tu me dois€ " $total ;
}
function resultat () {
    read -p " Totale de la commande (t) " Q ;
    if [ $Q = "t" ] ; 
    then calcul
    else echo "retante ta chance" ; read -p " Totale de la commande (t) " Q ;
    fi 
}
#Début de la procédure
carte
choisirPlats
quantite
resultat



