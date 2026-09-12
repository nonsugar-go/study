# Amazon Elastic Kubernetes Service (Amazon EKS)

- https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/what-is-eks.html
- https://aws.amazon.com/jp/eks/pricing/
- https://aws.amazon.com/jp/ec2/pricing/on-demand/

## eksctl

### インストール

- https://docs.aws.amazon.com/eks/latest/eksctl/installation.html
- https://www.devopsstarterpack.com/docs/intro/environment/eksctl/

```zsh
PLATFORM=$(uname -s)_amd64
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl
eksctl version
```

### クラスタの作成

- https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/kubernetes-versions.html // 標準サポートのバージョンを指定！
- https://docs.aws.amazon.com/eks/latest/eksctl/creating-and-managing-clusters.html

```zsh
eksctl create cluster \
  --name hello-eks \
  --version 1.36 \
  --region ap-northeast-1 \
  --nodegroup-name workers \
  --node-type t3.medium \
  --nodes 2
```

### クラスタの削除

