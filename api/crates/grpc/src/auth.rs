use biscuit::jwa::*;
use biscuit::jwk::*;
use biscuit::*;
use once_cell::sync::OnceCell;
use serde::{Deserialize, Serialize};
use thiserror::Error;

#[derive(Debug, Serialize, Deserialize)]
struct Claims {
    exp: usize,
}

pub async fn validate_token(token: &str) -> Result<bool, AuthError> {
    let authority = "https://training-journal.auth0.com/.well-known/jwks.json";
    let jwks = fetch_jwks(authority).await?;

    let token_data = JWT::<biscuit::Empty, biscuit::Empty>::new_encoded(&token);
    let token_data = token_data.decode_with_jwks(jwks, Some(SignatureAlgorithm::RS256));

    Ok(token_data.is_ok())
}

static JWKS: OnceCell<JWKSet<biscuit::Empty>> = OnceCell::new();

async fn fetch_jwks(uri: &str) -> Result<&JWKSet<biscuit::Empty>, AuthError> {
    if let Some(jwks) = JWKS.get() {
        return Ok(jwks);
    }

    let res = reqwest::get(uri).await?;
    let val = res.json::<JWKSet<biscuit::Empty>>().await?;

    JWKS.get_or_init(|| val);

    return Ok(JWKS.get().unwrap());
}

#[derive(Debug, Error)]
pub enum AuthError {
    #[error("jwks fetch error")]
    JWKSFetchError(#[from] reqwest::Error),
}
