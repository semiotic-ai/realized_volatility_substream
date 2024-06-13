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

**Remember to `make build` before running `substreams` or `substreams-sink-files` to make it work.*

Also, there is this in the substreams documentation if you want to change the block counts, and about how recent the blocks are:
```
When you use the substreams-sink-files tool, you will find that it syncs up to the most recent "final" block of the chain. This means it is not real-time. Additionally, the tool writes bundles to disk when it has seen 10,000 blocks. As a result, the latency of the last available bundle can be delayed by around 10,000 blocks. How many blocks per batch can be controlled by changing the flag --file-block-count
```

There is also a tutorial in [here](https://github.com/streamingfast/substreams-sink-files/tree/master/docs/tutorial) on how to use substreams sink.

