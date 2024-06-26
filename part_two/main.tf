provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.access_secret_key
  
}
data "aws_ami" "ubuntu_lookup" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}

resource  "aws_instance" "example_ec2" {
    ami = data.aws_ami.ubuntu_lookup.id
    instance_type = "t2.micro"
    tags = {
        Name = "HelloWorld"
    }
}