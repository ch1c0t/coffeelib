beforeAll ->
  jasmine.addMatchers
    toStartWith: ->
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
    toEndWith: ->
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
