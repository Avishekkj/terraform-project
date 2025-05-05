provider "aws" {
  region  = "ap-southeast-2"
  profile = "default"
}


resource "aws_key_pair" "flask_key" {
  #key_name   = var.key_name
  #public_key = ("deployment/flask-key.pub")
  #public_key = file("${path.module}/flask-key.pub")
  key_name   = "my-terraform-key"
  public_key = file("/Users/avishekjha/.ssh/my_terraform_key.pub")
}



resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.flask_key.key_name

  associate_public_ip_address = true

  tags = {
    Name = "FlaskAppServer"
  }



connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)# var.private_key_path
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ec2-user/app.py"
  }

  provisioner "remote-exec" {
    inline = [
      /*"sudo yum update -y",
      "sudo yum install -y python3",
      "python3 -m pip install --upgrade pip",
      "pip3 install flask",*/

      "sudo yum update -y",
      "sudo yum install -y python3-pip",
      "sudo pip3 install flask",
      #"nohup sudo python3 app.py "
      "nohup python3 /home/ec2-user/app.py > /home/ec2-user/app.log 2>&1 &"


      #"nohup sudo python3 /home/ec2-user/app.py &"
    ]
  }

  
}
