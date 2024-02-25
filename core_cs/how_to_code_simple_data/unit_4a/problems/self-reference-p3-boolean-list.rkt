;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname self-reference-p3-boolean-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; boolean-list-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of booleans. Call it ListOfBoolean. 
; 


;; ListOfBoolean is one of:
;;  - empty
;;  - (cons Boolean ListOfNumber)
;; interp. a list of booleans
(define LON1 empty)
(define LON2 (cons true (cons false empty)))
#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Boolean ListOfBoolean)
;;  - self-reference: (rest lon) is ListOfBoolean


;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of boolean values and produces true 
; if every value in the list is true. If the list is empty, your function 
; should also produce true. Call it all-true?
; 

;ListofBoolean -> Boolean
;produces true if every value in the list is true
;produces true for empty list
(check-expect (all-true empty) true)
(check-expect (all-true (cons false empty)) false)
(check-expect (all-true (cons true (cons true (cons true empty)))) true)
(check-expect (all-true (cons true (cons true (cons false empty)))) false)



(define (all-true lob)
  (cond [(empty? lob) true]
        [else
         (and (first lob)
              (all-true (rest lob)))]))