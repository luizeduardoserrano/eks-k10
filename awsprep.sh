echo "Install eksctl"
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C ~/eks-k10

echo "Install kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod 755 kubectl

echo "Install helm"
wget https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz
tar -zxvf helm-v3.7.0-linux-amd64.tar.gz
mv linux-amd64/helm .
rm helm-v3.7.0-linux-amd64.tar.gz
rm -rf linux-amd64
echo "export PATH=$PATH:~/eks-k10" >> ~/.bashrc
echo "alias k=kubectl" >> ~/.bashrc
. ~/.bashrc

echo "Generate ssh public key if not existing"
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -q -f ~/.ssh/id_rsa -N ""
fi

clear

echo -n "Enter your AWS Access Key ID and press [ENTER]: "
read AWS_ACCESS_KEY_ID
echo "" | awk '{print $1}'
echo $AWS_ACCESS_KEY_ID > awsaccess
echo -n "Enter your AWS Secret Access Key and press [ENTER]: "
read AWS_SECRET_ACCESS_KEY
echo $AWS_SECRET_ACCESS_KEY >> awsaccess
echo "" | awk '{print $1}'
echo "You are ready to deploy now!"
echo "" | awk '{print $1}'


