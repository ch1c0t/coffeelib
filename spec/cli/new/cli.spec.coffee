describe 'new cli', ->
  beforeAll(
    ->
      @name = "cli_package"
      @response = await RunCLI "new #{@name} cli"
    10000
  )

  ItCreatesPackageWithCLI()
  ItCreatesGitRepository()
