describe 'new basic', ->
  it 'creates a new package', ->
    name = "basic_package"
    response = await RunCLI "new #{name}"
    expect(response.error).toBe null

    response = await RunSpecsIn "#{ENV.tmp}/#{name}"
    expect(response.error).toBe null
