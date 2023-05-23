
data "local_file" "generated_file" {
  filename = var.generated_file_path
}

resource "local_file" "file" {
  count    = var.number_of_files
  content  = var.content
  filename = "${path.module}/${var.name}_${count.index}"
}


module "files" {
  source  = "../files"
  content = var.content
  name    = var.name
}


