MODDIR=${0%/*}
TARGET_PATH=""
SUPPORT="0"
CHECK="/product/etc
/vendor/etc"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    TARGET_PATH="$path/device_features"
    sed -i 's/description=/description=[🥰]Working. This module is just right for you! /g' $MODDIR/module.prop
    SUPPORT="1"
    break
  fi
done
  if [[ $SUPPORT == "0" ]]; then
    sed -i 's/description=/description=[🤨]Your device is unsupported. This module will NOT work for you! /g' $MODDIR/module.prop
    exit
  fi
CHANGE=$MODDIR/system/$TARGET_PATH
mkdir -p $CHANGE
rm $CHANGE/*
cp -f $TARGET_PATH/* $CHANGE/
sed -i 's/"support_ota_validate">true</"support_ota_validate">false</g' $CHANGE/*.xml