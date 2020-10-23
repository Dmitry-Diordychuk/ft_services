#!/bin/bash

echo "$1"

if [ $1 = "start" ];
then
    minikube start --driver=virtualbox
fi

if [ $1 = "delete" ];
then
    kubectl delete -f srcs/metal
    kubectl delete -f srcs/k8s
    kubectl delete secret mysqlpassword
    minikube delete
fi
if [ $1 = "clean" ];
then
    kubectl delete -f srcs/metal
    kubectl delete -f srcs/k8s
    kubectl delete secret mysqlpassword
fi
if [ $1 = "restart" ];
then
    kubectl delete -f srcs/metal
    kubectl delete -f srcs/k8s
    kubectl delete secret mysqlpassword
    minikube delete
    minikube start --driver=virtualbox
fi

minikube addons enable metallb

#docker setup
eval $(minikube docker-env)

#metallb
#sh srcs/metal/init_metallb.sh
kubectl apply -f srcs/metal

#ftps
docker build -t ftps srcs/ftps

#grafana
docker build -t grafana srcs/grafana

#influxDB
docker build -t influxDB srcs/influxDB

#mysql
docker build -t mysql srcs/mysql

#nginx
docker build -t nginx srcs/nginx

#wordpress
docker build -t wordpress srcs/wordpress

#k8s
kubectl apply -f srcs/k8s

#secret
kubectl create secret generic mysql-pass --from-literal password=password