resource "aws_s3_bucket" "example" {
  bucket = "${var.application}-product-bucket01"

  tags = {
    name        = var.application
    environment = var.environment
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.example.id
  key    = join("/", [var.application, "Dockerrun.aws.json"])
  source = "./Dockerrun.aws.json"
  etag   = filemd5("./Dockerrun.aws.json")
}
