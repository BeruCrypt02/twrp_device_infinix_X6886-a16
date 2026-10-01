#!/system/bin/sh
# Format userdata + metadata for Infinix X6886 (A16).
# Matches dump fstab: userdata=f2fs FBE v2, metadata=ext4.

LOG=/tmp/formatdata.log
DATA_DEV=/dev/block/by-name/userdata
META_DEV=/dev/block/by-name/metadata
MAKE_F2FS=/system/bin/make_f2fs
MKFS_F2FS=/system/bin/mkfs.f2fs
MAKE_EXT4FS=/system/bin/make_ext4fs
MKE2FS=/system/bin/mke2fs

exec >>"$LOG" 2>&1
echo "=== formatdata $(date) ==="

umount /data 2>/dev/null || true
umount /sdcard 2>/dev/null || true
umount /metadata 2>/dev/null || true

if [ -x /system/bin/dmsetup ]; then
  for n in $(/system/bin/dmsetup ls 2>/dev/null | awk '{print $1}'); do
    echo "dmsetup remove -f $n"
    /system/bin/dmsetup remove -f "$n" 2>/dev/null || true
  done
fi

if [ -b "$META_DEV" ]; then
  if [ -x "$MAKE_EXT4FS" ]; then
    "$MAKE_EXT4FS" -w -S /file_contexts -L metadata "$META_DEV" \
      || dd if=/dev/zero of="$META_DEV" bs=4096 count=32
  elif [ -x "$MKE2FS" ]; then
    "$MKE2FS" -t ext4 -b 4096 -L metadata -F "$META_DEV" \
      || dd if=/dev/zero of="$META_DEV" bs=4096 count=32
  else
    dd if=/dev/zero of="$META_DEV" bs=4096 count=32
  fi
fi

if [ -b "$DATA_DEV" ]; then
  if [ -x "$MAKE_F2FS" ]; then
    "$MAKE_F2FS" -f -d1 -l data -O encrypt,quota,fsverity -s 16 "$DATA_DEV"
  elif [ -x "$MKFS_F2FS" ]; then
    "$MKFS_F2FS" -f -l data -O encrypt,quota,fsverity "$DATA_DEV"
  else
    echo "FATAL: no make_f2fs/mkfs.f2fs"
    exit 1
  fi
fi

echo "=== formatdata done ==="
