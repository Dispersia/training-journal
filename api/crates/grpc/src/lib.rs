mod auth;

use tonic::{Request, Response, Status};

use hello_world::greeter_server::{Greeter, GreeterServer};
use hello_world::{HelloReply, HelloRequest};

mod hello_world {
    tonic::include_proto!("helloworld");
}

pub fn create_grpc_server() -> GreeterServer<MyGreeter> {
    let greeter = MyGreeter::default();
    GreeterServer::new(greeter)
}

#[derive(Default, Debug)]
pub struct MyGreeter {}

#[tonic::async_trait]
impl Greeter for MyGreeter {
    async fn say_hello(
        &self,
        request: Request<HelloRequest>,
    ) -> Result<Response<HelloReply>, Status> {
        match request.metadata().get("authorization") {
            Some(t) => {
                match auth::validate_token(&t.to_str().unwrap()).await {
                    Ok(token_valid) if !token_valid => return Err(Status::unauthenticated("Not authorized")),
                    Err(auth_error) => return Err(Status::unauthenticated("failed parsing authentication methods")),
                    _ => {}
                }
            }
            None => return Err(Status::unauthenticated("missing authorization header")),
        };

        let reply = hello_world::HelloReply {
            message: format!("New server, who dis? Name: {}", request.into_inner().name),
        };

        Ok(Response::new(reply))
    }
}
