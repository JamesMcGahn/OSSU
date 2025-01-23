;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise_233) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 (require rackunit)
;Exercise 233. Develop alternatives to the following expressions that use only list and produce the same values:
`(0 ,@'(1 2 3) 4)


(list 0 1 2 3 4)



;this table-like shape:
`(("alan" ,(* 2 500))
  ("barb" 2000)
  (,@'("carl" " , the great")   1500)
  ("dawn" 2300))




(list (list "alan" (* 2 500)) (list "barb" 2000) (list "carl" " , the great"   1500) (list "dawn" 2300))



(check-equal? `(0 ,@'(1 2 3) 4) (list 0 1 2 3 4))

(check-equal? `(("alan" ,(* 2 500))
  ("barb" 2000)
  (,@'("carl" " , the great")   1500)
  ("dawn" 2300))
 (list (list "alan" (* 2 500)) (list "barb" 2000) (list "carl" " , the great"   1500) (list "dawn" 2300)))