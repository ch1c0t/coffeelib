{ sh } = require '@ch1c0t/sh'

CreateSrc = ({ name, directory }) ->
  await IO.mkdir directory
  await IO.write "#{directory}/main.coffee", """
    exports.some = -> 'some string'
  """

module.exports = { CreateSrc }
