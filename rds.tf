provider "aws" {
  region = "ap-south-1"
}


resource "aws_db_instance" "mydb" {
    db_name = "myDB"
    identifier = "myfirstrds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.3.39"
    username = "tanya"
    password = "password123"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true
}