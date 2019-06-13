ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/komodo/config/BoardConfigQcom.mk
endif

include vendor/komodo/config/BoardConfigKernel.mk

include vendor/komodo/config/BoardConfigSoong.mk
