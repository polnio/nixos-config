; extends

((comment) @injection.language
 [
  (expression_list (string (string_content) @injection.content))
  (string (string_content) @injection.content)
 ]
 (#offset! @injection.language 0 5 0 -5))

((string_content) @injection.content
 (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE).+(FROM|INTO|VALUES|SET|TABLE).*(WHERE|GROUP BY)?")
 (#set! injection.language "sql"))

; (
;  (string_content) @query
;  (#match? @query ";; qq")
;  )
