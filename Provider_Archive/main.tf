locals {
  files = {
    py = {
      file_path = "${abspath(path.module)}/main.py"
    }
    js = {
      file_path = "${abspath(path.module)}/index.js"
    }
    go = {
      file_path = "${abspath(path.module)}/main.go"
    }
  }
}

data "local_file" "local_files" {
  for_each = local.files


  filename = each.value.file_path
}

data "archive_file" "zipfile" {
  output_path = "${abspath(path.module)}/webserver.zip"
  type        = "zip"

  dynamic "source" {
    for_each = data.local_file.local_files
    content {
      content  = source.value.content
      filename = source.value.filename
    }
  }
}

output "zip_file_info" {
  value = data.archive_file.zipfile
}

output "zip_files" {
  value = [for key, value in data.archive_file.zipfile.source : value.filename]
}

output "zip" {
  value = flatten([for key, value in data.archive_file.zipfile.source : [
    for k, v in value: v
          if k == "filename"
    ]
  ])
}

