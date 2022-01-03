ui_print "**************************"
ui_print "MIUI Flash Freely v2.8.0103"
ui_print "**************************"
CHECK="/vendor/etc
/product/etc"
SUPPORT="0"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    ui_print "- Specific Directory Found!"
    SUPPORT="1"
    break
  else
    ui_print "! Warning: Directory $path/device_features Not Found."
    ui_print "- Trying another one."
  fi
done
if [[ $SUPPORT == "0" ]]; then
  abort "! Error: Unsupported device!"
else
  ui_print "- Completed successfully!"
fi