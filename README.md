# OrangeFox device tree - Infinix HOT 60 Pro+ (X6886)

- SoC: MediaTek MT6789 (Helio G200), arm64
- Android: 16 (BP2A.250605.031.A3, Baklava, API 36)
- Recovery: vendor_boot-as-recovery, header v4, LZ4 ramdisk
- Slots: Virtual A/B with vendor ramdisk, dynamic partitions (erofs)
- Crypto: FBE v2 (fscrypt policy 2), Trustonic TEE via keymint 3.0 + gatekeeper
- Screen: 1080x2400 portrait_hdpi, 120Hz, punch-hole notch
- Kernel: prebuilt dtb.img only. Don't ship kernel/blobs here
