# Kubernetes

## Kubernetes のセットアップ

- local
  - [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  - [MiniKube](https://minikube.sigs.k8s.io/docs/)
  - [Kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)
- Cloud
  - Google Cloud Platform ([GKE](https://cloud.google.com/kubernetes-engine?hl=ja))
  - Amazon Web Services ([EKS](https://aws.amazon.com/jp/eks/))
  - Micorosoft Azure ([AKS](https://learn.microsoft.com/ja-jp/azure/aks/what-is-aks))
  - Oracle Cloud Infrastructure ([OKE](https://www.oracle.com/jp/cloud/cloud-native/kubernetes-engine/))
- Playgrounds
  - [KodeKloud Playgrounds](https://kodekloud.com/k8s)
  
## 概要

- https://kubernetes.io/docs/reference/kubectl/#resource-types

| Category | Type | Description |
|---|---|---|
| Workloads | Pod (po) | コンテナの集合 |
| Workloads | ReplicaSet (rs) | Pod の集合 |
| Workloads | Deployment (deploy) | ReplicaSetの集合。世代管理 |
| Workloads | StatefulSet (sts) | Pod の集合。Pod をスケールする際の名前が一定。 |
| Services | Service (svc) | 外部公開、名前解決、L4 ロードバランサー。 |
| Services | Ingress (ing) | 外部公開、L7 ロードバランサー。 |
| 設定 | ConfigMap (cm) | 設定情報 |
| 設定 | Secret | 機密情報 |
| ストレージ | PersistentVolume (pv) | 永続データの実態 |
| ストレージ | PersistentVolumeClaim (pvc) | 永続データの要求 |

## Pods

```zsh
kubectl run hello --image hello-world --restart=Never
kubectl get po
kubectl logs pod/hello
kubectl delete pod/hello
```

### yaml

**pod.yaml**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: default
  labels:
    app: nginx
    env: dev
spec:
  containers:
    - name: nginx
      image: nginx:1.31.2-alpine3.24
```

```
kubectl apply -f pod.yaml
kubectl get all
kubectl delete -f pod.yaml
```
