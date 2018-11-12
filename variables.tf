variable "approve_after_days" {
  description = "The number of days after the release date of each patch matched by the rule the patch is marked as approved in the patch baseline. Max value 100."
  default     = 3
  type        = "string"
}

variable "approved_patches" {
  description = "A list of explicitly approved patches for the baseline."
  default     = []
  type        = "list"
}

variable "approved_patches_compliance_level" {
  description = "The compliance level for optional approved patches. This means that if an optional approved patch is reported as missing, this is the severity of the compliance violation. Valid Values can be found here: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreatePatchBaseline.html#systemsmanager-CreatePatchBaseline-request-ApprovedPatchesComplianceLevel"
  default     = "CRITICAL"
  type        = "string"
}

variable "baseline_name" {
  description = "A name for the patch baseline"
  default     = "Custom-Patch-Baseline"
  type        = "string"
}

variable "classification_values" {
  description = "Install patches that match the selected CLASSIFICATION (applies to NON-UBUNTU OS). Please see https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html for valid CLASSIFICATION values per OS type."
  default     = []
  type        = "list"
}

variable "compliance_level" {
  description = "If patches are missing AWS will consider this a ______ problem, and alert accordingly. Valid values can be found here: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchRule.html#systemsmanager-Type-PatchRule-ComplianceLevel"
  default     = "CRITICAL"
  type        = "string"
}

variable "description" {
  description = "Patch baseline description"
  default     = "Created with Terraform"
  type        = "string"
}

variable "enable_exclusions" {
  description = "Enable patch baseline global patch filters (exclusions). If set to true, excluded_key and excluded_values must be set."
  default     = false
  type        = "string"
}

variable "excluded_key" {
  description = "The key for the filter. Valid keys per OS can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html"
  default     = ""
  type        = "string"
}

variable "excluded_values" {
  description = "List values for the filter key. Valid values per exclusion key can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html"
  default     = []
  type        = "list"
}

variable "msrc_severity_values" {
  description = "[WINDOWS only] Install patches that match the selected severity level of the selected values. Valid values are: Critical, Important, Moderate, Low, Unspecified."
  default     = ["Critical"]
  type        = "list"
}

variable "operating_system" {
  description = "Defines the operating system the patch baseline applies to."
  default     = ""
  type        = "string"
}

variable "product_values" {
  description = "Specified product value for the specified OS. Valid lists per OS type can be found in this documentation: https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_PatchFilter.html"
  type        = "list"
}

variable "priority_values" {
  description = "[UBUNTU only] Install patches that match the priority level of the selected value. Valid values are Required, Important, Standard, Optional, Extra."
  default     = []
  type        = "list"
}

variable "rejected_patches" {
  description = "A list of explicitly rejected patches for the baseline."
  default     = []
  type        = "list"
}

variable "section_values" {
  description = "(UBUNTU only) All packages for the selected package group will be installed as long as they meet your Patch Priority Value. Valid values are All, libs, libdevel, python, doc, debug, translations, devel, admin, oldlibs, text, utils, net, web, gnome, pearl, cli-mono, universe/net, x11, universe/utils, universe/python"
  default     = []
  type        = "list"
}

variable "severity_values" {
  description = "[AMAZON_LINUX, AMAZON_LINUX2, CENTOS, and REDHAT_ENTERPRISE_LINUX only] Install patches that match the selected severity level of the selected values. Valid values are: Critical, Important, Medium, Low for AMAZON_LINUX, AMAZON_LINUX2, CENTOS, and REDHAT_ENTERPRISE_LINUX. None is also a valid value for CENTOS, and REDHAT_ENTERPRISE_LINUX only"
  default     = []
  type        = "list"
}
