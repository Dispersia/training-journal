use biscuit::jwa::*;
use biscuit::jwk::*;
use biscuit::*;
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
    let token_data = token_data.decode_with_jwks(&jwks, Some(SignatureAlgorithm::RS256));

    println!("{:#?}", token_data);

    Ok(token_data.is_ok())
}

async fn fetch_jwks(uri: &str) -> Result<JWKSet<biscuit::Empty>, AuthError> {
    let res = reqwest::get(uri).await?;
    let val = res.json::<JWKSet<biscuit::Empty>>().await?;
    return Ok(val);
}

#[derive(Debug, Error)]
pub enum AuthError {
    #[error("internal server error")]
    InternalServerError,
    #[error("bad request `{0}`")]
    BadRequest(String),
    #[error("jwks fetch error")]
    JWKSFetchError(#[from] reqwest::Error),
}
