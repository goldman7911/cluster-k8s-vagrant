# cluster-k8s-vagrant

wrapper para instalar um cluster k8s com 1 control-plane e N worker nodes; incluso Docker, Helm, autocomplete

- Instalar o Vagrant
- Git clone
- vagrant up

Para realizar ssh use: vagrant ssh <name>

Current machine states:

control-plane             running (virtualbox)
worker-1                  running (virtualbox)

vagrant@k8s-ControlPlane:~$ k get nodes -o wide
NAME               STATUS   ROLES                  AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
k8s-controlplane   Ready    control-plane,master   8m32s   v1.20.2   10.0.2.15     <none>        Ubuntu 20.04.1 LTS   5.4.0-62-generic   docker://20.10.2
k8s-worker-1       Ready    <none>                 83s     v1.20.2   10.0.2.15     <none>        Ubuntu 20.04.1 LTS   5.4.0-62-generic   docker://20.10.2