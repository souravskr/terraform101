# Terraform Practice

**AWS CLI Ver-2 Installation (For Ubuntu):** 

- ```user@ubuntu:~$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"```

- ```user@ubuntu:~$ unzip awscliv2.zip```

- ```user@ubuntu:~$ sudo ./aws/install```

**Terraform Installation (For Ubuntu):**

- ```user@ubuntu:~$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl```

- ```user@ubuntu:~$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -```

- ```user@ubuntu:~$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"```

**Basic Terraform Commands:**

- ```terraform init```
- ```terraform plan```
- ```terraform apply```
