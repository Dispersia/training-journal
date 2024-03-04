use std::sync::OnceLock;

use serde::Deserialize;

#[derive(Deserialize, Default, Debug, PartialEq, Eq)]
pub struct Config {
    pub database_url: String,
}

pub fn get_config() -> &'static Config {
    static CONFIG: OnceLock<Config> = OnceLock::new();

    CONFIG.get_or_init(|| {
        let config = config::Config::builder()
            .add_source(
                config::Environment::with_prefix("TRAINING")
                    .prefix_separator("__")
                    .separator("__"),
            )
            .build()
            .unwrap();

        let config: Config = config.try_deserialize().unwrap();

        config
    })
}
