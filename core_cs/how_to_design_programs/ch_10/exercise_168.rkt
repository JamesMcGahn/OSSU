;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_168) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 168. Design the function translate. It consumes and produces lists of Posns. For each (make-posn x y) in the former, the latter contains (make-posn x (+ y 1)). 
; We borrow the word “translate” from geometry, where the movement of a point by a constant distance along a straight line is called a translation.

(define (trans-coords coords)
(cond
  [(empty? coords) empty]
  [else (cons (trans-y (first coords)) (trans-coords (rest coords)))]))

(define (trans-y ps)
  (make-posn (posn-x ps) (+ 1 (posn-y ps) )))

(check-expect (trans-coords (list (make-posn 1 3))) (list (make-posn 1 4)))