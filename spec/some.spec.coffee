{ sh } = require '@ch1c0t/sh'

describe 'Some', ->
  it 'prints the help', ->
    response = await sh './bin/coffeelib'
    expect(response.stdout).toContain 'A tool to create isomorphic libraries with CoffeeScript'
