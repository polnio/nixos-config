; extends
;;
;; ((pair
;; 	 key: ((property_identifier) @_key (#eq? @_key "css"))
;; 	 value: (template_string) @injection.content
;; 	 (#offset! @injection.content 0 1 0 -1)
;; 	 (#set! injection.include-children)
;; 	 (#set! injection.language "css"))
;;
;;  (pair
;; 	 key: ((property_identifier) @_key (#eq? @_key "css"))
;; 	 value: (string (string_fragment) @injection.content)
;; 	 (#set! injection.include-children)
;; 	 (#set! injection.language "css")))

(pair
 key: ((property_identifier) @injection.language)
 value: [
				 (string (string_fragment) @injection.content)
				 (template_string (string_fragment) @injection.content)
				 ]
 (#set! injection.include-children))

