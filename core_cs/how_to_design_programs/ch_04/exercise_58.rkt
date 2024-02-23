;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_58) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item  

(define LOW_TAX 0)
(define REGULAR_TAX 0.05)
(define LUXURY_TAX 0.08)


(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 12017) (* LUXURY_TAX 12017))


(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) (* LOW_TAX p)]
    [(and (<= 1000 p) (< p 10000)) (* REGULAR_TAX p)]
    [(>= p 10000) (* LUXURY_TAX p)]))