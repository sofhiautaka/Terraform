resource "aws_vpc" "minha_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "minha-vpc"
    }
}

resource "aws_instance" "ec2-iac-atividade-1" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-iac-atividade-1"
  }

  ebs_block_device { // Bloco de armazenamento (disco)
    device_name = "/dev/sda1"
    volume_size = 8
    volume_type = "gp3"
  }

  key_name = "aula_iac"

  subnet_id = aws_subnet.subnet-publica.id

}

resource "aws_instance" "ec2-iac-atividade-2" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-iac-atividade-2"
  }

  ebs_block_device { // Bloco de armazenamento (disco)
    device_name = "/dev/sda1"
    volume_size = 8
    volume_type = "gp3"
  }

  key_name = "aula_iac"

  subnet_id = aws_subnet.subnet-privada.id
}

resource "aws_subnet" "subnet-publica" {
  vpc_id     = aws_vpc.minha_vpc.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"
  tags = {
      Name = "subnet-publica"
  }
}

resource "aws_subnet" "subnet-privada" {
  vpc_id     = aws_vpc.minha_vpc.id
  cidr_block = "10.0.2.0/24"
    tags = {
      Name = "subnet-privada"
    }
}

