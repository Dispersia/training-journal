use std::net::Ipv4Addr;

use api::start_server;
use shared::Settings;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    pretty_env_logger::init();

    let settings = Settings {
        address: Ipv4Addr::new(0, 0, 0, 0),
        port: 8080,
    };

    start_server(settings).await
}
