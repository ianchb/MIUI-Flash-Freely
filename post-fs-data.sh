MODDIR=${0%/*}
TARGET_PATH=""
CHECK="/product/etc
/vendor/etc"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    TARGET_PATH="$path/device_features"
    break
  fi
done
CHANGE=$MODDIR/system/$TARGET_PATH
mkdir -p $CHANGE
rm $CHANGE/*
if [ ! -f $MODDIR/../maodf.marker ]; then
    cp -f $TARGET_PATH/* $CHANGE/
    touch $MODDIR/../mff.marker
else
    cp -f $MODDIR/../MIUI_AOD_Freely/system/$TARGET_PATH/* $CHANGE/
    rm -f $MODDIR/../maodf.marker
fi
sed -i 's/"support_ota_validate">true</"support_ota_validate">false</g' $CHANGE/*.xml
