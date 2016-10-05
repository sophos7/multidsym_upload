# Overview
This Bash script is for uploading multiple dSYM files to New Relic.

It can be tedious to [manually upload](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/install-configure/ios-agent-crash-reporting#manual-dsym) multiple dSYMs to New Relic for crash symbolication. This is especially true when you have multiple builds with several frameworks. All of which have their own dSYM files. This script is meant to simplify the upload process.

# How to use
Run script with following variable
`./multidsym_upload.sh "App Name" AppKeyNumber FolderWithDSYMs`

**"App Name"** = Name of your application in New Relic.
  *note: App names with spaces must be wrapped in quotes*

**AppKeyNumber** = The 42 character Application token for this app

**FolderWithDSYMs** = Path to folder containing dSYM files to be uploaded

# Troubleshooting

A log file is created at `/tmp/upload_dSYM_log.txt`

# Disclaimer
This scirp is offered for use as-is without warranty. You are free to use and modify as needed. It has been created for use for New Relic crash reporting to simplify the dSYM upload process but is not a supported product of New Relic.
