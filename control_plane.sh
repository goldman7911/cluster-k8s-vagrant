#!/usr/bin/env bash

#Inicializar o cluster
sudo kubeadm init --apiserver-advertise-address=192.168.0.22 --pod-network-cidr=192.168.0.0/24 > /vagrant/join.k8s && \
#Instalar o CNI Calico
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f /vagrant/custom-resources.yaml