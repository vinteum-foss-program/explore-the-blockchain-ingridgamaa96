# Only one single output remains unspent from block 123,321. What address was it sent to?


block_hash=$(bitcoin-cli getblockhash 123321)
block_transactions=$(bitcoin-cli getblock "$block_hash" | jq -r '.tx[]')

for txid in $block_transactions; do
    txout_info=$(bitcoin-cli gettxout "$txid" 0 2>/dev/null)
    
    if [ -n "$txout_info" ]; then
        address=$(echo "$txout_info" | jq -r '.scriptPubKey.address')
        echo "$address"
        break
    fi
done