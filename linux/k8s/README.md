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

apiVersion は上記のレファレンスを参照するか、`kubectl api-resources|grep replicasets` のようにコマンドで確認する。

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
kubectl describe pod/nginx
kubectl logs pod/nginx
```

```zsh
kubectl delete -f pods.yaml
```

## ReplicaSet

- https://kubernetes.io/docs/reference/kubernetes-api/apps/replica-set-v1/

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: sample
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
      env: dev
  template:
    metadata:
      name: nginx
      labels:
        app: web
        env: dev
    spec:
      containers:
        - name: nginx
          image: nginx:1.30.3-alpine3.23
```

## Deployment

- https://kubernetes.io/docs/reference/kubernetes-api/apps/deployment-v1/

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  annotations:
    kubernetes.io/change-cause: "Update nginx 1.30.3"
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
      env: dev
  revisionHistoryLimit: 14
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1
  template:
    metadata:
      name: nginx
      labels:
        app: web
        env: dev
    spec:
      containers:
        - name: nginx
          # image: nginx:1.30-alpine3.23
          image: nginx:1.30.3-alpine3.23
```

```zsh
kubectl apply -f deployment.yaml
kubectl rollout history deployment/nginx
vi deployment.yaml
kubectl apply -f deployment.yaml
kubectl rollout history deployment/nginx
kubectl rollout undo deployment/nginx
kubectl rollout history deployment/nginx
kubectl delete -f deployment.yaml
```

## StatefulSet

- https://kubernetes.io/docs/reference/kubernetes-api/apps/stateful-set-v1/

## Service

- https://kubernetes.io/docs/reference/kubernetes-api/core/service-v1/

### ClusterIP

クラスタネットワーク内に IP アドレス公開。名前指定で Pod へ到達できるようにする。
  
### NodePort

ClusterIP に加え、Node のポートにポートマッピングして受け付けられるようにする。

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: web
    env: dev
spec:
  containers:
    - name: nginx
      image: nginx:1.30.3-alpine3.23

---
apiVersion: v1
kind: Service
metadata:
  name: web-svc
spec:
  type: NodePort
  clusterIP: ""
  selector:
    app: web
    env: dev
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30000
```

```zsh
kubectl apply -f service.yaml
minikube service web-svc
kubectl delete -f service.yaml
```

### LoadBalancer

NodePort に加え、クラウドプロバイダーのロードバランサーを利用してサービス公開する。

### ExternalName

外部サービスに接続

## Ingress

- https://kubernetes.io/docs/reference/kubernetes-api/networking/ingress-v1/

## ConfigMap

- https://kubernetes.io/docs/reference/kubernetes-api/core/config-map-v1/

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: sample-config
data:
  sample.cfg: |
    dbuser: admin
    dbpass: adminpass
  type: "application"

---
apiVersion: v1
kind: Pod
metadata:
  name: sample
spec:
  containers:
    - name: nginx
      image: nginx:1.30.3-alpine3.23
      env:
        - name: TYPE
          valueFrom:
            configMapKeyRef:
              name: sample-config
              key: type
      volumeMounts:
        - name: config-storage
          mountPath: /home/nginx
  volumes:
    - name: config-storage
      configMap:
        name: sample-config
        items:
          - key: sample.cfg
            path: sample.cfg
```

```zsh
kubectl apply -f configmap.yaml
kubectl describe pod/sample
kubectl logs pod/sample
kubectl exec pod/sample -it -- sh
kubectl delete -f configmap.yaml
```

## Secret

- https://kubernetes.io/docs/reference/kubernetes-api/core/secret-v1/

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: sample-secret
data:
  message: aGltaXRzdQ==
  keyfile: ZGJ1c2VyOiBhZG1pbgpkYnBhc3N3ZDogYWRtaW5wYXNzCg==

---
apiVersion: v1
kind: Pod
metadata:
  name: sample
spec:
  containers:
  - name: nignx
    image: nginx:1.30.3-alpine3.23
    env:
    - name: MESSAGE
      valueFrom:
        secretKeyRef:
          name: sample-secret
          key: message
    volumeMounts:
    - name: secret-storage
      mountPath: /home/nginx
  volumes:
  - name: secret-storage
    secret:
      secretName: sample-secret
      items:
      - key: keyfile
        path: keyfile
```

コマンドで Secret を作成

```zsh
kubectl create secret generic sample-secret --from-literal=message='himitsu' --from-file=./keyfile
kubectl get secret/sample-secret -o yaml
```

YAML で Secret を作成

```zsh
echo -n 'himitsu'|base64
cat keyfile|base64
vi secret.yaml
kubectl apply -f secret.yaml
kubectl exec pod/sample -it -- sh
kubectl delete -f secret.yaml
```

## PersistentVolume

- https://kubernetes.io/docs/reference/kubernetes-api/core/persistent-volume-v1/

## PersistentVolumeClaim

- https://kubernetes.io/docs/reference/kubernetes-api/core/persistent-volume-claim-v1/

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: volume-01
spec:
  storageClassName: slow
  accessModes:
  - ReadWriteMany
  capacity:
    storage: 10Mi
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: /data/storage
    type: Directory

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: volume-claim
spec:
  storageClassName: slow
  accessModes:
  - ReadWriteMany
  resources:
    requests:
      storage: 1Mi
```

```zsh
sudo mkdir -p /data/storage
kubectl apply -f storage.yaml
kubectl get pv
kubectl get pvc
kubectl delete -f storage.yaml
kubectl get pvc
kubectl get pv
```
