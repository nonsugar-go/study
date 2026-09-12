# AWS CLI

- https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html
- https://www.devopsstarterpack.com/docs/intro/environment/aws-cli/

```zsh
sudo snap install aws-cli --classic
/snap/bin/aws --version
```

```zsh
$ aws configure sso --profile my --use-device-code
SSO session name (Recommended): my
SSO start URL [None]: https://*.awsapps.com/start (IAM Identity Center
ダッシュボード > 設定の概要 > AWS access portal URL)
SSO region [None]: ap-northeast-1
SSO registration scopes [sso:account:access]:
 :
Default client Region [None]: ap-northeast-1
CLI default output format (json if not specified) [None]:

$ aws sts get-caller-identity --profile my
```

```zsh
aws configure list-profiles
export AWS_PROFILE=my
aws sso login --use-device-code
aws sts get-caller-identity --query Account --output text
```
