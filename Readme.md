# Realized volatility substream

This substream is intended to calcualte the Realized volatility. It uses a UniswapV3Pool contract Swap events
to figure out the correct value of Realized volatility in between blocks.

### Requirements to run
- [same requirements of consuming substreams](https://substreams.streamingfast.io/documentation/consume/installing-the-cli)
- [same requirements for file sink with substream](https://substreams.streamingfast.io/documentation/consume/other-sinks/files)


It is necessary to auth first (script only works in bash): `source ./auth.sh`
Then, Sink files with:

```
substreams-sink-files run --encoder=lines --state-store=./output/state.yaml mainnet.eth.streamingfast.io:443 substreams.yaml csv_out ./output/files
```


