describe 'new rpc', ->
  beforeAll(
    ->
      @name = "rpc_package"
      @response = await RunCLI "new #{@name} rpc"
    10000
  )

  ItCreatesPackageWithCLI()
  ItCreatesGitRepository()
