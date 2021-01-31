use std::net::Ipv4Addr;

use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct Settings {
    pub address: Ipv4Addr,
    pub port: u16,
}
