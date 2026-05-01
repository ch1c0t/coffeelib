describe 'new e2e', ->
  beforeAll ->
    @name = "e2e_package"
    @response = await RunCLI "new #{@name} e2e"

  it 'creates a new package with a setup for e2e testing', ->
    expect(@response.error).toBe null

    response = await RunSpecsIn "#{ENV.tmp}/#{@name}"
    expect(response.error)
      .withContext response.stdout
      .toBe null

  ItCreatesGitRepository()
