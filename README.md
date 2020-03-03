# aws-terraform-patch\_baseline

This module creates a Systems Manager patch baseline for the specified Operating System.

## Basic Usage

```
module "patch_baseline_amazon_linux" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-patch_baseline.git?ref=v0.0.1"

  approve_after_days                = "3"
  approved_patches                  = []
  compliance_level                   = "CRITICAL"
  approved_patches_compliance_level = "CRITICAL"
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
```

Full working references are available at [examples](examples)

## Module variables

The following module variables changes have occurred:

#### Deprecations
- `baseline_name` - marked for deprecation as it no longer meets our standards.

#### Additions
- `name` - introduced as a replacement for `baseline_name` to better align with our standards.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| approve\_after\_days | The number of days after the release date of each patch matched by the rule the patch is marked as approved in the patch baseline. Max value 100. | `string` | `3` | no |
| approved\_patches | A list of explicitly approved patches for the baseline. | `list` | `[]` | no |
| approved\_patches\_compliance\_level | The compliance level for optional approved patches. This means that if an optional approved patch is reported as missing, this is the severity of the compliance violation. Valid Values can be found here: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreatePatchBaseline.html#systemsmanager-CreatePatchBaseline-request-ApprovedPatchesComplianceLevel | `string` | `"CRITICAL"` | no |
| baseline\_name | A name for the patch baseline. [**Deprecated** in favor of `name`]. It will be removed in future releases. `name` supercedes `baseline_name` when both are set. | `string` | `"Custom-Patch-Baseline"` | no |
| classification\_values | Install patches that match the selected CLASSIFICATION (applies to NON-UBUNTU OS). Please see https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html for valid CLASSIFICATION values per OS type. | `list` | `[]` | no |
| compliance\_level | If patches are missing AWS will consider this a ______ problem, and alert accordingly. Valid values can be found here: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchRule.html#systemsmanager-Type-PatchRule-ComplianceLevel | `string` | `"CRITICAL"` | no |
| description | Patch baseline description | `string` | `"Created with Terraform"` | no |
| enable\_exclusions | Enable patch baseline global patch filters (exclusions). If set to true, excluded\_key and excluded\_values must be set. | `string` | `false` | no |
| excluded\_key | The key for the filter. Valid keys per OS can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html | `string` | `""` | no |
| excluded\_values | List values for the filter key. Valid values per exclusion key can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html | `list` | `[]` | no |
| msrc\_severity\_values | [WINDOWS only] Install patches that match the selected severity level of the selected values. Valid values are: Critical, Important, Moderate, Low, Unspecified. | `list` | <pre>[<br>  "Critical"<br>]</pre> | no |
| name | A name for the patch baseline | `string` | `"Custom-Patch-Baseline"` | no |
| operating\_system | Defines the operating system the patch baseline applies to. | `string` | `""` | no |
| priority\_values | [UBUNTU only] Install patches that match the priority level of the selected value. Valid values are Required, Important, Standard, Optional, Extra. | `list` | `[]` | no |
| product\_values | Specified product value for the specified OS. Valid lists per OS type can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html | `list` | n/a | yes |
| rejected\_patches | A list of explicitly rejected patches for the baseline. | `list` | `[]` | no |
| section\_values | (UBUNTU only) All packages for the selected package group will be installed as long as they meet your Patch Priority Value. Valid values are All, libs, libdevel, python, doc, debug, translations, devel, admin, oldlibs, text, utils, net, web, gnome, pearl, cli-mono, universe/net, x11, universe/utils, universe/python | `list` | `[]` | no |
| severity\_values | [AMAZON\_LINUX, AMAZON\_LINUX2, CENTOS, and REDHAT\_ENTERPRISE\_LINUX only] Install patches that match the selected severity level of the selected values. Valid values are: Critical, Important, Medium, Low for AMAZON\_LINUX, AMAZON\_LINUX2, CENTOS, and REDHAT\_ENTERPRISE\_LINUX. None is also a valid value for CENTOS, and REDHAT\_ENTERPRISE\_LINUX only | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| patch\_baseline\_id | The physical ID of the Patch Baseline |

