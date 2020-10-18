#metallb
sh srcs/metal/init_metallb.sh
kubectl apply -f ./srcs/metal

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
kubectl apply -f ./srcs/k8s