describe 'npt finding Jasmine config', ->
  it 'reports an error', ->
    { stderr } = await RunCLI "test"

    expect(stderr).toContain 'Error: Cannot find module'
    expect(stderr).toContain 'spec/support/jasmine.json'
