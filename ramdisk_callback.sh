#!/bin/bash
# keep stock vendor_boot signature (P7): no vbmeta/verity patching here
# $1 = ramdisk path (--first-call) or work dir (--last-call)
if [ \"$2\" = \"--first-call\" ]; then
    # ramdisk stage: nothing to strip, keep Trustonic/keymint stack intact
    exit 0
fi
# zip stage: nothing extra to inject
exit 0
