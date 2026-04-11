{ basename } = require 'path'

files = glob.sync "#{__dirname}/helpers/*.js", nodir: yes
for file in files
  name = basename file, '.js'
  require "./helpers/#{name}"
