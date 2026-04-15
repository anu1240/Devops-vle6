provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu (update if needed)
  instance_type = "t2.micro"
  key_name      = "devops-key"

  security_groups = ["devops-sg"]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "DevOps-vle6-Server"
  }
}