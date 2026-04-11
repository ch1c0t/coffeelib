{ dirname, join } = require 'path'
{ mkdirSync } = require 'fs'

exports.ProjectFile = bow
  init: (path) ->
    @path = path
    @dir = dirname path

    mkdirSync @dir, recursive: true
  methods:
    change_filename_to: (new_filename) ->
      @path = join @dir, new_filename
    write: (text) ->
      IO.write @path, text
    copy: (file) ->
      IO.copy file, @path
