beforeAll ->
  jasmine.addMatchers
    toExistAsFile: ->
      compare: (actual) ->
        pass = require('fs').existsSync(actual)
        {
          pass
          message: "Expected #{actual} #{if pass then 'not to' else 'to'} exist."
        }
