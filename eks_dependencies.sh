#!/bin/sh  
sudo yum update -y 
sudo yum install awscli -y 
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp 
sudo mv /tmp/eksctl /usr/local/bin 
echo "eksctl version"  
eksctl version 
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator 
chmod +x ./aws-iam-authenticator 
sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator 
echo "iam authenticator version"  
aws-iam-authenticator version 
curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl 
chmod +x ./kubectl 
sudo mv ./kubectl /usr/local/bin/kubectl 
echo "kubectl version"  
kubectl version --short --client 
cd /home/ubuntu/.ssh 
ssh-keygen -t rsa -N "" -f id_rsa 
