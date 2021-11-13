# devops-eks-finalproject-part2

This project come to demonstarte how to provision EKS cluster on AWS using Terraform and auto-scale it using EKSCTL.
<p align="center">
  <img src="https://github.com/coheneria/devops-eks-finalproject-part2/blob/main/files/eks.png" width="100%" height="100%" />
</p>
### Export your AWS-CLI credientials:
```
export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxx
export AWS_DEFAULT_REGION=us-east-1
```

### Installing Terraform 
To deploy this tasks's infrastrucure, you need to install Terraform on your local machine:
https://learn.hashicorp.com/tutorials/terraform/install-cli

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

### Apply the infrastructure
Navigate to the "terraform" folder. <br/>

```
cd terraform/
```

type "terraform plan" <br/>
```
terraform plan
```

type "terraform apply" <br/>
```
terraform apply
```
enter "yes"

wait to the process to finish.

### Install Kubectl
In order to manage the cluster, you need to install kubectl tool on your local machine:
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

Kubernetes 1.21:<br/>

```
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
```

Apply execute permissions to the binary.<br/>

```
chmod +x ./kubectl
```

Copy the binary to a folder in your PATH. If you have already installed a version of kubectl, then we recommend creating a $HOME/bin/kubectl and ensuring that $HOME/bin comes first in your $PATH.<br/>

```
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
```

After you install kubectl , you can verify its version with the following command:<br/>
```
kubectl version --short --client
```

Connect to the cluster:<br/>
```
aws eks --region eu-west-1 update-kubeconfig --name wave-eks-finalproject-2
```

### Install EKSCTL
https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html

Download and extract the latest release of eksctl with the following command:<br/>

```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
```

Move the extracted binary to /usr/local/bin :<br/>

```
sudo mv /tmp/eksctl /usr/local/bin
```

Test that your installation was successful with the following command:<br/>

```
eksctl version
```