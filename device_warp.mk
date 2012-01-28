ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/warp/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

$(call inherit-product-if-exists, vendor/zte/warp/warp-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/warp/overlay

PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/warp/prebuilt/keylayout/arthur_keypad.kl:system/usr/keylayout/arthur_keypad.kl

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    gralloc.warp \
    copybit.warp \
    gps.warp \
    lights.warp \
    sensors.warp \
    libOmxCore \
    libOmxVidEnc \
    abtfilt \
    dexpreopt

# Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/zte/warp/boot/ueventd.rc:root/ueventd.rc \
    device/zte/warp/boot/init.arthur.rc:root/init.arthur.rc

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# fstab
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/warp//prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/zte/warp/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/warp/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/warp/prebuilt/bin/hostapd:system/bin/hostapd \
    device/zte/warp/prebuilt/lib/libwpa_client.so:system/lib/libwpa_client.so \
    device/zte/warp/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    device/zte/warp/prebuilt/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    device/zte/warp/prebuilt/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    device/zte/warp/prebuilt/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    device/zte/warp/prebuilt/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf 

# Camera
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    device/zte/warp/prebuilt/lib/libcamera_client.so:system/lib/libcamera_client.so \
    device/zte/warp/prebuilt/lib/libcameraservice.so:system/lib/libcameraservice.so \
    device/zte/warp/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/zte/warp/prebuilt/lib/libmmipl.so:system/lib/libmmipl.so \
    device/zte/warp/prebuilt/lib/libmmjpeg.so:system/lib/libmmjpeg.so

#audio
PRODUCT_COPY_FILES+= \
    device/zte/warp/prebuilt/lib/libaudio.so:system/lib/libaudio.so \
    device/zte/warp/prebuilt/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so

#Camera
PRODUCT_COPY_FILES+= \
    device/zte/warp/prebuilt/lib/libaudio.so:system/lib/libaudio.so

#RIL
PRODUCT_COPY_FILES+= \
    device/zte/warp/prebuilt/lib/libril.so:system/lib/libril.so \
    device/zte/warp/prebuilt/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so
    

# 3D
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    device/zte/warp/prebuilt/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    device/zte/warp/prebuilt/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    device/zte/warp/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/zte/warp/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/zte/warp/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/zte/warp/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/zte/warp/prebuilt/lib/libgsl.so:system/lib/libgsl.so

# OMX libraries
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    device/zte/warp/prebuilt/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/zte/warp/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/zte/warp/prebuilt/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
    device/zte/warp/prebuilt/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/zte/warp/prebuilt/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/zte/warp/prebuilt/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/zte/warp/prebuilt/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/zte/warp/prebuilt/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/zte/warp/prebuilt/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    device/zte/warp/prebuilt/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    device/zte/warp/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/zte/warp/prebuilt/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/zte/warp/prebuilt/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/zte/warp/prebuilt/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    device/zte/warp/prebuilt/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/zte/warp/prebuilt/lib/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so \
    device/zte/warp/prebuilt/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    device/zte/warp/prebuilt/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so

# Fix Logcat / Misc
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/lib/liblog.so:system/lib/liblog.so \
    device/zte/warp/prebuilt/bin/logcat:system/bin/logcat \
    device/zte/warp/prebuilt/bin/logwrapper:system/bin/logwrapper \
    device/zte/warp/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/zte/warp/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/zte/warp/prebuilt/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    device/zte/warp/prebuilt/etc/hosts:system/etc/hosts \
    device/zte/warp/prebuilt/etc/gps.conf:system/etc/gps.conf

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/lib/modules/libra.ko:system/lib/modules/libra.ko \
    device/zte/warp/prebuilt/lib/modules/libra_ftm.ko:system/lib/modules/libra_ftm.ko
    device/zte/warp/prebuilt/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko


#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/warp/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
    device/zte/warp/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
    device/zte/warp/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
    device/zte/warp/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
    device/zte/warp/firmware/wlan/qcom_wlan_nv.bin:system/etc/firmware/wlan/qcom_wlan_nv.bin

#Other firmware files 
PRODUCT_COPY_FILES +=\
    device/zte/warp/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/zte/warp/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/zte/warp/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/zte/warp/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/zte/warp/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/zte/warp/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/zte/warp/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/zte/warp/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/zte/warp/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw 

# 3G PPP
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/etc/ppp/ip-up-vpn:system/etc/ppp/ip-up-vpn 

# SD Card
PRODUCT_COPY_FILES += \
    device/zte/warp/prebuilt/etc/vold.fstab:system/etc/vold.fstab


# LDPI assets
PRODUCT_LOCALES += ldpi mdpi
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	ro.sf.hwrotation=180


# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# XXX: We might enable precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed, but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

# warp uses medium-density artwork where available
PRODUCT_LOCALES += mdpi

# Google ClientBase
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-zte\
    ro.com.google.clientidbase.yt=android-zte\
    ro.com.google.clientidbase.am=android-zte\
    ro.com.google.clientidbase.ms=android-zte\
    ro.com.google.clientidbase.gmm=android-zte


PRODUCT_NAME := full_warp
PRODUCT_BRAND := zte
PRODUCT_DEVICE := warp
PRODUCT_MODEL := N860
PRODUCT_MANUFACTURER := zte
