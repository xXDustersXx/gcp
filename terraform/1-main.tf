#DEFINE VARS
locals {
  project       = PROJECT.ID				#example ~> "project-123456"
  region        = "europe-west1"
  zone          = "europe-west1-c"
  mail_account  = SERVICE.ACCOUNT.MAIL			#example ~> "service-account@project-123456.iam.gserviceaccount.com"
  sshkey        = SSH.KEY 
}

#SET PROVIDER
provider "google" {
  credentials   = PATH.TO.JSON.FILE.CONTAINS.CRED	#example ~> file("/any/path/to/service-account.json")
  project       = local.project
  region        = local.region
  zone          = local.zone
}
