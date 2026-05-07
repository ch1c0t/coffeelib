`{ RPC } = require 'hobby-rpc.client'

describe 'a Unix socket available for the entire test suite', ->
  beforeAll ->
    @rpc = RPC
      socket: "\#{TE.dir}/suite.socket"

  ItCanInteractWithCoffeeScriptRPC()`;

