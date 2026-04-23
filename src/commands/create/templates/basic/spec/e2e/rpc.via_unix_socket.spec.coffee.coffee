"""
{ RPC } = require 'hobby-rpc.client'

describe 'making RPC requests via Unix sockets', ->
  StartAndStopServerForEachExample
    server_path: "\#{process.cwd()}/spec/rpc/via_unix_socket.coffee"
    cwd: TE.dir

  beforeEach ->
    { socket_path } = @server.data
    @rpc = RPC
      socket: socket_path

  ItCanInteractWithCoffeeScriptRPC()
"""
