;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_138) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 138. Here is a data definition for representing sequences of amounts of money:
; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)

(define t1 (cons 2 (cons 5( cons 10 empty))))
(define t2 (cons 10( cons 5( cons 5 empty))))
(define t3 empty)
;Create some examples to make sure you understand the data definition. Also add an arrow for the self-reference.
;Design the sum function, which consumes a List-of-amounts and computes the sum of the amounts.
;Use DrRacket’s stepper to see how (sum l) works for a short list l in List-of-amounts.

; List-of-amounts -> Number
; sums the LOA

(check-expect (sum t1) 17)
(check-expect (sum t2) 20)
(check-expect (sum t3) 0)

(define (sum a)
  (cond
    [(empty? a) 0]
    [else (+ (first a) (sum(rest a)))]
  ))

  