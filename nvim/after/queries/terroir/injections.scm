; extends
((statement_body) @injection.content
  (#set! injection.language "python")
  (#set! "priority" 135))

((text) @injection.content
  (#set! injection.language "terraform")
  (#set! injection.combined)
  (#set! "priority" 135))
