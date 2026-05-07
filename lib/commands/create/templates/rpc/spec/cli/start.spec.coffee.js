`{ spawn } = require 'child_process'

describe 'cli start', ->
  it 'starts listening on Unix socket', ->
    socket = "\#{TE.dir}/socket"
    server = await serve
      env:
        SOCKET_PATH: socket

    expect(server.message)
      .toStartWith "Listening on \#{socket}"

  it 'starts listening on TCP socket', ->
    host = '127.0.0.1'
    port = 8080
    server = await serve
      env:
        TCP_HOST: host
        TCP_PORT: port

    expect(server.message)
      .toStartWith "Listening on http://\#{host}:\#{port}"`;

