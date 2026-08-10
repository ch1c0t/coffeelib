describe 'new complex', ->
  beforeAll ->
    @name = "from_complex_template"
    path_to_template = "#{process.cwd()}/spec/cli/new/complex_template"
    @response = await RunCLI "new #{@name} #{path_to_template}"

  it 'creates a new package', ->
    expect(@response.error).toBe null

    { read } = IO.sync
    string = read "#{ENV.tmp}/#{@name}/src.source/bin/#{@name}/help"
    expect(string).toEqual "A custom help message for #{@name}."

  ItCreatesGitRepository()
