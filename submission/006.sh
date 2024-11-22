# Which tx in block 257,343 spends the coinbase output of block 256,128?

block_origin=256128
block_target=257343

origin_block_hash=$(bitcoin-cli getblockhash $block_origin)

coinbase_txid=$(bitcoin-cli getblock $origin_block_hash | jq -r '.tx[0]')
target_block_hash=$(bitcoin-cli getblockhash $block_target)
bitcoin-cli getblock $target_block_hash | jq -r '.tx[]' | while read txid; do
    if bitcoin-cli getrawtransaction $txid true | jq -r '.vin[] | select(.txid == "'$coinbase_txid'") | .txid' | grep -q "$coinbase_txid"; then
        echo "$txid"
        exit 0
    fi
done