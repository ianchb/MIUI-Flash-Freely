MODDIR=${0%/*}
TARGET_PATH="/product/etc/device_features"
CHANGE=$MODDIR/system/$TARGET_PATH
mkdir -p $CHANGE
rm $CHANGE/*
cp -f $TARGET_PATH/* $CHANGE/
sed -i 's/"support_ota_validate">true</"support_ota_validate">false</g' $CHANGE/*.xml
ui_print "**Key support_ota_validate changed successfully.**"
