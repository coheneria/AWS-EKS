# devops-eks-finalproject-part2

### Installing Terraform 
To deploy this tasks's infrastrucure, you need to install Terraform on your local machine.

Ensure that your system is up to date, and you have the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature, and install HashiCorp's Debian package repository. <br/>

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

Add the HashiCorp GPG key. <br/>

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the official HashiCorp Linux repository. <br/>

```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

Update to add the repository, and install the Terraform CLI. <br/>

```
sudo apt-get update && sudo apt-get install terraform
```

Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands. <br/>

```
terraform -help
```