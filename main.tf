/**
 * # aws-terraform-patch_baseline
 *
 *This module creates a Systems Manager patch baseline for the specified Operating System.
 *
 *## Basic Usage
 *
 *```
 *module "patch_baseline_amazon_linux" {
 *  source             = "git@github.com:rackspace-infrastructure-automation/aws-terraform-patch_baseline.git?ref=v0.0.1"
 *  approve_after_days = "3"
 *  approved_patches   = []
 *
 *   baseline_name = "CircleCI-Test-Baseline-AmazonLinux-${random_string.r_string.result}"
 *
 *   description = "Patch Baseline Test - Created with Terraform"
 *
 *   enable_exclusions = true
 *   excluded_key      = "CLASSIFICATION"
 *   excluded_values   = ["Newpackage"]
 *
 *   operating_system = "AMAZON_LINUX"
 *   product_values   = ["AmazonLinux2017.09"]
 *
 *   rejected_patches                  = []
 *   compliance_level                  = "CRITICAL"
 *   approved_patches_compliance_level = "CRITICAL"
 *
 *   classification_values = [
 *     "Security",
 *   ]
 *
 *   severity_values = [
 *     "Critical",
 *   ]
 * }
 *```
 *
 * Full working references are available at [examples](examples)
 */
locals {
  patch_filter_one_key_list = {
    WINDOWS                 = "CLASSIFICATION"
    AMAZON_LINUX            = "CLASSIFICATION"
    AMAZON_LINUX_2          = "CLASSIFICATION"
    UBUNTU                  = "SECTION"
    CENTOS                  = "CLASSIFICATION"
    REDHAT_ENTERPRISE_LINUX = "CLASSIFICATION"
  }

  patch_filter_two_key_list = {
    WINDOWS                 = "MSRC_SEVERITY"
    AMAZON_LINUX            = "SEVERITY"
    AMAZON_LINUX_2          = "SEVERITY"
    UBUNTU                  = "PRIORITY"
    CENTOS                  = "SEVERITY"
    REDHAT_ENTERPRISE_LINUX = "SEVERITY"
  }

  patch_filter_one_key = "${local.patch_filter_one_key_list[var.operating_system]}"
  patch_filter_two_key = "${local.patch_filter_two_key_list[var.operating_system]}"

  patch_filter_one_value_list = {
    CLASSIFICATION = ["${var.classification_values}"]
    SECTION        = ["${var.section_values}"]
  }

  patch_filter_one_chosen_value = "${local.patch_filter_one_value_list[local.patch_filter_one_key]}"

  patch_filter_two_value_list = {
    MSRC_SEVERITY = ["${var.msrc_severity_values}"]
    SEVERITY      = ["${var.severity_values}"]
    PRIORITY      = ["${var.priority_values}"]
  }

  patch_filter_two_chosen_value = "${local.patch_filter_two_value_list[local.patch_filter_two_key]}"
}

resource "aws_ssm_patch_baseline" "patch_baseline_with_exclusion" {
  count                             = "${var.enable_exclusions ? 1 : 0}"
  name                              = "${var.baseline_name}"
  description                       = "${var.description}"
  operating_system                  = "${var.operating_system}"
  approved_patches_compliance_level = "${var.approved_patches_compliance_level}"
  approved_patches                  = ["${var.approved_patches}"]
  rejected_patches                  = ["${var.rejected_patches}"]

  global_filter {
    key    = "${var.excluded_key}"
    values = ["${var.excluded_values}"]
  }

  approval_rule {
    approve_after_days = "${var.approve_after_days}"

    patch_filter {
      key    = "${local.patch_filter_one_key_list[var.operating_system]}"
      values = ["${local.patch_filter_one_chosen_value}"]
    }

    patch_filter {
      key    = "${local.patch_filter_two_key_list[var.operating_system]}"
      values = ["${local.patch_filter_two_chosen_value}"]
    }

    patch_filter {
      key    = "PRODUCT"
      values = ["${var.product_values}"]
    }

    compliance_level = "${var.compliance_level}"
  }
}

resource "aws_ssm_patch_baseline" "patch_baseline_no_exclusion" {
  count                             = "${var.enable_exclusions ? 0 : 1}"
  name                              = "${var.baseline_name}"
  description                       = "${var.description}"
  operating_system                  = "${var.operating_system}"
  approved_patches_compliance_level = "${var.approved_patches_compliance_level}"
  approved_patches                  = ["${var.approved_patches}"]
  rejected_patches                  = ["${var.rejected_patches}"]

  approval_rule {
    approve_after_days = "${var.approve_after_days}"

    patch_filter {
      key    = "${local.patch_filter_one_key_list[var.operating_system]}"
      values = ["${local.patch_filter_one_chosen_value}"]
    }

    patch_filter {
      key    = "${local.patch_filter_two_key_list[var.operating_system]}"
      values = ["${local.patch_filter_two_chosen_value}"]
    }

    patch_filter {
      key    = "PRODUCT"
      values = ["${var.product_values}"]
    }

    compliance_level = "${var.compliance_level}"
  }
}
