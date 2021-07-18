provider "google" {
  project     = "veerahemannthnag"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "credentials.json"
}


resource "google_storage_bucket" "auto-expire" {
  name          = "veerahemanntnag-terraform-state"
  location      = "US"
  force_destroy = true

}

module "vm1" {
  
  source = "github.com/veerahemannthnag/terraformsession.git"
vm_name = "terraform-vm-1"
machine_type = var.machine_type

}
module "vm2" {
  
source = "./modules/compute"
vm_name =  "${var.machine_type}-terraform-vm-2" 
machine_type = var.machine_type //"n1-standard-2"

}



# module "vm3" {
  
# source = "./modules/compute"
# vm_name = "terraform-vm-3"
# machine_type = "n1-standard-1"

# }