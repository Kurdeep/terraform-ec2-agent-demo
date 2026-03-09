resource "aws_security_group" "web_sg" {
  name = "agent-demo-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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


resource "aws_instance" "demo_ec2" {

  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  root_block_device {
    volume_size = var.root_volume_size
  }

  tags = {
    Name = "agent-demo-instance"
  }
}

