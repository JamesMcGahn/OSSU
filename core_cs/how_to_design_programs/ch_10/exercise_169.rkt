;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_169) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 169. Design the function legal. Like translate from exercise 168, the function consumes and produces a list of Posns. 
; The result contains all those Posns whose x-coordinates are between 0 and 100 and whose y-coordinates are between 0 and 200.

(define (trans-coords coords)
(cond
  [(empty? coords) empty]
  [(and (>= (posn-y (first coords)) 0) (<= (posn-y (first coords)) 200)) (cons (first coords) (trans-coords (rest coords)) )]
  [(and (>= (posn-x (first coords)) 0) (<= (posn-x (first coords)) 100)) (cons (first coords) (trans-coords (rest coords)) )]
  [else  (trans-coords (rest coords))]))



(check-expect (trans-coords (list (make-posn 12 3) (make-posn 123 300) (make-posn 123 300))) (cons (make-posn 12 3) empty))
(check-expect (trans-coords (list (make-posn 12 3) (make-posn 100 300) (make-posn 123 300))) (list (make-posn 12 3) (make-posn 100 300) ))