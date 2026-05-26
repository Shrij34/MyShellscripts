Jenkins Log Collector Script

Overview

This script collects logs from Jenkins jobs that ran today and uploads them to an AWS S3 bucket. It directly accesses Jenkins' file system, making it efficient and independent of Jenkins API or CLI.

Prerequisites

Jenkins Server Access: The script must run on the Jenkins server with access to $JENKINS_HOME.

AWS CLI Installed: Ensure AWS CLI is installed and configured.

aws configure

JQ Installed (Optional): Not required for this script but useful for JSON processing in Jenkins-related tasks.

Installation

Copy the script to a suitable location on the Jenkins server.

Make it executable:

chmod +x jenkins-log-collector.sh

Ensure the script has access to Jenkins logs (/var/lib/jenkins/jobs).

Configuration

Modify the following variables in the script:

JENKINS_HOME: Set to the Jenkins home directory (default: /var/lib/jenkins).

S3_BUCKET: Replace with your S3 bucket name.

Usage

Run the script manually:

./jenkins-log-collector.sh

Or add it as a scheduled cron job:

0 0 * * * /path/to/jenkins-log-collector.sh

This runs the script daily at midnight.

How It Works

The script loops through Jenkins job directories.

It finds logs of builds that were modified today.

It uploads the logs to an S3 bucket with a structured naming convention (job-name-build-number.log).

Success and failure messages are logged to the console.

Example S3 Output

s3://your-s3-bucket/jobA-123.log
s3://your-s3-bucket/jobB-456.log

Troubleshooting

Permission Denied: Ensure the script has read access to $JENKINS_HOME/jobs/.

AWS CLI Errors: Check AWS credentials using aws configure list.

Logs Not Found: Confirm that Jenkins jobs produced logs today.
