ui_print "- Checking if specific path exists"
CHECK="/product/etc
/vendor/etc"
SUPPORT="0"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    ui_print "- Found specific path"
    SUPPORT="1"
    break
  else
    ui_print "! Path $path/device_features was not found"
    ui_print "- Trying another possible one."
  fi
done
if [[ $SUPPORT == "0" ]]; then
  abort "! Error: Unsupported device!"
else
  ui_print "- A reboot is needed to check the status."
fi