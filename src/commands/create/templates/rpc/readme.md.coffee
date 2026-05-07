"""
## Introduction

`#{project.name}` is an RPC service made with

- https://github.com/ch1c0t/coffeelib
- https://github.com/ch1c0t/hobby-rpc.servers.nodejs

## Usage

To configure, pass environment variables.

`SOCKET_PATH=/tmp/some.socket ./bin/#{project.name}` starts listening on `/tmp/some.socket` Unix socket.

`TCP_HOST="127.0.0.1" TCP_PORT=8080 ./bin/#{project.name}` starts listening on http://127.0.0.1:8080.

To interact with the functions provided, use clients conforming to the [hobby-rpc.protocol][hobby-rpc.protocol].
Like:

- https://github.com/ch1c0t/hobby-rpc.clients.js
- https://github.com/ch1c0t/hobby-rpc.clients.nodejs

See how, in [spec/functions/](spec/functions/).

[hobby-rpc.protocol]: https://github.com/ch1c0t/hobby-rpc.protocol

## Development

`npm start` to start a development session.

`npm test` to run the tests.
"""
