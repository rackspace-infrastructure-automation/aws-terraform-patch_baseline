# aws-terraform-patch_baseline

This module creates a patch baseline for a specific os.

## Basic Usage

```
module "patch_baseline_amazon_linux" {
 source             = "git@github.com:rackspace-infrastructure-automation/aws-terraform-patch_baseline.git?ref=v0.0.1"
 approve_after_days = "3"
 approved_patches   = []

  baseline_name = "CircleCI-Test-Baseline-AmazonLinux-${random_string.r_string.result}"

  description = "Patch Baseline Test - Created with Terraform"

  enable_exclusions = true
  excluded_key      = "CLASSIFICATION"
  excluded_values   = ["Newpackage"]

  operating_system = "AMAZON_LINUX"
  product_values   = ["AmazonLinux2017.09"]

  rejected_patches                  = []
  compliance_level                  = "CRITICAL"
  approved_patches_compliance_level = "CRITICAL"

  classification_values = [
    "Security",
  ]

  severity_values = [
    "Critical",
  ]
}
```

Full working references are available at [examples](examples)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| approve_after_days | The number of days after the release date of each patch matched by the rule the patch is marked as approved in the patch baseline. Max value 100. | string | `3` | no |
| approved_patches | A list of explicitly approved patches for the baseline. | list | `<list>` | no |
| approved_patches_compliance_level | The compliance level for optional approved patches. This means that if an optional approved patch is reported as missing, this is the severity of the compliance violation. Valid Values can be found here: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreatePatchBaseline.html#systemsmanager-CreatePatchBaseline-request-ApprovedPatchesComplianceLevel | string | `CRITICAL` | no |
| baseline_name | A name for the patch baseline | string | `Custom-Patch-Baseline` | no |
| classification_values | Install patches that match the selected CLASSIFICATION (applies to NON-UBUNTU OS). Please see https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html for valid CLASSIFICATION values per OS type. | list | `<list>` | no |
| compliance_level | If patches are missing AWS will consider this a ______ problem, and alert accordingly. Valid values can be found here: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchRule.html#systemsmanager-Type-PatchRule-ComplianceLevel | string | `CRITICAL` | no |
| description | Patch baseline description | string | `Created with Terraform` | no |
| enable_exclusions | Enable patch baseline global patch filters (exclusions). If set to true, excluded_key and excluded_values must be set. | string | `false` | no |
| excluded_key | The key for the filter. Valid keys per OS can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html | string | `` | no |
| excluded_values | List values for the filter key. Valid values per exclusion key can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html | list | `<list>` | no |
| msrc_severity_values | [WINDOWS only] Install patches that match the selected severity level of the selected values. Valid values are: Critical, Important, Moderate, Low, Unspecified. | list | `<list>` | no |
| operating_system | Defines the operating system the patch baseline applies to. | string | `` | no |
| priority_values | [UBUNTU only] Install patches that match the priority level of the selected value. Valid values are Required, Important, Standard, Optional, Extra. | list | `<list>` | no |
| product_values | Specified product value for the specified OS. Valid lists per OS type can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html | list | - | yes |
| rejected_patches | A list of explicitly rejected patches for the baseline. | list | `<list>` | no |
| section_values | (UBUNTU only) All packages for the selected package group will be installed as long as they meet your Patch Priority Value. Valid values are All, libs, libdevel, python, doc, debug, translations, devel, admin, oldlibs, text, utils, net, web, gnome, pearl, cli-mono, universe/net, x11, universe/utils, universe/python | list | `<list>` | no |
| severity_values | [AMAZON_LINUX, AMAZON_LINUX2, CENTOS, and REDHAT_ENTERPRISE_LINUX only] Install patches that match the selected severity level of the selected values. Valid values are: Critical, Important, Medium, Low for AMAZON_LINUX, AMAZON_LINUX2, CENTOS, and REDHAT_ENTERPRISE_LINUX. None is also a valid value for CENTOS, and REDHAT_ENTERPRISE_LINUX only | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| patch_baseline_id | The physical ID of the Patch Baseline |
