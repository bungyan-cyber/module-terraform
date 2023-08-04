# **TERRAFORM MODULE BASED APPROACHMENT**
> Note : for some reason I cannot create ip 192.168.1, so, i use 172.14
### **Requirement**
1. Terraform installed (**Tested on Terraform v1.2.8**)
2. AWS Cli installed and configured with existing account
### **How to Use It**
1. Clone respository
```
git clone https://github.com/ludesdeveloper/terraform-module-based-approachment.git
```
2. To generate keypair, cd to scripts directory
```
cd terraform-module-based-approachment/scripts
```
3. Type command below
```
./generate-keypair.sh
```
4. Go to root folder
```
cd ..
```
### **Initiating Terraform**
1. Type command below to initiate terraform
```
terraform init
```
### **Execute Terraform**
1. Go to root folder then preview changes with command below(add environment you want to create: dev, qa, prod)
```
terraform plan
```
2. To apply, type command below(add environment you want to create: dev, qa, prod)
```
terraform apply
```
3. Check in your AWS Console GUI, don't forget to change region to *ap-southeast-1*
4. To destroy infrastructore, type command below(add environment you want to create: dev, qa, prod)
```
terraform destroy
```
