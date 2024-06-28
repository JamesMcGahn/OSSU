;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_165) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 165. Design the function subst-robot, which consumes a list of toy descriptions (one-word strings) 
;and replaces all occurrences of "robot" with "r2d2"; all other descriptions remain the same.


; List-of-numbers -> List-of-numbers
; computes the conversion robots to r2d2
(define (subst-robot toys)
  (cond
    [(empty? toys) '()]
    [else (cons (convert (first toys)) (subst-robot (rest toys)))]))
 
; Number -> Number
; computes the conversion toys, if robot changes name to r2d2
(define (convert t)
(cond
  [(string=? t "robot") "r2d2"]
  [else t]))

(check-expect (subst-robot (list "car" "bike" "robot")) (list "car" "bike" "r2d2"))
(check-expect (subst-robot (list "robot")) (list "r2d2"))