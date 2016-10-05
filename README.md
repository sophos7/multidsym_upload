# Overview
This Bash script uploads multiple dSYM files to New Relic for iOS Crash Reporting.

It can be tedious to [manually upload](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/install-configure/ios-agent-crash-reporting#manual-dsym) multiple dSYMs to New Relic for crash symbolication. This is especially true when you have multiple builds with several frameworks, all of which have their own dSYM files. This script is meant to simplify the upload process.

# How to use
Run script with following variables
`./multidsym_upload.sh "App Name" AppKeyNumber FolderWithDSYMs`

**"App Name"** = Name of your application in New Relic.
  *note: App names with spaces must be wrapped in quotes*

**AppKeyNumber** = The 42 character Application token for your app

**FolderWithDSYMs** = Path to folder containing dSYM files to be uploaded

# Troubleshooting

A log file is created at `/tmp/upload_dSYM_log.txt`

# Disclaimer
This script is offered for use as-is without warranty. You are free to use and modify as needed. It has been created for use with New Relic crash reporting to simplify the dSYM upload process but is not a supported product of New Relic.
