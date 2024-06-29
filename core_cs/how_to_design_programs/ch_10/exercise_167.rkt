;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_167) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 167. Design the function sum, which consumes a list of Posns and produces the sum of all of its x-coordinates. 


(define (coords-sum coords )
  (cond
    [(empty? coords) 0]
    [else (+ (posn-x (first coords)) (coords-sum (rest coords)))]))

(check-expect (coords-sum (list (make-posn 1 2) (make-posn 2 2) )) 3)
(check-expect (coords-sum (list (make-posn 1 2) (make-posn 2 2) (make-posn 20 2) (make-posn -5 2))) 18)