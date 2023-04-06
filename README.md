# Terraform Practice

AWS CLI Ver-2 Installation (For Ubuntu): 
---

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```

```
user@ubuntu:~$ unzip awscliv2.zip
```

```
user@ubuntu:~$ sudo ./aws/install
```

Terraform Installation (For Ubuntu):
---
```
wget -qO - terraform.gpg https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/terraform-archive-keyring.gpg
```
```
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/terraform-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/terraform.list
```
```
sudo apt update
sudo apt install terraform
```

Terraform Installation (For Mac):
---
Our Terraform version will be managed by `tfenv`. Here the [GitHub link](https://github.com/tfutils/tfenv) of it.
Use Homebrew to install ```brew install tfenv```

Basic Terraform Commands:
---

- ```terraform init```
- ```terraform plan```
- ```terraform apply```
- ```terraform output```
