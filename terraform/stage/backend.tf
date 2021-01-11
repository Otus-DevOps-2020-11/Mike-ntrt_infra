terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "devoptus-tfstate"
    region     = "us-east-1"
    key        = "stage.tfstate"
    access_key = "nsBaotZ7bPkM35cMUz94"
    secret_key = "xxxxxxxxxxxxxxxxxx"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
