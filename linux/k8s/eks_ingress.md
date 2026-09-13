# AWS Load Balancer Controller

- [EKS + ALB Ingress ControllerでEKS環境を構築する - クロスパワークラウドブログ](https://xp-cloud.jp/blog/2026/07/16/100000)

## 公式ドキュメント

- [Installation Guide - AWS Load Balancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.7/deploy/installation/)
- [Helm による AWS Load Balancer Controller のインストール - Amazon EKS](https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/lbc-helm.html)
に従って、AWS Load Balancer Controller をインストール

## クラスタの起動

```zsh
export AWS_PROFILE=my
aws sso login --use-device-code
eksctl create cluster -f ./cluster.yaml
account_id=$(aws sts get-caller-identity --query Account --output text)
region=$(aws configure get region)
cluster="my-cluster"
```

## eksctl を使用して IAM ロールを作成する

1. IAM OIDC (OpenID Connect) provider を作成
   ```zsh
   eksctl utils associate-iam-oidc-provider \
     --region $region \
     --cluster $cluster \
     --approve
   ```
2. AWS Load Balancer Controller 用の IAM ポリシーをダウンロード
   ```zsh
   curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.14.1/docs/install/iam_policy.json
   ```
3. IAM ポリシーを作成
   ```zsh
   aws iam create-policy \
     --policy-name AWSLoadBalancerControllerIAMPolicy \
     --policy-document file://iam_policy.json
   ```
4. IAM role と Kubernetes ServiceAccount の作成
   ```zsh
   eksctl create iamserviceaccount \
    --cluster=$cluster \
    --namespace=kube-system \
    --name=aws-load-balancer-controller \
    --attach-policy-arn=arn:aws:iam::$account_id:policy/AWSLoadBalancerControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --region $region \
    --approve

    kubectl get sa aws-load-balancer-controller -n kube-system --output yaml
   ```

## AWS Load Balancer Controller をインストール

1. eks-charts Helm チャートリポジトリを追加
   ```zsh
   helm repo add eks https://aws.github.io/eks-charts
   helm repo update eks
   ```
2. AWS Load Balancer コントローラをインストール
   ```zsh
   helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
     -n kube-system \
     --set clusterName=$cluster \
     --set serviceAccount.create=false \
     --set serviceAccount.name=aws-load-balancer-controller \
     --version 1.14.0
3. コントローラーがインストールされていることを確認
   ```zsh
   kubectl get deployment -n kube-system aws-load-balancer-controller
   ```

## マニフェストの適用

```zsh
kubectl apply -f ./manifests
```

## 削除

```zsh
kubectl delete -f ./manifests
helm uninstall aws-load-balancer-controller --namespace kube-system
eksctl delete cluster -f ./cluster.yaml
```

- IAM > ポリシー: `AWSLoadBalancerControllerIAMPolicy` を削除
