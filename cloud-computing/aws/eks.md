# Amazon Elastic Kubernetes Service (Amazon EKS)

- https://docs.aws.amazon.com/ja_jp/eks/latest/userguide/what-is-eks.html

## eksctl

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

## 使用例

- https://www.devopsstarterpack.com/docs/eks/intro/
