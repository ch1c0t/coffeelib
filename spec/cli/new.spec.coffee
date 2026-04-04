describe 'new', ->
  it 'creates a new package', ->
    name = "new_package_name"
    response = await RunCLI "new #{name}"
    expect(response.error).toBe null

    response = await RunSpecsIn "#{ENV.tmp}/#{name}"
    expect(response.error).toBe null
