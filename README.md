This script is based on the Yongkang He job and customized with changes. @YongkangHe.

It allows you to automatically build a ready-to-use Kasten K10 demo environment running on EKS in about 20 minutes with deploy.sh. For simplicity and cost optimization, the EKS cluster will have only one worker node and create a separate vpc and subnets. These are bash shell-based scripts that work on Cloud Shell. 

I recommend creating the EKS cluster from scratch, using the script eks-deploy.sh or deploy.sh, to guarantee the perfect creation of the IAM and CSI rules necessary for Kasten to work.

The EKS cluster characteristics are defined in setenv.sh file (Set the environment variables). The default settings deploy worker nodes of type t3a.large in the us-east-2 region. Optionally, you can customize the clustername, instance-type, zone, region, bucketname editing this file:

vi setenv.sh 
````


# Ste. 

1. Go to AWS Cloud Shell
2. Clone the github repo, run below command
````
git clone https://github.com/yongkanghe/eks-k10.git
````
3. Install the required tools (eksctl, kubectl, helm) and input AWS Access Credentials
````
cd eks-k10;./awsprep.sh;. ./setenv.sh
````
4. Optionally, you can customize the clustername, instance-type, zone, region, bucketname
````
vi setenv.sh
````

## NOTE: 
If you are using AWS provided access via Event Engine, please use ee-* scripts instead. 
#### E.g. ee-eks-deploy.sh, ee-k10-deploy.sh, ee-deploy.sh

# Deploy based on your needs

| Don't have an EKS cluster | Already have an EKS cluster     | Have nothing                    |
|---------------------------|---------------------------------|---------------------------------|
| Deploy EKS                | Deploy K10                      | Deploy EKS and K10              |
| ``` ./eks-deploy.sh ```   | ``` ./k10-deploy.sh ```         | ``` ./deploy.sh ```             |
| 1.Create an EKS Cluster   |                                 | 1.Create an EKS Cluster         |
|                           | 1.Install Kasten K10            | 2.Install Kasten K10            |
|                           | 2.Deploy a Cassandra database   | 3.Deploy a Cassandra database   |
|                           | 3.Create a S3 location profile  | 4.Create a S3 location profile  |
|                           | 4.Create a backup policy        | 5.Create a backup policy        |
|                           | 5.Kick off on-demand backup job | 6.Kick off on-demand backup job |

# Destroy based on your needs

| Destroy EKS               | Destroy K10                         | Destroy EKS and K10                 |
|---------------------------|-------------------------------------|-------------------------------------|
| ``` ./eks-destroy.sh ```  | ``` ./k10-destroy.sh ```            | ``` ./destroy.sh ```                |
| 1.Remove the EKS Cluster  |                                     | 1.Remove the EKS Cluster            |
|                           | 1.Remove Cassandra database         | 2.Remove all the relevant disks     |
|                           | 2.Remove Kasten K10                 | 3.Remove all the relevant snapshots |
|                           | 3.Remove the S3 storage bucket      | 4.Remove the S3 storage bucket      |

# Build an EKS cluster via Web UI
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/d0vhf_ggnko/0.jpg)](https://www.youtube.com/watch?v=d0vhf_ggnko)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Secure containers via CloudCasa
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Nvxbg4iGbJE/0.jpg)](https://www.youtube.com/watch?v=Nvxbg4iGbJE)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Secure your containers via Falco
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/v0NtUVUkfmQ/0.jpg)](https://www.youtube.com/watch?v=v0NtUVUkfmQ)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Backup your containers via K10
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/27sIjUbxgFk/0.jpg)](https://www.youtube.com/watch?v=27sIjUbxgFk)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Build an EKS + K10 via Automation
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/v_Aks8GFBVA/0.jpg)](https://www.youtube.com/watch?v=v_Aks8GFBVA)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Build an EKS + K10 on AWS Event Engine
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/VRJVdUqMiRg/0.jpg)](https://www.youtube.com/watch?v=VRJVdUqMiRg)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Kasten on AWS Workshop
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/AB97gJMlzRE/0.jpg)](https://www.youtube.com/watch?v=AB97gJMlzRE)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# K10 on EKS self-paced Lab Guide
## Option 1, AWS provides access via Event Engine
http://aws-lg-ee.yongkang.cloud

## Option 2, Use your own AWS account
http://aws-lg.yongkang.cloud

# Build, Protect and Migrate Containers
[![IMAGE ALT TEXT HERE](https://pbs.twimg.com/media/FK5rsaeXwAIEmtI?format=jpg&name=small)](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

## Kasten - No. 1 Self Managed Kubernetes Backup
https://kasten.io 

# CloudCasa - Best Kubernetes Backup as a Service
https://cloudcasa.io 

# Contributors

#### Follow [Yongkang He](http://yongkang.cloud) on LinkedIn, Join [Kubernetes Data Management](https://www.linkedin.com/groups/13983251) LinkedIn Group

### [Desmond Lai](https://www.linkedin.com/in/desmondlyx/)
