# What is the hash of block 654,321?

# hash {000000000000000000058452bbe379ad4364fe8fda68c45e299979b492858095}


BLOCK_NUMBER=654321

BLOCK_HASH=$(bitcoin-cli getblockhash $BLOCK_NUMBER)

echo "$BLOCK_HASH"


