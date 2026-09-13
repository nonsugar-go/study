# Amazon Elastic Container Registry (ECR)

1. Amazon ECR > プライベートレジストリ > リポジトリの作成 `[作成]`
   - リポジトリ名: (任意)
   - イメージタグのミュータビリティ: Mutable
   - 暗号化設定: AES-256
2. プライベートリポジトリ一覧でリポジトリを選択 > `[プッシュコマンドを表示]`
   - 表示されるコマンドをコピーして、貼り付け
     ```zsh
     aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 999999999999.dkr.ecr.ap-northeast-1.amazonaws.com
     ```
3. イメージのビルド
   ```zsh
   docker build --tag 999999999999.dkr.ecr.ap-northeast-1.amazonaws.com/my-nginx:v1.0.0 --platform linux/amd64 ./webserver/docker

   docker images|grep ecr
   ```
4. ECR にコンテナイメージを push
   ```zsh
   docker push 999999999999.dkr.ecr.ap-northeast-1.amazonaws.com/my-nginx:v1.0.0
   ```
5. マニフェストの適用
   マニフェストで push したイメージを指定後、適用
   ```zsh
   kubectl apply -f ./manifests
   ```

## 削除

```zsh
kubectl delete -f ./manifests
helm uninstall aws-load-balancer-controller --namespace kube-system
eksctl delete cluster -f ./cluster.yaml
```

- Amazon ECR > プライベートリポジトリ一覧でリポジトリを選択 > (削除)
