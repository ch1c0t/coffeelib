"""
beforeAll ->
  jasmine.addMatchers
    toStartWith: ->
      compare: (string, prefix) ->
        pass = string.startsWith prefix
        {
          pass
          message: do ->
            if pass
              "Expected '\#{string}' not to start with '\#{prefix}'"
            else
              "Expected '\#{string}' to start with '\#{prefix}'"
        }
"""
