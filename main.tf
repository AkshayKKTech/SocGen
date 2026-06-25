resource "aws_instance" "ec2" {
  instance_type = var.instance_type
  count = var.instance_count
  ami = "ami-0189c3f216088b7db"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = data.aws_subnet.existing_subnet.id
}