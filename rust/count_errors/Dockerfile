FROM rust:1-alpine AS build
WORKDIR /src
COPY Cargo.toml Cargo.lock ./
RUN mkdir src && echo 'fn main() {}' > src/main.rs && cargo fetch --locked
COPY src ./src
RUN cargo build --release --locked

FROM scratch
COPY --from=build /src/target/release/count_errors /count_errors
ENTRYPOINT ["/count_errors"]
CMD ["/logs"]
