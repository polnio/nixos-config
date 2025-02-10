(apply_expression
  function: (_) @_func
  argument: [
    (string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "lua")))
    (indented_string_expression
      ((string_fragment) @injection.content
        (#set! injection.language "lua")))
  ]
  (#match? @_func "(^|\\.)mkLuaInline$")
  (#set! injection.combined))
