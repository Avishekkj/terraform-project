resource "aws_instance" "app_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  #ecurity_group_ids = var.security_group_ids 
  vpc_security_group_ids      = var.security_group_ids
  subnet_id       = var.subnet_id
  key_name      = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "terraform_app-instance"
  }





 # File provisioner to copy a file from local to the remote EC2 instance
  /*provisioner "file" {
    source      = "app.py"  # Replace with the path to your local file
    destination = "/home/ubuntu/app.py"  # Replace with the path on the remote instance
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }*/

 connection {
      type        = "ssh"
      user        = "ec2-user"  # Use appropriate username (e.g., ubuntu, ec2-user)
      private_key = file(var.private_key_path)  # Path to private SSH key
      host        = self.public_ip
    }


provisioner "file" {
    source      = "app_main.py"  # Replace with the path to your local file  RT_Project/app.py
    destination = "/home/ec2-user/app_main.py"  # Replace with the path on the remote instance
  }


 provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y python3-pip",
      "sudo pip3 install flask",
      /*"echo 'from flask import Flask' > app.py",
      "echo 'app = Flask(__name__)' >> app.py",
      "echo '@app.route('/')' >> app.py",
      "echo 'def hello():' >> app.py",
      "echo '   return \"Hello World from Flask!\"' >> app.py",
      "echo 'if __name__ == '__main__':' >> app.py",
      "echo '   app.run(host='0.0.0.0', port=80)' >> app.py",*/

      "sudo python3 app.py &"  # Run the app.py in the background
    ]

   
  }
}
