resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventort.tftpl", {
    web_server_ip          = aws_eip.web_server_eip.public_ip
    ansible_controller_ip  = aws_instance.ansible_controller.private_ip
    monitoring_server_ip   = aws_instance.monitoring_server.private_ip
    ssh_private_key        = local_file.private_key_pem.filename
  })
  filename = "../ansible/inventory.ini"
}