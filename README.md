# EC2-instance-using-terraform

In this project, I created an EC2 instance using terraform. 

The instance has the following configuration:

- Ubuntu 20.04 LTS Operating System
- t2.micro instance type
- Default VPC
- Security group allowing SSH access from anywhere
- Tag with the name 'My EC2 Instance'


## To use it, follow these steps:

- Clone the repo - ``` git clone https://github.com/Nikhil26112/EC2-instance-using-terraform.git ```
- Change directory - ``` cd EC2-instance-using-terraform ```
- Run following commands to create EC2 instance:
``` 
- terraform init 
- terraform plan
- terraform apply 
``` 
- To delete every resource you made using this script- ``` terrafrom destroy ```
