cat <<EOF > remote-state.tf
terraform {
  backend "remote" {
    organization = "${ORGANIZATION}"
    workspaces {
      name = "${WORKSPACE}"
    }
  }
}
EOF

terraform init
terraform destroy
