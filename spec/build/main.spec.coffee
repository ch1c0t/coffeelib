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

  it 'finds explicit module.exports', ->
    source = """
      aa = -> 'from aa'
      bb = -> 'from bb'

      module.exports = { aa, bb }
    """

    output = FindNames source

    expect(output).toEqual [
      'aa'
      'bb'
    ]

  it 'finds implicit module.exports', ->
    source = """
      aa = -> 'from aa'
      bb = -> 'from bb'

      module.exports =
        aa: -> 1
        bb: -> 2
    """

    output = FindNames source

    expect(output).toEqual [
      'aa'
      'bb'
    ]
