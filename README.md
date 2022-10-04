This is a short example of a modular Terraform framework created by me.
In essence, it makes full use of the 'for_each' iteration to allow various combinations of resources to be managed from a single variable file or multiple variable files.
You can have 1 or more VPCs, each hosting 1 or more environments within a single variable file.
Or you can split them into whatever combination is suitable (e.g. 1 variable file containing 1 VPC hosting Dev and QA and another VPC containing UAT with 1 other variable file containing 1 VPC hosting Prod).

In this example repository, the following example variable files in the env folder creates the respective resources:

example1.tf
1 VPC, 2 public subnets and 3 private subnets.

example2.tf
2 VPC, 2 public subnets and 3 private subnets for VPC1 and 2 public subnets and 2 private subnets for VPC2.