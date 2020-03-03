provider "aws" {
  version = "~> 2.2"
  region  = "us-west-2"
}

resource "random_string" "r_string" {
  length  = 6
  upper   = true
  lower   = true
  number  = false
  special = false
}

module "patch_baseline_amazon_linux" {
  source = "../../module"

  approve_after_days                = "3"
  approved_patches                  = []
  approved_patches_compliance_level = "CRITICAL"
  compliance_level                  = "CRITICAL"
  description                       = "Patch Baseline Test - Created with Terraform"
  enable_exclusions                 = true
  excluded_key                      = "CLASSIFICATION"
  excluded_values                   = ["Newpackage"]
  name                              = "CircleCI-Test-Baseline-AmazonLinux-${random_string.r_string.result}"
  operating_system                  = "AMAZON_LINUX"
  product_values                    = ["AmazonLinux2017.09"]
  rejected_patches                  = []

  classification_values = [
    "Security",
  ]

  severity_values = [
    "Critical",
  ]
}

module "patch_baseline_centos" {
  source = "../../module"

  approve_after_days                = "3"
  approved_patches                  = []
  approved_patches_compliance_level = "CRITICAL"
  compliance_level                  = "CRITICAL"
  description                       = "Patch Baseline Test - Created with Terraform"
  enable_exclusions                 = false
  name                              = "CircleCI-Test-Baseline-Centos-${random_string.r_string.result}"
  operating_system                  = "CENTOS"
  product_values                    = ["CentOS7.5"]
  rejected_patches                  = []

  classification_values = [
    "Security",
  ]

  severity_values = [
    "None",
  ]
}

module "patch_baseline_rhel" {
  source = "../../module"

  approve_after_days                = "3"
  approved_patches                  = []
  approved_patches_compliance_level = "CRITICAL"
  compliance_level                  = "CRITICAL"
  description                       = "Patch Baseline Test - Created with Terraform"
  enable_exclusions                 = false
  name                              = "CircleCI-Test-Baseline-Rhel-${random_string.r_string.result}"
  operating_system                  = "REDHAT_ENTERPRISE_LINUX"
  product_values                    = ["RedhatEnterpriseLinux7.3"]
  rejected_patches                  = []

  classification_values = [
    "Security",
  ]

  severity_values = [
    "None",
  ]
}

module "patch_baseline_ubuntu" {
  source = "../../module"

  approve_after_days                = "3"
  approved_patches                  = []
  approved_patches_compliance_level = "CRITICAL"
  compliance_level                  = "CRITICAL"
  description                       = "Patch Baseline Test - Created with Terraform"
  enable_exclusions                 = true
  excluded_key                      = "PRIORITY"
  excluded_values                   = ["Extra"]

  name             = "CircleCI-Test-Baseline-Ubuntu-${random_string.r_string.result}"
  operating_system = "UBUNTU"
  product_values   = ["Ubuntu16.04"]
  priority_values  = ["Required"]
  rejected_patches = []

  section_values = [
    "All",
  ]
}

module "patch_baseline_windows" {
  source = "../../module"

  approve_after_days                = "3"
  approved_patches                  = []
  approved_patches_compliance_level = "CRITICAL"
  compliance_level                  = "CRITICAL"
  description                       = "Patch Baseline Test - Created with Terraform"
  enable_exclusions                 = false
  name                              = "CircleCI-Test-Baseline-Windows-${random_string.r_string.result}"
  operating_system                  = "WINDOWS"
  product_values                    = ["WindowsServer2016"]
  rejected_patches                  = []

  classification_values = [
    "CriticalUpdates",
  ]

  msrc_severity_values = [
    "Critical",
  ]
}
