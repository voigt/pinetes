# Initial Infrastructure

This Terraform Script creates:

- AWS User
- Policies
- Security Groups
- outputs all relevant resources for an MCM Machine-Class

```
terraform init
terraform plan
terraform apply -auto-approve
```

Outputs (example):

```
[...]

Outputs:

default-vpc-id = vpc-f70df09d
k3s-ec2-machine-controller_id = <string>
k3s-ec2-machine-controller_secret = <string>
k3s-ec2-machine-controller_user = tf-k3s-ec2-machine-controller
sg-ssh = sg-0a404c6b8dd677d34
sg-vpn-inbound = sg-0091a51ad87e759a8
sg-vpn-outbound = sg-05ebf0685ee626c04
subnet_cidr_blocks = [
  "subnet-1335266e",
  "subnet-47ec0a0b",
  "subnet-770bae1d",
]
```