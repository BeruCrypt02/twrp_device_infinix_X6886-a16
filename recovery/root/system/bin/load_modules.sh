#!/system/bin/sh
# load vendor_boot recovery modules in dump order
while read m; do
  [ -f /lib/modules/$m ] && insmod /lib/modules/$m 2>/dev/null
done < /lib/modules/modules.load.recovery
