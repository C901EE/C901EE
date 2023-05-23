module "files" {
  source  = "./modules/files"
  content = "test"
  name    = "name"
}
module "read" {
  source = "./modules/read"

  read_input = module.files.file_content_md5
}
module "write" {
  source = "./modules/write"

  answer_1 = var.answer_1
  answer_2 = var.answer_2
  answer_3 = var.answer_3
  answer_4 = var.answer_4
  answer_5 = var.answer_5
}
provider "local" {}

module "data" {
  source              = "./modules/data"
  name                = var.name
  generated_file_id   = var.generated_file_id
  content             = var.content
  depends_on          = [module.files]
}

output "file_id" {
  value = module.data.generated_file.generated_file_id
}