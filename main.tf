# Modules are like reusable blueprint for your infrastructure
# code can be shared and re-used
# stores code remotely
# enable easier testing
# can be referred using source attribute
# can be nested inside other modules, allowing you to quickly spin up whole seperate environments
# support local and remote modules
   # - local modules are stored alongside the terraform configuration (in a separate directory, outside of each environmment
   #    but in the same repository ) with source path ./ or ../
   # - remote modules are stored externally in a separate repository, and supports versioning

# Terraform Block
terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-east-2"
  profile = "Bris"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Demo-ec2"

}
output "module_output" {
    value = module.instance_id 

    }
  


/*module "web" {
    source = "./web"
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}*/