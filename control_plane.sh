#!/usr/bin/env bash

#Aguardar estabilizar
echo 'sleep 120'
sleep 120

#Inicializar o cluster
sudo kubeadm init --apiserver-advertise-address=192.168.33.10 --pod-network-cidr=192.168.33.0/24 > /vagrant/join.k8s

#Inicializar o cluster
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

#Aguardar estabilizar
echo 'sleep 30'
sleep 30

#Instalar o CNI Calico
sudo export KUBECONFIG=/etc/kubernetes/admin.conf && \
sudo kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml && \
sudo kubectl create -f /vagrant/custom-resources.yaml

#Aguardar o coreDns
echo 'sleep 240'
sleep 240

#Untaint
kubectl taint nodes --all node-role.kubernetes.io/master-

#Instalar Helm

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get -y install helm

