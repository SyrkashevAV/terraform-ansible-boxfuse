resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl", {
    build_ip = yandex_compute_instance.build.network_interface[0].nat_ip_address,
    prod_ip  = yandex_compute_instance.prod.network_interface[0].nat_ip_address
  })
  filename = format("%s/%s", abspath(path.root), "terraform/terraform/inventory.yaml")
}