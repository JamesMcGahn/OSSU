;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_170) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 170. Here is one way to represent a phone number:
(define-struct phone [area switch four])
; A Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999. 

;Design the function replace. It consumes and produces a list of Phones. It replaces all occurrence of area code 713 with 281. 

(define (phone-change ph)
  (cond
    [(empty? ph) empty]
    [else (cons (arc (first ph)) (phone-change (rest ph)))]
  ))

(define (arc ph)
  (cond
    [(= 713 (phone-area ph)) (make-phone 281 (phone-switch ph) (phone-four ph))]
    [else ph]
  ))

(check-expect (phone-change (list (make-phone 713 232 2332))) (list (make-phone 281 232 2332)))
(check-expect (phone-change (list (make-phone 713 232 2332) (make-phone 123 232 2332))) (list (make-phone 281 232 2332) (make-phone 123 232 2332)))
(check-expect (phone-change (list (make-phone 713 232 2332) (make-phone 123 232 2332) (make-phone 713 232 2332))) (list (make-phone 281 232 2332) (make-phone 123 232 2332) (make-phone 281 232 2332)))