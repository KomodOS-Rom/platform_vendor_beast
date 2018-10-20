# Generic product
PRODUCT_NAME := komodo
PRODUCT_BRAND := komodo
PRODUCT_DEVICE := generic

EXCLUDE_SYSTEMUI_TESTS := true

# Cutout control overlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay

# version
include vendor/komodo/config/version.mk

# Props
include vendor/komodo/config/komodo_props.mk

# Packages
include vendor/komodo/config/packages.mk

# Vendor specific init files
$(foreach f,$(wildcard vendor/komodo/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/komodo/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/komodo/prebuilt/common/bin/50-komodo.sh:system/addon.d/50-komodo.sh \
    vendor/komodo/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/komodo/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/komodo/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Markup libs
ifeq ($(TARGET_ARCH),arm64)
    PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/komodo/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so
endif

# priv-app permissions
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/etc/permissions/privapp-permissions-komodo.xml:system/etc/permissions/privapp-permissions-komodo.xml \
    vendor/komodo/prebuilt/common/etc/permissions/privapp-permissions-custom.xml:system/etc/permissions/privapp-permissions-custom.xml \
    vendor/komodo/prebuilt/common/etc/permissions/privapp-permissions-elgoog.xml:system/etc/permissions/privapp-permissions-elgoog.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/komodo/overlay/common \
    vendor/komodo/overlay/themes

# Lawnchair
PRODUCT_PACKAGES += Lawnchair
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/komodo/prebuilt/common/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Bootanimation
$(call inherit-product, vendor/komodo/config/bootanimation.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.potato.overlay.lawnconf

# Substratum Key
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/priv-app/SubstratumKey.apk:system/priv-app/SubstratumKey/SubstratumKey.apk

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/komodo/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Versioning
include vendor/komodo/config/version.mk

# Omni Poor Man Themes
PRODUCT_PACKAGES += \
    ContactsTheme \
    DocumentsUITheme \
    DialerTheme \
    MessagesTheme \
    PhonographTheme \
    TelecommTheme

PRODUCT_PACKAGES += \
    NotificationsXtended \
    NotificationsBlack \
    NotificationsDark \
    NotificationsLight \
    NotificationsPrimary

PRODUCT_PACKAGES += \
    AccentSyberia \
    AccentSluttyPink \
    AccentPixel \
    AccentGoldenShower \
    AccentDeepOrange \
    AccentMisticBrown \
    AccentOmni \
    AccentWhite \
    AccentTeal \
    AccentFromHell \
    AccentBlueMonday \
    AccentSmokingGreen \
    AccentDeadRed \
    AccentRottenOrange \
    AccentDeepPurple \
    AccentBlackMagic \
    AccentPurple

 PRODUCT_PACKAGES += \
    PrimaryAlmostBlack \
    PrimaryBlack \
    PrimaryXtended \
    PrimaryXtendedClear \
    PrimaryEyeSoother \
    PrimaryOmni \
    PrimaryWhite \
    PrimaryColdWhite \
    PrimaryWarmWhite \
    PrimaryDarkBlue \
    PrimaryViolator \
    PrimaryTealMeal

# Props
include vendor/komodo/config/komodo_props.mk

# Sounds
include vendor/komodo/config/sounds.mk

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
