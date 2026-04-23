"""
{ RPC } = require 'hobby-rpc.client'

describe 'making RPC requests via TCP', ->
  StartAndStopServerForEachExample
    server_path: "\#{process.cwd()}/spec/rpc/via_tcp.coffee"

  beforeEach ->
    { host, port } = @server.data
    url = "http://\#{host}:\#{port}"
    @rpc = RPC
      url: url

  ItCanInteractWithCoffeeScriptRPC()
"""
