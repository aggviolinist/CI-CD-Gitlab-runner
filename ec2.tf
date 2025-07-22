resource "aws_instance" "example" {
  ami                    = "ami-0cbbe2c6a1bb2ad63" 
  instance_type          = "t2.micro"            
  vpc_security_group_ids = [aws_security_group.runner-security-group.id]
  subnet_id              = "subnet-0905f86a59220b6b5"  
  associate_public_ip_address = true
  iam_instance_profile   = aws_iam_instance_profile.existing-profile.name 
  tags = {
    Name = "My-EC2-Instance"
  }
}

resource "aws_security_group" "runner-security-group" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0630e4ccdcd788a95" 

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "existing-profile" {
  name = "instance-profile-name"
  role = "EC2SSMrole" 
}

