ui_print "**************************"
ui_print "MIUI Flash Freely v1.1.0102"
ui_print "- HEY! If you are using MIUI13"
ui_print "- and the module does not work,"
ui_print "- Please try v2.1.x version!"
ui_print "**************************"
CHECK="/vendor/etc"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    ui_print "- Specific Directory Found!"
  else
    ui_print "- Error: Directory Not Found. Unsupported device?"
    abort "- Notice: Please try v2.1.x version!"
    exit
  fi
done