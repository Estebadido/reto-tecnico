resource "aws_s3_bucket" "S3_Reto" {
  bucket = "reto-tecnico-${var.tags["Owner"]}-${var.tags["Environment"]}"
    tags = var.tags
}