#!/bin/bash
echo "Dime el grupo a escanear"
read GRUPO
ansible --list-hosts $GRUPO 2>/dev/null |  grep -v hosts | ssh-keyscan -f - >> ~/.ssh/known_hosts 2> /dev/null
echo RANGO $GRUPO LEIDO

