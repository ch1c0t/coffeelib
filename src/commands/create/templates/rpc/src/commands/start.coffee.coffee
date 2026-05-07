"""
{
  SOCKET_PATH
  TCP_HOST
  TCP_PORT
} = process.env

exports.start = ->
  unless SOCKET_PATH? or TCP_HOST?
    { printHelp } = require './help'
    printHelp()
    process.exit()

  require '@ch1c0t/ext'
  { Server } = require 'hobby-rpc.server'
  { functions } = require '../functions'
  server = Server {
    functions
  }

  if SOCKET_PATH?
    server.listen SOCKET_PATH, ->
      p "Listening on \#{SOCKET_PATH}"

  if TCP_HOST?
    port = TCP_PORT or 0
    server.listen port, TCP_HOST, ->
      host = server.address().address
      port = server.address().port
      p "Listening on http://\#{host}:\#{port}"
"""
