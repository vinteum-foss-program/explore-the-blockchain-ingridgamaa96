# How many new outputs were created by block 123,456?

BLOCK_NUMBER=123456

BLOCK_HASH=$(bitcoin-cli getblockhash $BLOCK_NUMBER)

TRANSACTIONS=$(bitcoin-cli getblock $BLOCK_HASH | jq -r '.tx[]')

OUTPUT_COUNT=0

for TX in $TRANSACTIONS; do
  TX_OUTPUTS=$(bitcoin-cli getrawtransaction $TX true | jq '.vout | length')
  OUTPUT_COUNT=$((OUTPUT_COUNT + TX_OUTPUTS))
done

echo "$OUTPUT_COUNT"
