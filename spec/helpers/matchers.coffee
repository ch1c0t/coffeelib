{ sh } = require '@ch1c0t/sh'

beforeAll ->
  jasmine.addMatchers
    toExistAsFile: ->
      compare: (actual) ->
        pass = require('fs').existsSync(actual)
        {
          pass
          message: "Expected #{actual} #{if pass then 'not to' else 'to'} exist."
        }
    startsWith: ->
      compare: (string, prefix) ->
        pass = string.startsWith prefix
        {
          pass
          message: do ->
            if pass
              "Expected '#{string}' not to start with '#{prefix}'"
            else
              "Expected '#{string}' to start with '#{prefix}'"
        }
    endsWith: ->
      compare: (string, suffix) ->
        pass = string.endsWith suffix
        {
          pass
          message: do ->
            if pass
              "Expected '#{string}' not to end with '#{suffix}'"
            else
              "Expected '#{string}' to end with '#{suffix}'"
        }
    toPassInsideOf: ->
      compare: (command, directory) ->
        response = await sh(command, cwd: directory)
        pass = response.error is null
        {
          pass
        }
