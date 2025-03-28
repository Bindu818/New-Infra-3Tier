#### LinkedIn App RDS ####

/*# Subnet Group for LinkedIn App
resource "aws_db_subnet_group" "linkedin-db-sub-grp" {
  name       = "linkedin-db-sub-grp"
  subnet_ids = ["${aws_subnet.linkedin-pvt-sub-1.id}", "${aws_subnet.linkedin-pvt-sub-2.id}"]
}

# RDS Database Instance for LinkedIn App
resource "aws_db_instance" "linkedin-db" {
  allocated_storage           = 100
  storage_type                = "gp3"
  engine                      = "mysql"
  engine_version              = "8.0.39"
  instance_class              = "db.m5.large"
  identifier                  = "linkedin-db"
  username                    = "linkedinadmin"      # Replace with your LinkedIn app's DB username
  password                    = "MyStrongPassword123!"  # Replace with your custom password
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = aws_db_subnet_group.linkedin-db-sub-grp.name
  vpc_security_group_ids      = ["${aws_security_group.linkedin-db-sg.id}"]  # Replace with your security group ID
  multi_az                    = true
  skip_final_snapshot         = true
  publicly_accessible         = false

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}
*/
