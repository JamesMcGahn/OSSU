;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 139|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 139. Now take a look at this data definition:
; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)
;Some elements of this class of data are appropriate inputs for sum from exercise 138 and some aren’t.
;Design the function pos?, which consumes a List-of-numbers and determines whether all numbers are positive numbers.
;In other words, if (pos? l) yields #true, then l is an element of List-of-amounts.
;Use DrRacket’s stepper to understand how pos? works for (cons 5 '()) and (cons -1 '()).

;Also design checked-sum. The function consumes a List-of-numbers.
;It produces their sum if the input also belongs to List-of-amounts; otherwise it signals an error. Hint Recall to use check-error.

;What does sum compute for an element of List-of-numbers?

; LON -> Boolean
; determines if LON is positive numbers

(define t1 (cons 1(cons 3 (cons -1 empty))))
(define t2 (cons 1 (cons 4 empty)))
(define t3 (cons -1(cons -9 empty)))
(define t4 empty)

(check-expect (pos? t1) false)
(check-expect (pos? t2) true)
(check-expect (pos? t3) false)
(check-expect (pos? t4) true)


(define (pos? t)
(cond [(empty? t) true]
      [else (and (> (first t) 0) (pos? (rest t)))]
  ))



; List-of-Numbers -> Number
; sums the LON

(check-error (sum t1) "List has negative number.")
(check-expect (sum t2) 5)
(check-error (sum t3) "List has negative number.")
(check-expect (sum t4) 0)

(define (sum a)
  (cond
    [(empty? a) 0]
    
    [else (if (> (first a) 0) (+ (first a) (sum(rest a))) (error "List has negative number."))]
  ))


