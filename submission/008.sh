# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

TXID="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"

RAW_TX=$(bitcoin-cli getrawtransaction "$TXID" true)
TXINWITNESS=$(echo "$RAW_TX" | jq -r '.vin[0].txinwitness[]')
SCRIPT=$(echo "$TXINWITNESS" | tail -n 1)
PUBKEY=$(echo "$SCRIPT" | grep -oE "02[0-9a-fA-F]{64}" | head -n 1)
echo "$PUBKEY"