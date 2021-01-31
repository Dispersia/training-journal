FROM rust:1.49 as builder

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y musl-tools && \
    rustup target add x86_64-unknown-linux-musl

WORKDIR /restore

RUN mkdir /training_journal

#COPY build/main.rs /training_journal/src/main.rs
#COPY build/lib.rs /training_journal/crates/api/src/lib.rs
#COPY build/lib.rs /training_journal/crates/graphql/src/lib.rs
#COPY build/lib.rs /training_journal/crates/shared/src/lib.rs

#RUN --mount=type=bind,target=. \
#    find . \( -name "Cargo.toml" \) \
#        -exec cp -p --parents '{}' /training_journal \;
        
#WORKDIR /training_journal

#RUN cargo install --target x86_64-unknown-linux-musl --path .

#COPY /src/ /training_journal/src/
#COPY /crates/ /training_journal/crates/
COPY . .
RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=builder /usr/local/cargo/bin/training_journal .
CMD [ "./training_journal" ]