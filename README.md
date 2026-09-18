# OrangeFox Recovery - Infinix HOT 60 Pro+ (X6886)

Custom recovery device tree for the Infinix HOT 60 Pro+ (Transsion, MT6789).

## Device specs

| | |
|---|---|
| Device | Infinix HOT 60 Pro+ (X6886 / X6886-OP) |
| Codename | X6886 (Baklava) |
| SoC | MediaTek Helio G200 (MT6789) |
| CPU | 2x Cortex-A76 @ 2.2GHz + 6x Cortex-A55 @ 2.0GHz |
| GPU | Mali-G57 MC2 |
| RAM | 8 GB LPDDR4X |
| Storage | UFS 2.2 |
| Display | 1080x2400, 20:9, punch-hole, 60/90/120/144Hz |
| Touch | mtk-tpd 2401x1081 |
| Fingerprint | Goodix (under display) |
| OS | Android 16 (API 36), Virtual A/B, FBE v2 |
| Kernel | 6.12 (GKI), keymaster 7.0, Trustonic TEE (KeyMint 3.0 AIDL) |
| Recovery type | vendor_boot-as-recovery (header v4, no dedicated partition) |

## Build (OrangeFox fox_12.1)

```bash
# sync minimal OrangeFox manifest, then place this tree at:
device/infinix/X6886

source build/envsetup.sh
lunch ofox_X6886-bp2a-eng
mka recoveryimage
```

Build vars live in `vendorsetup.sh` (never in BoardConfig.mk).
Output must fit the 64MB vendor_boot partition.

## Install

Do NOT flash a fully rebuilt unsigned image on this device (see P7 note).
The supported path is the ramdisk-swap technique: unpack the STOCK vendor_boot,
swap in the built recovery ramdisk (keeps the stock signature), flash that.
Keep stock boot + vendor_boot images around for unbrick.

## P7 warning (Transsion Anti-Crack)

Flashing unsigned full images trips the P7 watchdog: red
"Error!! Unauthorized Repair!!!" screen and a deliberate soft-brick.
Never patch vbmeta or disable verity on this device.

## Status

Working:
- Tree structure, BoardConfig, fstab (from stock), vintf, init rc set
- TEE stack (KeyMint 3.0 / gatekeeper AIDL), 252 kernel modules, touch firmware
- formatdata.sh wired on both TWRP and OrangeFox triggers

TODO / to verify on first boot:
- Decrypt with password (keymaster 7.0 configured, needs log confirmation)
- Touch orientation, brightness path, flashlight paths
- Battery temp path, vibrator, MTP/USB-OTG
- Custom splash (kept stock-safe for now)

## Sources

- Stock dump (kernel/DTB/blobs/fstab): `Il103/android_dump_infinix_x6886` (branch a16)
- On-device kernel builds are NOT used (modified kernel on unit)
- Reference: same-SoC trees for MT6789

## Credits

- Maintainer: B E R U
- OrangeFox Recovery Project, TWRP team
