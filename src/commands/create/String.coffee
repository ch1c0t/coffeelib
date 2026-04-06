String::delete_prefix = (prefix) ->
  if @startsWith prefix
    @slice prefix.length

String::delete_suffix = (suffix) ->
  if @endsWith suffix
    @slice 0, -suffix.length
