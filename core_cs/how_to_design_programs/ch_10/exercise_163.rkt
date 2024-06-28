;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_163) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 163. Design convertFC. The function converts a list of measurements in Fahrenheit to a list of Celsius measurements. 

; List-of-numbers -> List-of-numbers
; computes the conversion of Fahrenheit measurements to Celsius
(define (convertFC temps)
  (cond
    [(empty? temps) '()]
    [else (cons (convert (first temps)) (convertFC (rest temps)))]))
 
; Number -> Number
; computes the conversion of Fahrenheit to Celsius
(define (convert t)
(* (/ 5 9) (- t 32)))

(check-expect (convertFC (list 32)) (list 0))
(check-expect (convertFC (list 32 111.2 68)) (list 0 44 20))