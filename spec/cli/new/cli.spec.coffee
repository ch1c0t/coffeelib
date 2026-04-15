describe 'new cli', ->
  beforeAll ->
    @name = "cli_package"
    @response = await RunCLI "new #{@name} cli"

  ItCreatesPackageWithCLI()
  ItCreatesGitRepository()
