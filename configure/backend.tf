terraform {
  backend "s3" {
    bucket = "tamishawsbucket"
    key    = "terraform/tfstate.tfstate"
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
  }
}
