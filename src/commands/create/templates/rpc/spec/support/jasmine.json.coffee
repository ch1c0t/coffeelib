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

jsonify config
