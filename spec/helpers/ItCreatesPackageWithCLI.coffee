{ sh } = require '@ch1c0t/sh'

global.ItCreatesPackageWithCLI = ->
  beforeAll ->
    @cli = "#{ENV.tmp}/#{@name}/bin/#{@name}"

  it 'succeeds', ->
    expect(@response.error).toBe null

  it 'creates a file for CLI', ->
    expect(@cli).toExistAsFile()

  it 'prints the help message', ->
    response = await sh "#{@cli} help"
    expect(response.stdout.trim()).toBe """
    A short description of this CLI.

      version             Print the version.
      help                Show this message.
    """

  it 'prints the version', ->
    response = await sh "#{@cli} version"
    expect(response.stdout.trim()).toBe '0.0.0'
