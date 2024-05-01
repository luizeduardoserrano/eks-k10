if [ ! -f ~/eks-k10/eksctl ]; then
  echo "Install eksctl"
  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C ~/eks-k10
  # curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.92.0/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C ~/eks-k10
fi

if [ ! -f ~/eks-k10/kubectl ]; then
  echo "Install kubectl"
  # curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  curl -LO "https://dl.k8s.io/release/v1.23.1/bin/linux/amd64/kubectl"
  chmod 755 kubectl
fi

if [ ! -f ~/eks-k10/helm ]; then
  echo "Install helm"
  wget https://get.helm.sh/helm-v3.14.0-linux-amd64.tar.gz
  tar -zxvf helm-v3.14.0-linux-amd64.tar.gz
  mv linux-amd64/helm .
  rm helm-v3.14.0-linux-amd64.tar.gz
  rm -rf linux-amd64
fi

cat ~/.bashrc | grep eks-k10

if [ `echo $?` -eq 1 ]
then
  echo "export PATH=$PATH:~/eks-k10" >> ~/.bashrc
  echo "alias k=kubectl" >> ~/.bashrc
fi

source ~/.bashrc

echo "Generate ssh public key if not existing"
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -q -f ~/.ssh/id_rsa -N ""
fi

clear

# aws sts get-caller-identity | grep assumed-role
# if [ `echo $?` -eq 1 ]
# then
  echo -n "Enter your AWS Access Key ID and press [ENTER]: "
  read AWS_ACCESS_KEY_ID
  echo "" | awk '{print $1}'
  echo $AWS_ACCESS_KEY_ID > awsaccess
  echo -n "Enter your AWS Secret Access Key and press [ENTER]: "
  read AWS_SECRET_ACCESS_KEY
  echo $AWS_SECRET_ACCESS_KEY >> awsaccess
# fi

clear

echo "" | awk '{print $1}'
echo "You are ready to deploy now!"
echo "" | awk '{print $1}'


