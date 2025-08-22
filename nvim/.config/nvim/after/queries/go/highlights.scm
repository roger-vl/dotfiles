; extends

(
 (expression_list
   (true) @custom.bool 
 ) 
 (#set! "priority" 130)
)

(
 (expression_list
   (false) @custom.bool 
 ) 
 (#set! "priority" 130)
)

(
 (nil) @custom.nil
 (#set! "priority" 130)
)
