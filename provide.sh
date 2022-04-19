#!/bin/bash
cd eks_rds/

if [ $REMOTE_STATE == "True" ]
then
  sh scripts/remote-state-apply.sh
else
  sh scripts/custom-apply.sh
fi

terraform output -raw kubeconfig_certificate_authority_data | base64 -d > ca_cert.pem
export TF_VAR_kubeconfig_certificate_authority_data=$(cat ca_cert.pem | base64) && rm -rf ca_cert.pem
export TF_VAR_cluster_endpoint=$(terraform output -raw eks_endpoint)
export TF_VAR_cluster_name=$(terraform output -raw cluster_name)
export TF_VAR_nodegroup_role_name=$(terraform output -raw node_group_role_name)

cd ../helm/

sh scripts/custom-apply.sh

aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${AWS_REGION} --profile ${AWS_PROFILE}
