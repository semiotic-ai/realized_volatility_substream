use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

use serde::Deserialize;

// @generated
pub mod contract {
    // @@protoc_insertion_point(attribute:contract.v1)
    pub mod v1 {
        include!("../pb/contract.v1.rs");
        // @@protoc_insertion_point(contract.v1)
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let path = Path::new("./output/files/");
    for entry in std::fs::read_dir(path)? {
        let entry = entry?;
        let path = entry.path();
        if path.is_file() {
            process_file(&path)?;
        }
    }
    Ok(())
}
#[derive(Default, Deserialize)]
pub struct PoolSwap {
    pub amount0: ::prost::alloc::string::String,
    pub amount1: ::prost::alloc::string::String,
}

fn process_file(path: &Path) -> Result<(), Box<dyn std::error::Error>> {
    let file = File::open(path)?;
    let reader = io::BufReader::new(file);

    for line in reader.lines() {
        let line = line?;
        let pool_swap: PoolSwap = serde_json::from_str(&line)?;
        println!(
            "amount0: {}, amount1: {}",
            pool_swap.amount0, pool_swap.amount1
        );
    }

    Ok(())
}

// fn parse_timestamp(timestamp_str: &str) -> Result<Timestamp, Box<dyn std::error::Error>> {
//     let datetime = chrono::DateTime::parse_from_rfc3339(timestamp_str)?;
//     Ok(Timestamp {
//         seconds: datetime.timestamp(),
//         nanos: datetime.timestamp_subsec_nanos() as i32,
//     })
// }
