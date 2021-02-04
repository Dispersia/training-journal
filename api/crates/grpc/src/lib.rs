mod auth;

use tonic::{Request, Response, Status, transport::{Server, server::{RouterService, Unimplemented}}};

use hello_world::greeter_server::{Greeter, GreeterServer};
use hello_world::{HelloReply, HelloRequest};

mod hello_world {
    tonic::include_proto!("helloworld");
}

type Service = RouterService<GreeterServer<MyGreeter>, Unimplemented>;

pub fn create_grpc_server() -> Service {
    let greeter_service = GreeterServer::new(MyGreeter::default());

    Server::builder()
        .add_service(greeter_service)
        .into_service()
}

#[derive(Default, Debug)]
pub struct MyGreeter {}

#[tonic::async_trait]
impl Greeter for MyGreeter {
    async fn say_hello(
        &self,
        request: Request<HelloRequest>,
    ) -> Result<Response<HelloReply>, Status> {
        auth::validate_token(&request).await?;

        let reply = hello_world::HelloReply {
            message: format!("New server, who dis? Name: {}", request.into_inner().name),
        };

        Ok(Response::new(reply))
    }
}
