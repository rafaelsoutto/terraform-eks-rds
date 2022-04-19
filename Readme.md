#  TERRAFORM (EKS + SQL SERVER -> RDS)

OBS: Documentation in progress....

This project with the default configuration, creates a VPC with 2 public subnets, 3 privates subnetes, an AWS EKS cluster, t3.medium nodegroup for the cluster and a RDS sql server database with S3 backup/restore option group alredy configured.

## Description

NOT FINISHED YEAT!

## Getting Started

NOT FINISHED YEAT!

### Dependencies

* Terraform cli -> https://learn.hashicorp.com/tutorials/terraform/install-cli.c
* aws cli -> https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html Obs: not necessary but recomended to use profile config on Terraform AWS provider configuration on main.tf

## Executing program

NOT FINISHED YEAT!

### Environment Variables

|  Environment          |  Description                                                                       | Optional       | Default     |
| ----------------------| ---------------------------------------------------------------------------------  | -------------  | ----------- |
|REMOTE_STATE           | Variable used to set terraform remote-state usage                                  |        X       | False
|ORGANIZATION           | Organization name when using terrafrom remote state                                |        X       | -
|WORKSPACE              | Workspace name when using terrafrom remote state                                   |        X       | -
|AWS_PROFILE            | AWS profile name configured at ~/.aws/config                                       |                | -
|region                 | AWS region desired to create your resources                                        |        X       | us-east-2
|instance_type          | Instance type for the nodegroup                                                    |        X       | db.t3.small
|aws_access_key_id      | aws access key from your IAM user account                                          |                |
|aws_secret_access_key  | aws secret access key from your IAM user account                                   |                |
|environment            | used to tag created resources                                                      |        X       | eks_rds_tf_poc
|vpc_cidr               | VPC CIDR Block                                                                     |                | 192.168.0.0/16
|cluster_name           | used to name the created cluster                                                   |                | eks-tf-poc
|nodegroup_name         | used to name eks nodegroup                                                         |        X       | tf-poc-ng-1
|availability_zones     | zones set to create subnets                                                        |        X       | us-east-2a,us-east-2b,us-east-2c
|public_subnets_cidr    | public subnets CIDR Blocks                                                         |        X       | 192.168.32.0/19,192.168.64.0/19,192.168.0.0/19
|private_subnets_cidr   | private subnets CIDR Blocks                                                        |        X       | 192.168.96.0/19,192.168.160.0/19,192.168.128.0/19
|cidrs_cluster_access   | CIDR list used to grant access to eks cluster                                      |        X       | 0.0.0.0/0
|cidrs_db_access        | CIDR list used to grant access to rds db                                           |        X       | 0.0.0.0/0
|db_port                | used to set the connection port on RDS database                                    |        X       | 1433 (sql default)
|rds_username           | rds master username                                                                |        X       | admin
|rds_master_password    | rds sqlserver master password                                                      |                |
|instance_class         | rds instance type                                                                  |        X       | db.t3.small
|sqlserver_engine       | rds sqlserver engine                                                               |        X       | sqlserver-web
|server_name            | rds instance name                                                                  |        X       | database-01
|sqlserver_engineversion| rds sqlserver engine version                                                       |        X       | 14.00.3401.7.v1
|max_allocated_storage  | max storage size for rds sqlserver instance                                        |        X       | 1000
|allocated_storage      | default allocated storage for rds sql server                                       |        X       | 100


To apply infrastructure:

```
 sh provide.sh
```

To destroy infrastructure:

```
 sh provide.sh
```

## Authors

Rafael Soutto

