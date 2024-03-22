resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl", {
    build_ip = yandex_compute_instance.build[0].network_interface[0].nat_ip_address,
    prod_ip  = yandex_compute_instance.build[1].network_interface[0].nat_ip_address
  })
}
