# OrangeFox device tree - Infinix HOT 60 Pro+ (X6886)

## Device specifications

Device                  | Infinix HOT 60 Pro+
-----------------------:|:-------------------------------------
Codename                | X6886
SoC                     | MediaTek Helio G200 (MT6789)
CPU                     | Octa-core (2x2.20 GHz Cortex-A76 & 6x2.00 GHz Cortex-A55)
GPU                     | Mali-G57 MC2
Memory                  | 8 GB RAM
Shipped Android Version | 16 (XOS 16)
Storage                 | UFS 2.2
Battery                 | 5160 mAh
Display                 | 1080 x 2400, 144Hz
Recovery                | vendor_boot as recovery (header v4)

## Features

First boot testing in progress:

- [ ] ADB
- [ ] Decryption
- [ ] Display
- [ ] Fastbootd
- [ ] Flashing
- [ ] MTP
- [ ] Sideload
- [ ] Touchscreen
- [ ] Flashlight

## Building

Full guide: https://wiki.orangefox.tech/en/dev/building

```
lunch twrp_X6886-bp2a-eng && mka adbd vendorbootimage
```

## Credits

- OrangeFox Recovery Project: https://gitlab.com/OrangeFox
- TeamWin (TWRP): https://github.com/TeamWin
- YF-Marco for build guidance

## License

    SPDX-License-Identifier: GPL-3.0-or-later
    Copyright (C) 2026 BeruCrypt02

This tree ships no proprietary blobs. All binaries come from the stock dump
and stay property of their respective owners.

Full license text: https://www.gnu.org/licenses/gpl-3.0.html
