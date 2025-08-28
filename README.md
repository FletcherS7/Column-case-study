# Column-case-study

## Local Testing
Installomator can be run locally to install/update Firefox using command:
`sudo ./Installomator.sh firefoxpkg DEBUG=0 INSTALL="force"`

To do a dry run and not impact the current install of Firefox, set the DEBUG value to 2.


<details>
<summary>Example Output</summary>
  
```
2025-08-28 10:16:47 : INFO  : firefoxpkg : setting variable from argument DEBUG=0
2025-08-28 10:16:47 : INFO  : firefoxpkg : Total items in argumentsArray: 1
2025-08-28 10:16:47 : INFO  : firefoxpkg : argumentsArray: DEBUG=0
2025-08-28 10:16:47 : REQ   : firefoxpkg : ################## Start Installomator v. 10.8beta, date 2025-03-28
2025-08-28 10:16:47 : INFO  : firefoxpkg : ################## Version: 10.8beta
2025-08-28 10:16:47 : INFO  : firefoxpkg : ################## Date: 2025-03-28
2025-08-28 10:16:47 : INFO  : firefoxpkg : ################## firefoxpkg
2025-08-28 10:16:47 : INFO  : firefoxpkg : SwiftDialog is not installed, clear cmd file var
2025-08-28 10:16:48 : INFO  : firefoxpkg : Reading arguments again: DEBUG=0
2025-08-28 10:16:48 : INFO  : firefoxpkg : BLOCKING_PROCESS_ACTION=tell_user
2025-08-28 10:16:48 : INFO  : firefoxpkg : NOTIFY=success
2025-08-28 10:16:48 : INFO  : firefoxpkg : LOGGING=INFO
2025-08-28 10:16:48 : INFO  : firefoxpkg : LOGO=/System/Applications/App Store.app/Contents/Resources/AppIcon.icns
2025-08-28 10:16:48 : INFO  : firefoxpkg : Label type: pkg
2025-08-28 10:16:48 : INFO  : firefoxpkg : archiveName: Firefox.pkg
2025-08-28 10:16:48 : INFO  : firefoxpkg : name: Firefox, appName: Firefox.app
2025-08-28 10:16:48 : WARN  : firefoxpkg : No previous app found
2025-08-28 10:16:48 : WARN  : firefoxpkg : could not find Firefox.app
2025-08-28 10:16:48 : INFO  : firefoxpkg : appversion:
2025-08-28 10:16:48 : INFO  : firefoxpkg : Latest version of Firefox is 142.0.1
2025-08-28 10:16:48 : REQ   : firefoxpkg : Downloading https://download.mozilla.org/?product=firefox-pkg-latest-ssl&os=osx&lang=en-US to Firefox.pkg
2025-08-28 10:16:51 : INFO  : firefoxpkg : Downloaded Firefox.pkg – Type is  xar archive compressed TOC – SHA is bcb60db6bf81e5f1eb5a660651eeba8b3ec87db4 – Size is 183760 kB
2025-08-28 10:16:51 : REQ   : firefoxpkg : no more blocking processes, continue with update
2025-08-28 10:16:51 : REQ   : firefoxpkg : Installing Firefox
2025-08-28 10:16:51 : INFO  : firefoxpkg : Verifying: Firefox.pkg
2025-08-28 10:16:51 : INFO  : firefoxpkg : Team ID: 43AQ936H96 (expected: 43AQ936H96 )
2025-08-28 10:16:51 : INFO  : firefoxpkg : Installing Firefox.pkg to /
2025-08-28 10:16:58 : INFO  : firefoxpkg : Finishing...
2025-08-28 10:17:01 : INFO  : firefoxpkg : App(s) found: /Applications/Firefox.app
2025-08-28 10:17:01 : INFO  : firefoxpkg : found app at /Applications/Firefox.app, version 142.0.1, on versionKey CFBundleShortVersionString
2025-08-28 10:17:01 : REQ   : firefoxpkg : Installed Firefox, version 142.0.1
2025-08-28 10:17:01 : INFO  : firefoxpkg : notifying
displaynotification:7: no such file or directory: /usr/local/bin/dialog
2025-08-28 10:17:01 : INFO  : firefoxpkg : Installomator did not close any apps, so no need to reopen any apps.
2025-08-28 10:17:01 : REQ   : firefoxpkg : All done!
2025-08-28 10:17:01 : REQ   : firefoxpkg : ################## End Installomator, exit code 0
```
</details>


The JAMF test extension attribute can be run using the command: 
`sudo ./test_jamf_attribute.sh`


<details>
<summary>Example Output</summary>

```
On Success: <result>needs updating</result>
On Failure: <result>up-to-date</result>
```
</details>

NOTE: Since we are accessing directories outside of the home directory, sudo is required when testing these scripts.

## Add to JAMF
Upload Installomator.sh to scripts repository within JAMF and configure a policy to use this script, then in the Parameter Values section configure with the following values.
<br>
Parameter 4: firefoxpkg<br>
Parameter 5: DEBUG=0<br>
Parameter 6: INSTALL="force"<br>
(Why INSTALL=Force? Since we are planning to use an EA and Smart groups to determine update compliance, we want to bypass Installomaters built in version checking)


Upload test_jamf_attribute.sh to the Computer Extension Attribute section in JAMF by creating a new Computer Extension Attribute and setting the type to script.
