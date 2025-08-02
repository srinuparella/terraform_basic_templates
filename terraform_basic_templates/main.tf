    data "aws_vpc" "existvpc" {
        filter {
        name = "tag:Name"
        values = ["myproduction_VPC"]
        }
    }

    data "aws_subnet" "existsubnet" {
        filter {
        name = "tag:Name"
        values = ["DOCKER_SUBNET"]
        }
    }

    data "aws_security_group" "existsg" {
        filter {
        name = "group-name"
        values = ["DUMMY PROD SG"]
        }
        }
    resource "aws_key_pair" "ssh_key_pair" {
    key_name = "docker_key"
    public_key = file("~/.ssh/id_ed25519.pub")
    }
    data "aws_ami" "fetchami" {
    most_recent = true
     owners = ["099720109477"]
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250530"]
    }
    }
    resource "aws_instance" "myinstance" {
        ami = data.aws_ami.fetchami.id
        key_name = aws_key_pair.ssh_key_pair.key_name
        instance_type = "t3.micro"
        subnet_id = data.aws_subnet.existsubnet.id
         vpc_security_group_ids = [data.aws_security_group.existsg.id]
        associate_public_ip_address = true
        tags = {
        Name="Docker_VM"
        }
    }
    resource "null_resource" "dummynull" {
      triggers = {
        Build_id = "1.8"
      }
    
    connection {
        type = "ssh"
        user = "ubuntu"
        host = aws_instance.myinstance.public_ip
        private_key = file("~/.ssh/id_ed25519")
    }
    # provisioner "remote-exec" {
    #   inline = [ "sudo apt update",
    #              "sudo apt install nginx -y" ]
    # }
    
#Now practice the file provisioner 
#     provisioner "file" {
# source = "./apache2.sh"
# destination = "/home/ubuntu/apache2.sh"
#     }
    provisioner "file" {
source = "./nginx.sh"
destination = "/tmp/nginx.sh"
    }
    provisioner "remote-exec" {
        inline = [ "sudo chmod +x /tmp/nginx.sh", "sudo sh /tmp/nginx.sh" ]
#       # sudo chmod +x /tmp/apache2.sh # Give execute permission to all users (user, group, others)
#       #sudo sh /tmp/apache2.sh  # Run the script from /tmp directory
#     }
#   provisioner "local-exec" {
#   command = "sudo apt update && sudo apt install -y nginx"
# }

    }
    }
    