describe 'new', ->
  it 'fails if no template directory was found for the passed template name', ->
    response = await RunCLI "new some_package_name non_existent_template_name"
    expect(response.error).toMatch /^Error: Command failed/
    expect(response.stderr).toMatch /^No template directory was found at/
