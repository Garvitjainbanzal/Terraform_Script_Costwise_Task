resource "aws_security_group" "EC2_SECURITY_GROUP" {
  name_prefix = "ec2-sg-"
}

resource "aws_security_group_rule" "ec2_http_access" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.EC2_SECURITY_GROUP.id
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"
  instance_type = "t4g.micro"
  key_name      = "linux"
  security_groups = [aws_security_group.EC2_SECURITY_GROUP.name]
  user_data = "${file("WordPressDeploy.sh")}"
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2_instance.id
}

resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
}

resource "aws_security_group_rule" "rds_from_ec2" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  source_security_group_id = aws_security_group.EC2_SECURITY_GROUP.id
  security_group_id = aws_security_group.rds_sg.id
}

resource "aws_db_instance" "rds_instance" {
  identifier            = "my-rds-instance"
  engine                = "mysql"
  instance_class        = "db.t4g.micro"
  allocated_storage     = 20
  storage_type          = "gp2"
  username              = "db_user"
  password              = "db_password"
  skip_final_snapshot   = true
  publicly_accessible   = false
  multi_az              = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "AWSRDSInstance"
  }
}
