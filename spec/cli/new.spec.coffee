describe 'new', ->
  it 'fails if no template directory was found for the passed template name', ->
    response = await RunCLI "new some_package_name non_existent_template_name"
    expect(response.error.message).toStartWith "Command failed"
    expect(response.stderr).toStartWith "No template directory was found at"
    expect(response.stderr).toEndWith "lib/commands/create/templates/non_existent_template_name\n"
