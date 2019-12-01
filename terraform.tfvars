aws_reigon      = "us-east-1"
key_name        = "new-key-pair"
ami             = "ami-000750b86ae489780"
vpc_id          = "vpc-f45d8f8e"


security_group_1 = "sg-0979687966e579fee"
security_group_2 = "sg-0979687966e579fee"

image_url = "aniketchopade/location-service"
asg_min   = 1
asg_max   = 1
asg_desired = 1
instance_type = "t2.micro"

subnet_2     = "subnet-90e062cc"
subnet_1     = "subnet-f032b497"