{ some } = require 'pr0'


describe 'some', ->
  it 'returns some string', ->
    string = some()
    console.log string
    expect(string).toBe 'some string'
