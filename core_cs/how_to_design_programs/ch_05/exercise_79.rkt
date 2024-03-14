;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_79) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Color is one of: 
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"

(define e1 "white")
(define e2 "black")
(define e4 "green")

; H is a Number between 0 and 100.
; interpretation represents a happiness value

(define h1 1)
(define h2 99)
(define h3 50)
 
(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)
; fstname is the first name
; lstname is the last name
; male? true if the person is male

(make-person ("bob" "hallows" true))
(make-person ("sally" "smith" false))


(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; interp
; owner is a person
; name is the name of the dog
; age is a positive integer
; h is H 


(make-dog ((make-person ("bob" "hallows" true)) "fluffy" 5 h3)) 


; A Weapon is one of: 
; — #false
; — Posn
; interpretation #false means the missile hasn't 
; been fired yet; a Posn means it is in flight.

(define w1 false)
(define w2 (posn 10 10))
