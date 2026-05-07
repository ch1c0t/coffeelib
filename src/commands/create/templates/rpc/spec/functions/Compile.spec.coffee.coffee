'''
{ RPC } = require 'hobby-rpc'

describe 'Compile', ->
  beforeEach ->
    { url } = await serve 'tcp_socket'
    @rpc = RPC { url }

  it 'compiles strings of CoffeeScript to JavaScript', ->
    js_string = await @rpc 'Compile',
      code: 'answer = 42'

    expect(js_string.trim()).toBe """
      (function() {
        var answer;

        answer = 42;

      }).call(this);
    """

  it 'can compile to bare output', ->
    js_string = await @rpc 'Compile',
      code: 'answer = 42'
      bare: true

    expect(js_string.trim()).toBe """
      var answer;

      answer = 42;
    """
'''
