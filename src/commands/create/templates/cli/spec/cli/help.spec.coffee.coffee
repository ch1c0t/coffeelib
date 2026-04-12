"""
describe 'help', ->
  it 'prints the help message', ->
    response = await sh './bin/#{project.name}'
    expect(response.stdout).toStartWith 'A short description of this CLI.'
"""
