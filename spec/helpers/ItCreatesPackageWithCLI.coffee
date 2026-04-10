global.ItCreatesPackageWithCLI = ->
  it 'succeeds', ->
    expect(@response.error).toBe null

  it 'creates a file for CLI', ->
    file = "#{ENV.tmp}/#{@name}/bin/#{@name}"
    expect(file).toExistAsFile()
