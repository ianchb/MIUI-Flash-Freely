MODDIR=${0%/*}

TARGET_PATH=""
POSSIBLE_LIST="
/product/etc
/vendor/etc
/system/etc
"
for path in $POSSIBLE_LIST; do
  if [[ -d $path/device_features/ ]]; then
    TARGET_PATH=$path
  fi
done
if [ "$TARGET_PATH" == "" ]; then
  ui_print "**Error: File Not Found. Unsupported device?**"
  exit
else
  TARGET_PATH=$path/device_features
fi
CHANGE=$MODDIR/system/$TARGET_PATH
mkdir -p $CHANGE
rm $CHANGE/*
cp -f $TARGET_PATH/* $CHANGE/
sed -i 's/"support_ota_validate">true</"support_ota_validate">false</g' $CHANGE/*.xml
ui_print "**Key support_ota_validate changed successfully.**"
