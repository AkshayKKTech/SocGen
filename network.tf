data "aws_vpc" "existing_vpc" {
    id = "vpc-023decc1dfb272168"

}   
    data "aws_subnet" "existing_subnet" {
        id = "subnet-08ac1365e89d43bfb"
    }
resource "aws_security_group" "sg" {
  name = "socgensg"
  description = "allow inboud and outbond port"
vpc_id      = data.aws_subnet.existing_subnet.vpc_id
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags ={
        Name = "Socgensg1"
    }
}
