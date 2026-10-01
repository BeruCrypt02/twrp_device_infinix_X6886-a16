# OrangeFox device tree - Infinix HOT 60 Pro+ (X6886)

- SoC: MediaTek MT6789 (Helio G200), arm64
- Android: 16 (BP2A.250605.031.A3, Baklava, API 36)
- Recovery: vendor_boot-as-recovery, header v4, LZ4 ramdisk
- Slots: Virtual A/B with vendor ramdisk, dynamic partitions (erofs)
- Crypto: FBE v2 (fscrypt policy 2), Trustonic TEE via keymint 3.0 + gatekeeper,
  TWRP talks keymaster 4.1 API (forced via TW_FORCE_KEYMASTER_VER + system.prop)
- Screen: 1080x2400 portrait_hdpi, 120Hz, punch-hole notch
- Kernel: prebuilt dtb.img only (P7-safe). NEVER ship kernel/blobs here.

## P7 rule (Transsion anti-crack) - read first

NEVER flash unsigned vendor_boot/boot. Install path is ramdisk-swap only:
unpack STOCK vendor_boot + OUR build, swap OUR recovery ramdisk into STOCK
image (keeps stock signature), flash that. Keep stock images for unbrick.

## Build (fox_16.0 manifest) - vendor_boot image, NOT recovery image

./orangefox_sync.sh --branch 16.0 --path ~/fox_16.0
source build/envsetup.sh
lunch twrp_X6886-bp2a-eng
mka adbd vendorbootimage

## Official checklist (outside tree)

1. Unofficial build + XDA thread, 4 weeks community soak
2. Full test suite with logs (flash stock+custom, backup/restore, OTG, themes)
3. Apply for maintainership, Beta 14 days, then Stable via FoxBox
