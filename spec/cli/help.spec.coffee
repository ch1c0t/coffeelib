describe 'help', ->
  it 'prints the help', ->
    response = await sh './bin/coffeelib'
    expect(response.stdout).toContain 'A tool to create isomorphic libraries with CoffeeScript'
