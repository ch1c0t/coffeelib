describe 'new external', ->
  beforeAll ->
    @name = "package_from_external_template"
    path_to_external_template = "#{process.cwd()}/spec/cli/new/external_template"
    @response = await RunCLI "new #{@name} #{path_to_external_template}"

  it 'creates a new package', ->
    expect(@response.error).toBe null

    response = await RunSpecsIn "#{ENV.tmp}/#{@name}"
    expect(response.error)
      .withContext response.stdout
      .toBe null

  ItCreatesGitRepository()
