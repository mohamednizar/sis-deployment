kubectl delete all -—all -n moe
kubectl delete persistentvolumes mysql-moe-volume
kubectl delete persistentvolumeclaims mysql-moe-claim -n moe
kubectl delete namespace moe