resource "local_file" "test" {
  # content = var.people.name
  content = var.people["name"]
  filename = "${path.module}/test.txt"
}
