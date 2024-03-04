mod config;

use async_graphql::http::{playground_source, GraphQLPlaygroundConfig};
use async_graphql::{Context, EmptyMutation, EmptySubscription, Object, Schema, SimpleObject, ID};
use async_graphql_axum::GraphQL;
use axum::response::{self, IntoResponse};
use axum::routing::get;
use axum::Router;
use sqlx::postgres::PgPoolOptions;
use sqlx::{Pool, Postgres};
use tokio::net::TcpListener;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    tracing_subscriber::fmt::init();

    let config = crate::config::get_config();

    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&config.database_url)
        .await?;

    let schema = Schema::build(QueryRoot, EmptyMutation, EmptySubscription)
        .data(pool)
        .finish();

    let app = Router::new().route(
        "/graphql",
        get(graphql_playground).post_service(GraphQL::new(schema)),
    );

    let listener = TcpListener::bind("0.0.0.0:8000").await?;

    tracing::info!("Listening on 0.0.0.0:8000");

    axum::serve(listener, app).await?;

    Ok(())
}

async fn graphql_playground() -> impl IntoResponse {
    response::Html(playground_source(GraphQLPlaygroundConfig::new(
        "http://127.0.0.1:8000/graphql",
    )))
}

struct QueryRoot;

#[Object]
impl QueryRoot {
    async fn template(&self, ctx: &Context<'_>, _id: ID) -> Vec<Template> {
        let _pool = ctx.data_unchecked::<Pool<Postgres>>();

        vec![Template {
            id: 0,
            group: vec![
                TemplateExercise {
                    exercise: Exercise {
                        id: 0,
                        name: "Bench Press".to_string(),
                        description: "Press".to_string(),
                    },
                    sets: TemplateSet { count: 3 },
                },
                TemplateExercise {
                    exercise: Exercise {
                        id: 1,
                        name: "Another".to_string(),
                        description: "Another".to_string(),
                    },
                    sets: TemplateSet { count: 5 },
                },
            ],
        }]
    }

    async fn group(&self, ctx: &Context<'_>, _id: ID) -> Group {
        let _pool = ctx.data_unchecked::<Pool<Postgres>>();

        Group {
            exercises: vec![ExerciseSet {
                exercise: Exercise {
                    id: 0,
                    name: "Bench".to_string(),
                    description: "Test".to_string(),
                },
                sets: vec![Set {
                    reps: 10,
                    weight: 15,
                }],
            }],
        }
    }
}

#[derive(SimpleObject)]
struct Template {
    id: u32,
    group: Vec<TemplateExercise>,
}

#[derive(SimpleObject)]
struct TemplateExercise {
    exercise: Exercise,
    sets: TemplateSet,
}

#[derive(SimpleObject)]
struct TemplateSet {
    count: u32,
}

#[derive(SimpleObject)]
struct Group {
    exercises: Vec<ExerciseSet>,
}

#[derive(SimpleObject)]
struct ExerciseSet {
    exercise: Exercise,
    sets: Vec<Set>,
}

#[derive(SimpleObject)]
struct Exercise {
    id: u32,
    name: String,
    description: String,
}

#[derive(SimpleObject)]
struct Set {
    reps: u16,
    weight: u16,
}
