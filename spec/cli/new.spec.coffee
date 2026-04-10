describe 'new', ->
  it 'fails if no template directory was found for the passed template name', ->
    response = await RunCLI "new some_package_name non_existent_template_name"
    expect(response.error.message).startsWith "Command failed"
    expect(response.stderr).startsWith "No template directory was found at"
    expect(response.stderr).endsWith "lib/commands/create/templates/non_existent_template_name\n"
