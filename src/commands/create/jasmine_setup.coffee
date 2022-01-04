{ sh } = require '@ch1c0t/sh'

CreateJasmineSetup = ({ name, directory }) ->
  await IO.mkdir directory
  await CreateSupport { directory: "#{directory}/support" }
  await CreateSomeSpec { name, directory }

CreateSupport = ({ directory }) ->
  await IO.ensure directory
  await IO.write "#{directory}/coffee.js", "require('coffeescript/register')"

  config =
    spec_dir: 'spec'
    spec_files: [
      '**/*.spec.coffee'
    ]
    helpers: [
      'support/coffee.js'
      'helpers/**/*.coffee'
    ]
    stopSpecOnExpectationFailure: no
    jsLoader: 'require'
    random: yes
  await IO.write "#{directory}/jasmine.json", (JSON.stringify config, null, 2)

CreateSomeSpec = ({ name, directory }) ->
  source = """
    { some } = require '#{name}'

    describe 'main', ->
      it 'returns some string', ->
        string = some()
        expect(string).toBe 'some string'
  """

  IO.write "#{directory}/main.spec.coffee", source

module.exports = { CreateJasmineSetup }
