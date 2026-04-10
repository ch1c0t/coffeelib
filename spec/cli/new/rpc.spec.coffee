describe 'new rpc', ->
  beforeAll ->
    @name = "rpc_package"
    @response = await RunCLI "new #{@name} rpc"

  ItCreatesPackageWithCLI()
