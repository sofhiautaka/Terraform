resource "aws_instance" "ec2-terraform2" { // nome p terraform
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-terraform2-separado" // nome q aparece na aws
  }
}