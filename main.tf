module "files" {
  source  = "./modules/files"
  content = "test"
  name    = "name"
}
module "read" {
  source = "./modules/read"

  read_input = module.files.file_content_md5
}