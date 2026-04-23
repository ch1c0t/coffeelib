`{ fork } = require 'child_process'
{ bow } = require '@ch1c0t/bow'

exports.Task = bow
  methods:
    stop: ->
      try
        process.kill @pid
      catch error
        if error.code is 'ESRCH'
          # ESRCH: The task PID does not exist.
        else
          console.error error
    start: ->
      new Promise (resolve, reject) =>
        cwd = @inside_of or process.cwd()
        @child = fork @run, @args,
          cwd: cwd
        @child.once 'message', (data) =>
          @data = data
          if data.pid
            @pid = data.pid
            resolve @pid
        @child.once 'error', (error) -> reject error
        @child.once 'exit', (code) ->
          if code isnt 0
            reject new Error "Exit code: \#{code}"
  init:
    run: -> @value
    args: -> @value or []
    inside_of: -> @value
  setup: ->
    await @start()
    @`;

