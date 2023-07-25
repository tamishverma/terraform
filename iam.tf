provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "myuser" {
    name = "tverma"
}

resource "aws_iam_policy" "mckinseypolicy"{
    name = "EC2GLACIEREFS"

    policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"elasticfilesystem:DescribeBackupPolicy",
				"ec2:GetIpamResourceCidrs",
				"glacier:AbortMultipartUpload",
				"ec2:GetIpamPoolCidrs",
				"ec2:GetInstanceUefiData",
				"elasticfilesystem:DescribeReplicationConfigurations",
				"glacier:GetVaultAccessPolicy",
				"ec2:GetEbsEncryptionByDefault",
				"ec2:ExportClientVpnClientConfiguration",
				"ec2:GetHostReservationPurchasePreview",
				"elasticfilesystem:DescribeAccountPreferences",
				"ec2:GetConsoleScreenshot",
				"glacier:ListParts",
				"ec2:GetLaunchTemplateData",
				"ec2:GetSerialConsoleAccessStatus",
				"elasticfilesystem:ClientMount",
				"ec2:GetEbsDefaultKmsKeyId",
				"glacier:PurchaseProvisionedCapacity",
				"ec2:GetIpamDiscoveredResourceCidrs",
				"glacier:InitiateJob",
				"ec2:GetManagedPrefixListEntries",
				"glacier:ListTagsForVault",
				"glacier:DeleteVault",
				"ec2:CreateTags",
				"glacier:DeleteArchive",
				"ec2:GetNetworkInsightsAccessScopeContent",
				"ec2:GetReservedInstancesExchangeQuote",
				"ec2:GetPasswordData",
				"ec2:GetAssociatedIpv6PoolCidrs",
				"glacier:ListMultipartUploads",
				"glacier:SetVaultNotifications",
				"ec2:GetSpotPlacementScores",
				"glacier:CompleteMultipartUpload",
				"glacier:UploadMultipartPart",
				"ec2:GetAwsNetworkPerformanceData",
				"glacier:GetVaultLock",
				"glacier:ListVaults",
				"ec2:GetIpamDiscoveredAccounts",
				"ec2:GetResourcePolicy",
				"ec2:GetDefaultCreditSpecification",
				"ec2:DeleteTags",
				"elasticfilesystem:ListTagsForResource",
				"glacier:CreateVault",
				"glacier:DescribeVault",
				"ec2:GetCapacityReservationUsage",
				"ec2:GetNetworkInsightsAccessScopeAnalysisFindings",
				"ec2:GetSubnetCidrReservations",
				"glacier:GetVaultNotifications",
				"glacier:DescribeJob",
				"ec2:GetConsoleOutput",
				"glacier:DeleteVaultNotifications",
				"ec2:ExportClientVpnClientCertificateRevocationList",
				"glacier:GetDataRetrievalPolicy",
				"glacier:ListJobs",
				"ec2:GetFlowLogsIntegrationTemplate",
				"elasticfilesystem:DescribeLifecycleConfiguration",
				"glacier:InitiateMultipartUpload",
				"elasticfilesystem:DescribeFileSystemPolicy",
				"glacier:UploadArchive",
				"elasticfilesystem:DescribeFileSystems",
				"elasticfilesystem:DescribeMountTargets",
				"ec2:GetCoipPoolUsage",
				"elasticfilesystem:DescribeAccessPoints",
				"glacier:GetJobOutput",
				"ec2:GetAssociatedEnclaveCertificateIamRoles",
				"ec2:GetIpamAddressHistory",
				"elasticfilesystem:DescribeTags",
				"ec2:GetManagedPrefixListAssociations",
				"glacier:ListProvisionedCapacity",
				"elasticfilesystem:DescribeMountTargetSecurityGroups"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
	name = "attachement"
	users = [aws_iam_user.myuser.name]
	policy_arn = aws_iam_policy.mckinseypolicy.arn
}