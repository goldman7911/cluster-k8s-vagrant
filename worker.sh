#!/usr/bin/env bash

#Executa o join nos workers

IFS_BKP=$IFS
IFS=''
cat /vagrant/join.k8s | 
while read LINHA
do
    if [[ $LINHA =~ ^kubeadm\ join.* ]]
    then
        eval "sudo ${LINHA}"
    fi
done
IFS=IFS_BKP