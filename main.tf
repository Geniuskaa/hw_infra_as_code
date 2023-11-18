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
  service_account_key_file = "/work/key.json"
  cloud_id                 = "b1g71e95h51okii30p25"
  folder_id                = "b1gbk2v7cro1t1dboen8"
  zone                     = "ru-central1-a"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = local.service_account_id
  description        = "static access key for object storage"
}

