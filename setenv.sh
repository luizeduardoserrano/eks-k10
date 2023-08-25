#-------Set the environment variables"
export MY_CLUSTER=eksK10lab             #Customize your cluster name
export MY_INSTANCE_TYPE=t3a.large       #Customize your favorite machine type
export MY_REGION=us-east-1              #Customize your favorite region
export MY_ZONE=us-east-1c               #Customize your favorite zone
export MY_BUCKET=k10bucket              #Customize your favorite bucket
export MY_OBJECT_STORAGE_PROFILE=myaws3 #Customize your favorite profile name
export MY_K8S_VERSION=1.23              #Customize your Kubernetes Version
source ~/.bashrc                        #Set environment variables
