;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Exercise 140|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 140. Design the function all-true, which consumes a list of Boolean values and determines whether all of them are #true.
;In other words, if there is any #false on the list, the function produces #false.
;Now design one-true, a function that consumes a list of Boolean values and determines whether at least one item on the list is #true. 




;(cons #true '()), (cons #false '()), and (cons #true (cons #false '())).

(define t1 (cons true (cons false empty)))
(define t2 (cons false empty))
(define t3 (cons true empty))

; LOB -> Boolean
; determines if LOB is all true

(check-expect (all-true t1) false)
(check-expect (all-true t2) false)
(check-expect (all-true t3) true)

 
(define(all-true b)
(cond
  [(empty? b) true]
  [else (and (first b) (all-true (rest b)))]
  
  ))
; LOB -> Boolean
; determines if LOB has one true

(check-expect (one-true t1) true)
(check-expect (one-true t2) false)
(check-expect (one-true t3) true)
(define(one-true b)
(cond
  [(empty? b) false]
  [else (or (first b) (one-true (rest b)))]
  ))