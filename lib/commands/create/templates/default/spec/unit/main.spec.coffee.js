`{ compile } = require 'coffeescript'
{ f } = require '${project.name}'

describe 'f', ->
  it 'provides the f function', ->
    expect(typeof f).toBe 'function'

  it 'defines other functions', ->
    fn = f
      in:
        code: String
        bare: Boolean
      out: ->
        compile @code, @props

    expect(typeof fn).toBe 'function'
    expect(fn.length).toBe 1

    output = fn
      code: 'answer = 42'
    expect(typeof output).toBe 'string'
    expect(output.trim()).toBe '''
      (function() {
        var answer;

        answer = 42;

      }).call(this);
    '''

    output = fn
      code: 'answer = 42'
      bare: true
    expect(output.trim()).toBe '''
        var answer;

        answer = 42;
    '''`;
