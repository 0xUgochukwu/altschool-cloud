resource "local_file" "test" {
  content = "Hello World! Just testing"
  filename = "${path.module}/test.txt"
}
