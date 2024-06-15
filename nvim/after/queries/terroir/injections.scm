; extends
((statement_body) @injection.content
  (#set! injection.language "python"))

((text) @injection.content
  (#set! injection.language "terraform")
  (#set! injection.combined)
  (#set! injection.include-children))

;; some random change
