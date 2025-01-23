;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise_232) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

 (require rackunit)

;Exercise 232. Eliminate quasiquote and unquote from the following expressions so that they are written with list instead:
`(1 "a" 2 #false 3 "c")


(list 1 "a" "2" #false 3 "c")
(check-equal? `(1 "a" 2 #false 3 "c") (list 1 "a" 2 #false 3 "c"))

;this table-like shape:
`(("alan" ,(* 2 500))
  ("barb" 2000)
  (,(string-append "carl" " , the great") 1500)
  ("dawn" 2300))

(list (list "alan" (* 2 500)) (list "barb" 2000) (list (string-append "carl" " , the great") 1500) (list "dawn" 2300))



(check-equal? `(("alan" ,(* 2 500))
  ("barb" 2000)
  (,(string-append "carl" " , the great") 1500)
  ("dawn" 2300))(list (list "alan" (* 2 500)) (list "barb" 2000) (list (string-append "carl" " , the great") 1500) (list "dawn" 2300)) )