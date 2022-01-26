FDEVICE="a7y17lte"
FOX_BUILD_LOG_FILE="/home/stahoo/log.txt"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

    export FOX_VERSION=R11.1
    export OF_MAINTAINER="ZakosiliMiPeCeta"
    export FOX_BUILD_TYPE="Beta"

    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

    export OF_DEVICE_WITHOUT_PERSIST=1
    export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/SYSTEM"
    export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/BOOT"
    export OF_TARGET_DEVICES="a7y17lte"
    export FOX_USE_LZMA_COMPRESSION=1

    export OF_USE_TWRP_SAR_DETECT=1
    export OF_DISABLE_DM_VERITY=1
    export OF_DISABLE_FORCED_ENCRYPTION=1
    export OF_SKIP_FBE_DECRYPTION=1


    export FOX_USE_NANO_EDITOR=1
    export FOX_USE_BASH_SHELL=1
    export FOX_DELETE_AROMAFM=1
    export OF_ALLOW_DISABLE_NAVBAR=1
    export FOX_ADVANCED_SECURITY=1
    export OF_NO_SPLASH_CHANGE=1
    export OF_FL_PATH1="/sbin/flashlight"
    export OF_FL_PATH2=""

    export OF_RUN_POST_FORMAT_PROCESS=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
    export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

    export OF_QUICK_BACKUP_LIST="/boot;/system_image;/data;/efs;"
    export OF_RUN_POST_FORMAT_PROCESS=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi

  	for var in eng user userdebug; do
  		add_lunch_combo omni_"$FDEVICE"-$var
  	done
fi
