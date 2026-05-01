"""
exports.f = (first, second) ->
  if first and second
    name = first
    spec = second
  else
    spec = first

  fn = (input) ->
    input ?= {}

    state = {}
    state.props = {}

    for own key, value of spec.in
      if typeof value is 'function'
        transform = value
        if transform.length is 0
          prop = transform.call input[key]
        else
          prop = transform input[key]
      else
        default_value = value
        value = input[key]
        prop = if value? then value else default_value
      state[key] = state.props[key] = prop

    { out } = spec
    if out
      out.call state
    else
      state.props

  if name
    global[name] = fn
  else
    fn
"""
