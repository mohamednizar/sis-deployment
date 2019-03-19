kubectl create namespace moe
kubectl create -f mysql_vol.yaml 
kubectl create -f mysql.yaml 
kubectl create -f nginx.yaml