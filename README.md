This script is based on the job of Yongkang He and is customized with some changes. Follow him: @YongkangHe

It allows you to automatically build a ready-to-use Kasten K10 demo environment running on EKS in about 20 minutes. For simplicity and cost optimization, the EKS cluster will have only one worker node and create a separate vpc and subnets. These are bash shell-based scripts that work on Cloud Shell. 

I recommend creating the EKS cluster from scratch, using the script eks-deploy.sh or deploy.sh, to guarantee the perfect creation of the IAM and CSI rules necessary for Kasten to work.

The EKS cluster characteristics are defined in setenv.sh file (Set the environment variables). The default settings deploy worker nodes of type t3a.large in the us-east-1 region (US East N. Virginia). Optionally, you can customize the clustername, instance-type, zone, region, bucketname editing in this file.

#### Preparation for deployment

1. Go to AWS Cloud Shell
   
2. Clone the github repo, run below command
````
git clone https://github.com/luizeduardoserrano/eks-k10.git
````
3. Install the required tools (eksctl, kubectl, helm) and input AWS Access Credentials
````
cd eks-k10;./awsprep.sh;. ./setenv.sh
````
4. Edit the file csi-enable.sh and change the AWS Account ID in this command (XXXXXXXXXXXX):

eksctl create addon --name aws-ebs-csi-driver --cluster $my_eks_cluster --service-account-role-arn arn:aws:iam::XXXXXXXXXXXX:role/AmazonEKS_EBS_CSI_DriverRole --force
````
vi csi-enable.sh
````

#### Deploy based on your needs

|  Deploy  EKS cluster      | Deploy K10 (after EKS)          | Deploy both (EKS and K10)       |
|---------------------------|---------------------------------|---------------------------------|
| Deploy EKS                | Deploy K10                      | Deploy EKS and K10              |
| ``` ./eks-deploy.sh ```   | ``` ./k10-deploy.sh ```         | ``` ./deploy.sh ```             |
| 1.Create an EKS Cluster   |                                 | 1.Create an EKS Cluster         |
|                           | 1.Install Kasten K10            | 2.Install Kasten K10            |
|                           | 2.Deploy a Cassandra database   | 3.Deploy a Cassandra database   |
|                           | 3.Create a S3 location profile  | 4.Create a S3 location profile  |
|                           | 4.Create a backup policy        | 5.Create a backup policy        |
|                           | 5.Kick off on-demand backup job | 6.Kick off on-demand backup job |

#### Destroy based on your needs

| Destroy EKS               | Destroy K10                         | Destroy both (EKS and K10)          |
|---------------------------|-------------------------------------|-------------------------------------|
| ``` ./eks-destroy.sh ```  | ``` ./k10-destroy.sh ```            | ``` ./destroy.sh ```                |
| 1.Remove the EKS Cluster  |                                     | 1.Remove the EKS Cluster            |
|                           | 1.Remove Cassandra database         | 2.Remove all the relevant disks     |
|                           | 2.Remove Kasten K10                 | 3.Remove all the relevant snapshots |
|                           | 3.Remove the S3 storage bucket      | 4.Remove the S3 storage bucket      |
