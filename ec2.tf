resource "aws_instance" "example" {
  ami                    = "ami-020cba7c55df1f615" 
  instance_type          = "t2.micro"            
  vpc_security_group_ids = [aws_security_group.runner-security-group.id]
  subnet_id              = "subnet-0905f86a59220b6b5"  
  associate_public_ip_address = true
  iam_instance_profile   = aws_iam_instance_profile.new-profile.name 
  tags = {
    Name = "My-EC2-Instance"
  }
}

resource "aws_security_group" "runner-security-group" {
  name        = "allow-new-ssh"
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
# I manually added an ingress rule for port 80 and 8080 so that I can access my web app via the browser
resource "aws_iam_instance_profile" "new-profile" {
  name = "new-instance-profile"
  role = "EC2SSMrole" 
}