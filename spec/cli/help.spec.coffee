{ sh } = require '@ch1c0t/sh'

describe 'help', ->
  it 'prints the help', ->
    response = await sh './bin/coffeelib'
    expect(response.stdout).toContain 'A tool to create isomorphic libraries with CoffeeScript'
  it 'fails', ->
    expect(1).toEqual 0
