describe 'new rpc', ->
  it 'creates a new package', ->
    name = "coffee.rpc"
    response = await RunCLI "new #{name} rpc"
    expect(response.error).toBe null
    
    rpc_cli_file = "#{ENV.tmp}/#{name}/bin/#{name}"
    expect(rpc_cli_file).toExistAsFile()

    # response = await RunSpecsIn "#{ENV.tmp}/#{name}"
    # expect(response.error).toBe null
