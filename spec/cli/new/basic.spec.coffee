describe 'new library', ->
  beforeAll ->
    @name = "library_package"
    @response = await RunCLI "new #{@name}"

  it 'creates a new package', ->
    expect(@response.error).toBe null

    response = await RunSpecsIn "#{ENV.tmp}/#{@name}"
    expect(response.error).toBe null

  ItCreatesGitRepository()
