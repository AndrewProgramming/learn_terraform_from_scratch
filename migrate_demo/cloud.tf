terraform {
  backend "remote" {
    hostname      = "app.terraform.io"
    organization  = "test-org-2jkhskjdhu"

    workspaces {
      name = "tfc-guide-example-sdfkajs-123123"
    }
  }
}