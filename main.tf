terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
  service_account_id = jsondecode(file("key.json")).service_account_id
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id               = var.cloud_id
  folder_id              = var.folder_id
  zone                     = "ru-central1-a"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = local.service_account_id
  description        = "static access key for object storage"
}

