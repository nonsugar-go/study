# Terraform - Basic
- https://developer.hashicorp.com/terraform/tutorials
# Install
- https://developer.hashicorp.com/terraform/install
```zsh
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
# 参考
- https://github.com/zealvora/terraform-beginner-to-advanced-resource
