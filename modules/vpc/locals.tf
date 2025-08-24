locals {
  public_subnet_cidrs = {
    "${var.region}a" = "10.0.1.0/24"
    "${var.region}b" = "10.0.2.0/24"
    }
  private_subnet_cidrs = {
    "${var.region}a" = "10.0.3.0/24"
    "${var.region}b" = "10.0.4.0/24"
}
}