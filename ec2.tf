# Key Pair
# Step 1: Add this to ec2.tf (TOP)
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Step 2: Create AWS Key Pair from it
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Step 3: Save private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/terraform-key.pem"
  file_permission = "0400"
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.my_vpc.id

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

  tags = {
    Name = "web-sg"
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami                    = "ami-03f4878755434977f" # Ubuntu 22.04 - ap-south-1
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.terraform_key.key_name

  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install nginx git -y

systemctl start nginx
systemctl enable nginx

rm -rf /var/www/html/*
git clone https://github.com/jerrish/site_particles.git /var/www/html

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

systemctl restart nginx
echo "NGINX Deployment Completed Successfully!" > /root/deploy-status.txt
EOF

  tags = {
    Name = "terraform-web-server"
  }
}
