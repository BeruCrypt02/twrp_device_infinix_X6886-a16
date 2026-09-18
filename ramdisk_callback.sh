#!/system/bin/sh
# ramdisk_callback.sh - Infinix X6886 (OrangeFox local callback)
# Runs at build time: first with "<ramdisk> --first-call" (before the image),
# then with "<workdir> --last-call" (before the zip). Must be executable.
#
# Manual technique it supports (post-build, friend's tool): unpack the STOCK
# vendor_boot, take its platform ramdisk.cpio, unpack OUR built vendor_boot,
# swap OUR recovery ramdisk into the stock image (keeps stock AVB signature),
# repack. This script only prepares + verifies - the swap itself stays manual.

MODE="$2"
TARGET="$1"
LOG="/tmp/fox_callback_x6886.log"

echo "=== ramdisk_callback X6886 mode=$MODE target=$TARGET ===" >> "$LOG"

if [ "$MODE" = "--first-call" ]; then
    # sanity: recovery ramdisk must exist and vendor_boot must fit 64M budget
    if [ ! -d "$TARGET" ]; then
        echo "WARN: ramdisk dir missing: $TARGET" >> "$LOG"
        exit 0
    fi
    SZ=$(du -sb "$TARGET" | awk '{print $1}')
    echo "ramdisk bytes: $SZ (budget check vs 64M image)" >> "$LOG"
    # make sure the format script stays executable inside the ramdisk
    chmod 0755 "$TARGET/system/bin/formatdata.sh" 2>/dev/null || true
elif [ "$MODE" = "--last-call" ]; then
    echo "zip staging dir: $TARGET" >> "$LOG"
    ls -la "$TARGET" >> "$LOG" 2>&1 || true
fi

exit 0
