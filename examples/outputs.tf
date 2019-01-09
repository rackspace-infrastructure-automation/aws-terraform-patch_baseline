output "patch_baseline_centos_id" {
  description = "Patch Baseline ID for CentOS"
  value       = "${module.patch_baseline_centos.patch_baseline_id}"
}

output "patch_baseline_rhel_id" {
  description = "Patch Baseline ID for RHEL"
  value       = "${module.patch_baseline_centos.patch_baseline_id}"
}

output "patch_baseline_ubuntu_id" {
  description = "Patch Baseline ID for Ubuntu"
  value       = "${module.patch_baseline_centos.patch_baseline_id}"
}

output "patch_baseline_windows_id" {
  description = "Patch Baseline ID for Windows"
  value       = "${module.patch_baseline_centos.patch_baseline_id}"
}
