;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_164) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 164. Design the function convert-euro, which converts a list of US$ amounts into a list of € amounts. Look up the current exchange rate on the web

; List-of-numbers -> List-of-numbers
; computes the conversion of USD to EUR
(define (convertFC temps)
  (cond
    [(empty? temps) '()]
    [else (cons (convert (first temps)) (convertFC (rest temps)))]))
 
; Number -> Number
; computes the conversion of USD to EUR
(define (convert d)
(* d  .93))

(check-expect (convertFC (list 1)) (list .93))
(check-expect (convertFC (list 10.00 98.00 42.00)) (list 9.34 91.14 39.06))