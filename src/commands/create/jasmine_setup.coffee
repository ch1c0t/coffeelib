{ sh } = require '@ch1c0t/sh'

CreateJasmineSetup = ({ name, directory }) ->
  await IO.mkdir directory
  await CreateSupport { directory: "#{directory}/support" }
  await CreateSomeSpec { name, directory }

CreateSupport = ({ directory }) ->
  await sh "cp -r #{ROOT}/spec/support #{directory}"

CreateSomeSpec = ({ name, directory }) ->
  source = """
    { some } = require '#{name}'

    describe 'some', ->
      it 'returns some string', ->
        string = some()
        expect(string).toBe 'some string'
  """

  IO.write "#{directory}/some.spec.coffee", source

module.exports = { CreateJasmineSetup }
