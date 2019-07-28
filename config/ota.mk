# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Unofficial
endif

# Make sure the uppercase is used
ifeq ($(OTA_TYPE),experimental)
OTA_TYPE=Experimental
endif
ifeq ($(OTA_TYPE),official)
OTA_TYPE=Official
endif

# Komodo version
KOMODO_VERSION := KomodOS-$(shell date +"%y%m%d")-$(OTA_TYPE)
DEVICE := $(subst komodo_,,$(TARGET_PRODUCT))

ifneq ($(OTA_TYPE),Unofficial)
# Komodo OTA app
PRODUCT_PACKAGES += \
    XenonOTA

# OTA Configuration
$(shell echo -e "OTA_Configuration\n \
ota_experimental=https://github.com/KomodOS-Rom/OTA/raw/master/ota_$(DEVICE)_beta.xml\n \
ota_official=https://github.com/KomodOS-Rom/OTA/raw/master/ota_$(DEVICE)_official.xml\n \
device_name=ro.komodo.device\n \
release_type=Pie\n \
version_source=ro.komodo.version\n \
version_delimiter=-\n \
version_position=1\n \
version_format=yyMMdd" > $(OTA_DIR)/ota_conf)
endif
