global.ItCreatesGitRepository = ->
  beforeAll ->
    @packageDir = "#{ENV.tmp}/#{@name}"

  it 'has .git/ directory', ->
    git_directory = "#{@packageDir}/.git"
    expect(git_directory).toExistAsDirectory()
