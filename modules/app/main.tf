
resource "aws_instance" "web" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = var.instance_type

  tags = {
    Name        = var.app_name
    Environment = var.environment
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to ami, because after the instance is created it
      # will have a proper ami assigned, like "ami-0f88e80871fd81e91"
      ami,
    ]
  }
}