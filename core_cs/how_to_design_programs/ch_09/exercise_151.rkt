;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_151) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Exercise 151. Design the function multiply. It consumes a natural number n and multiplies it with a number x without using *.

(check-expect (multiply 5 2 ) 10)
(check-expect (multiply 9 9 ) 81)
(check-expect (multiply 3 0 ) 0)
(check-expect (multiply 4 1 ) 4)

(define (multiply n x)
(cond [(zero? x) 0]
   [else (+ n (multiply n (sub1 x)))]))

