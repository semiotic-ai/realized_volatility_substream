// @generated
pub mod contract {
    // @@protoc_insertion_point(attribute:contract.v1)
    pub mod v1 {
        include!("contract.v1.rs");
        // @@protoc_insertion_point(contract.v1)
    }
}

#[path = "sf.substreams.sink.files.v1.rs"]
#[allow(dead_code)]
pub mod sinkfiles;

#[path = "contract.v1.rs"]
#[allow(dead_code)]
mod swaps_priv;

pub mod swaps {
    use csv::Terminator;
    use serde::ser::SerializeStruct;
    use serde::{Serialize, Serializer};

    use super::contract::v1::PoolSwap;
    pub use super::swaps_priv::*;

    impl Serialize for PoolSwap {
        fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
        where
            S: Serializer,
        {
            let mut state = serializer.serialize_struct("PoolSwap", 11)?;
            state.serialize_field("evt_tx_hash", &self.evt_tx_hash)?;
            state.serialize_field("evt_index", &self.evt_index)?;
            state.serialize_field(
                "evt_block_time",
                &self.evt_block_time.as_ref().map(|ts| ts.to_string()),
            )?;
            state.serialize_field("evt_block_number", &self.evt_block_number)?;
            state.serialize_field("sender", &self.sender)?;
            state.serialize_field("recipient", &self.recipient)?;
            state.serialize_field("amount0", &self.amount0)?;
            state.serialize_field("amount1", &self.amount1)?;
            state.serialize_field("sqrt_price_x96", &self.sqrt_price_x96)?;
            state.serialize_field("liquidity", &self.liquidity)?;
            state.serialize_field("tick", &self.tick)?;
            state.end()
        }
    }

    impl PoolSwap {
        pub fn to_csv(&self) -> String {
            let mut writer = csv::WriterBuilder::new()
                .has_headers(false)
                .terminator(Terminator::Any('\n' as u8))
                .from_writer(Vec::with_capacity(128));

            writer.serialize(self).unwrap_or_else(|err| {
                panic!(
                    "should have been able to serialize {:?} to CSV: {}",
                    self, err
                )
            });

            // Takes the bytes written and remove the terminator which is always a new line
            let bytes = writer.into_inner().unwrap();
            if let Some((_terminator, line)) = bytes.split_last() {
                return std::str::from_utf8(line).unwrap().to_string();
            }

            // There was no bytes written, so let's return the empty string
            "".to_string()
        }
    }
}
