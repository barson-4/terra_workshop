output "latest_ami_id" {
      value = "${data.aws_ami.amazon2_linux.id}"
}
 
output "instance_id" {
      value = "${aws_instance.ec2.id}"
}
output "public_ip" {
      value = "${aws_instance.ec2.public_ip}"
}
