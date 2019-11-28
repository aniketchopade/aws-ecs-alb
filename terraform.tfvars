aws_reigon      = "ap-south-1"
key_name        = "new-key-pair"
ami             = "ami-0086e1fa1a40fe3d0"
vpc_id          = "vpc-09646561"


security_group_1 = "sg-0b88af1298b2e536a"
security_group_2 = "sg-0b88af1298b2e536a"

image_url = "aniketchopade/location-service"
asg_min   = 1
asg_max   = 1
asg_desired = 1
instance_type = "t2.micro"

subnet_2     = "subnet-c49eb1ac"
subnet_1     = "subnet-757ee239"