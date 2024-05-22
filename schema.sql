CREATE TABLE IF NOT EXISTS pool_burn (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "amount" DECIMAL,
    "amount0" DECIMAL,
    "amount1" DECIMAL,
    "owner" VARCHAR(40),
    "tick_lower" INT,
    "tick_upper" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_collect (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "amount0" DECIMAL,
    "amount1" DECIMAL,
    "owner" VARCHAR(40),
    "recipient" VARCHAR(40),
    "tick_lower" INT,
    "tick_upper" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_collect_protocol (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "amount0" DECIMAL,
    "amount1" DECIMAL,
    "recipient" VARCHAR(40),
    "sender" VARCHAR(40),
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_flash (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "amount0" DECIMAL,
    "amount1" DECIMAL,
    "paid0" DECIMAL,
    "paid1" DECIMAL,
    "recipient" VARCHAR(40),
    "sender" VARCHAR(40),
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_increase_observation_cardinality_next (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "observation_cardinality_next_new" INT,
    "observation_cardinality_next_old" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_initialize (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "sqrt_price_x96" DECIMAL,
    "tick" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_mint (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "amount" DECIMAL,
    "amount0" DECIMAL,
    "amount1" DECIMAL,
    "owner" VARCHAR(40),
    "sender" VARCHAR(40),
    "tick_lower" INT,
    "tick_upper" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_set_fee_protocol (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "fee_protocol0_new" INT,
    "fee_protocol0_old" INT,
    "fee_protocol1_new" INT,
    "fee_protocol1_old" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);
CREATE TABLE IF NOT EXISTS pool_swap (
    "evt_tx_hash" VARCHAR(64),
    "evt_index" INT,
    "evt_block_time" TIMESTAMP,
    "evt_block_number" DECIMAL,
    "amount0" DECIMAL,
    "amount1" DECIMAL,
    "liquidity" DECIMAL,
    "recipient" VARCHAR(40),
    "sender" VARCHAR(40),
    "sqrt_price_x96" DECIMAL,
    "tick" INT,
    PRIMARY KEY(evt_tx_hash,evt_index)
);

