##########
# Policies
##########

resource "aws_iam_policy" "s3_engineering" {
  name        = "S3Engineering"
  description = "Allow writing to Engineering bucket"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectVersionTagging",
                "s3:PutObjectTagging"
            ],
            "Resource": "arn:aws:s3:::com.glenjarvis.demo.engineering/*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucketByTags",
                "s3:GetLifecycleConfiguration",
                "s3:ListBucketMultipartUploads",
                "s3:GetInventoryConfiguration",
                "s3:GetObjectVersionTagging",
                "s3:ListBucketVersions",
                "s3:ListBucket",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:GetObjectVersionTorrent",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:GetObjectTorrent",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetIpConfiguration",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "arn:aws:s3:::com.glenjarvis.demo.engineering/*",
                "arn:aws:s3:::com.glenjarvis.demo.engineering"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:HeadBucket",
                "s3:ListObjects"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
