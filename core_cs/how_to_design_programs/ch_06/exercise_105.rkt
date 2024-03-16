;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_105) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Coordinate is one of: 
; – a NegativeNumber 
; interpretation on the y axis, distance from top
; – a PositiveNumber 
; interpretation on the x axis, distance from left
; – a Posn
; interpretation an ordinary Cartesian point

(define c1 -1)
(define c1 -100)
(define c2 10)
(define c2 100)
(define c3 (make-posn 40 40))
(define c3 (make-posn 50 40))