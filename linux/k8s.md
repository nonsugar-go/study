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

| Category | kind | apiVersion | Description |
|---|---|---|---|
| Workloads | Pod (po) | v1 | コンテナの集合 |
| Workloads | ReplicaSet (rs) | apps/v1 | Pod の集合 |
| Workloads | Deployment (deploy) | apps/v1 | ReplicaSetの集合。世代管理 |
| Workloads | StatefulSet (sts) | apps/v1 | Pod の集合。Pod をスケールする際の名前が一定。 |
| Services | Service (svc) | v1 | 外部公開、名前解決、L4 ロードバランサー。 |
| Services | Ingress (ing) | networking.k8s.io/v1 | 外部公開、L7 ロードバランサー。 |
| 設定 | ConfigMap (cm) | v1 | 設定情報 |
| 設定 | Secret | v1 | 機密情報 |
| ストレージ | PersistentVolume (pv) | v1 | 永続データの実態 |
| ストレージ | PersistentVolumeClaim (pvc) | v1 | 永続データの要求 |

## Pod

- https://kubernetes.io/docs/reference/kubernetes-api/core/pod-v1/

```zsh
kubectl run hello --image hello-world --restart=Never
kubectl get po
kubectl logs pod/hello
kubectl delete pod/hello
```

### yaml

**pods.yaml**

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug
  namespace: default
  labels:
    env: dev
spec:
  containers:
    - name: debug
      image: centos:7
      command:
        - "sh"
        - "-c"
      args:
        - |
          while true
          do
            sleep ${DELAY}
          done
      env:
        - name: "DELAY"
          value: "5"

---
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: default
  labels:
    env: dev
spec:
  containers:
    - name: nginx
      image: nginx:1.30.3-alpine3.23
```

```zsh
kubectl apply -f pods.yaml
```

```zsh
watch -d kubectl get all -o wide
```

```zsh
kubectl exec debug -it -- sh
```

exit または ctrl-P, ctrl-Q で抜ける

```zsh
kubectl cp ./file1.txt debug:/var/tmp/file1.txt
kubectl cp debug:/var/tmp/file2.txt ./file2.txt
```

```zsh
kubectl delete -f pods.yaml
```

## ReplicaSet

- https://kubernetes.io/docs/reference/kubernetes-api/apps/replica-set-v1/

## Deployment

- https://kubernetes.io/docs/reference/kubernetes-api/apps/deployment-v1/

## StatefulSet

- https://kubernetes.io/docs/reference/kubernetes-api/apps/stateful-set-v1/

## Service

- https://kubernetes.io/docs/reference/kubernetes-api/core/service-v1/

## Ingress

- https://kubernetes.io/docs/reference/kubernetes-api/networking/ingress-v1/

## ConfigMap

- https://kubernetes.io/docs/reference/kubernetes-api/core/config-map-v1/

## Secret

- https://kubernetes.io/docs/reference/kubernetes-api/core/secret-v1/

## PersistentVolume

- https://kubernetes.io/docs/reference/kubernetes-api/core/persistent-volume-v1/

## PersistentVolumeClaim

- https://kubernetes.io/docs/reference/kubernetes-api/core/persistent-volume-claim-v1/
