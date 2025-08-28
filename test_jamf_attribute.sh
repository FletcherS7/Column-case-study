#!/bin/zsh



fileOwner=`stat -f '%Su' /opt/column/test.json 2>/dev/null`
fileGroup=`stat -f '%Sg' /opt/column/test.json 2>/dev/null`
checksum=`shasum -a 256 /opt/column/test.json 2>/dev/null | awk '{print ""$1""}'`

if [[ $fileOwner = 'root' ]] && [[ $fileGroup = 'wheel' ]] && [[ $checksum = 'b2e72f80265e4fc0257bb1712ae24cea17ab46df105a51762d5795ffddae778d' ]]; then
  echo "<result>up-to-date</result>" 
else
  echo "<result>needs updating</result>"
fi