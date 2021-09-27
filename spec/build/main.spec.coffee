{ FindNames } = require '../../lib/commands/build/main'

describe 'FindNames', ->
  it 'finds exports.{name}s', ->
    source = """
      exports.aa = -> 'from aa'
      exports.bb = -> 'from bb'
    """

    output = FindNames source

    expect(output).toEqual [
      'aa'
      'bb'
    ]
