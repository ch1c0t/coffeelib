fs = require 'fs'

beforeAll ->
  jasmine.addMatchers
    toExistAsFile: ->
      compare: (path) ->
        pass = fs.existsSync(path) and fs.statSync(path).isFile()
        {
          pass
          message: "Expected #{path} #{if pass then 'not to' else 'to'} exist as a file."
        }
    toExistAsDirectory: ->
      compare: (path) ->
        pass = fs.existsSync(path) and fs.statSync(path).isDirectory()
        {
          pass
          message: "Expected #{path} #{if pass then 'not to' else 'to'} exist as a directory."
        }
