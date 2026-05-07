"""
{ Server } = require 'hobby-rpc.server'
{ functions } = require '../rpc/functions'

pid = process.pid
socket_name = "suite.socket"
socket_path = "\#{process.cwd()}/\#{socket_name}"

server = Server { functions }
server.listen socket_path, ->
  process.send {
    pid
    socket_name
    socket_path
  }
"""
