output "patch_baseline_id" {
  description = "The physical ID of the Patch Baseline"
  value = element(
    coalescelist(
      aws_ssm_patch_baseline.patch_baseline_no_exclusion.*.id,
      aws_ssm_patch_baseline.patch_baseline_with_exclusion.*.id,
      [""],
    ),
    0,
  )
}

