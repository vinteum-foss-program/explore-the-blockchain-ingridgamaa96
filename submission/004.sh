# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`

<<<<<<< HEAD
XPUB="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"

ADDRESS=$(bitcoin-cli deriveaddresses "tr($XPUB/0/0/100)#egpeepum")

echo "$ADDRESS"
=======

XPUB="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"

DESCRIPTOR_INFO=$(bitcoin-cli getdescriptorinfo "tr($XPUB/0/0/100)")
CHECKSUM=$(echo "$DESCRIPTOR_INFO" | grep -oP '(?<="checksum": ")[^"]*')

ADDRESS=$(bitcoin-cli deriveaddresses "tr($XPUB/0/0/100)#$CHECKSUM" | tr -d '[]" \n')

echo "$ADDRESS"
>>>>>>> 83e2a7c (004 no space)
