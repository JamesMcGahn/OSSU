;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocket-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; rocket-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are designing a program to track a rocket's journey as it descends 
; 100 kilometers to Earth. You are only interested in the descent from 
; 100 kilometers to touchdown. Once the rocket has landed it is done.
; 
; Design a data definition to represent the rocket's remaining descent. 
; Call it RocketDescent.
; 

;; RocketDescent is of
;; - false
;; - Number(0, 100]

;; interp false is the rocket has landed otherwise the number of kms in rocket's journey from 100km to descent

(define RD1 0.5) ; descent touchdown
(define RD2 100) ; start of descent tracking
(define RD3 50) ; midpoint

#;
(define (fn-for-rocket-descent rd)
  (cond [(false? rd) (...)]
        [(number? rd) (... b)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Number(0, 100]

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that will output the rocket's remaining descent distance 
; in a short string that can be broadcast on Twitter. 
; When the descent is over, the message should be "The rocket has landed!".
; Call your function rocket-descent-to-msg.
; 

;RocketDescent -> String
; returns string value in short message for location of the rocket 
; stub: (define (rocket-descent-to-msg rd) "s")

(check-expect (rocket-descent-to-msg 100) "The rocket is at 100 km.")
(check-expect (rocket-descent-to-msg 50) "The rocket is at 50 km.")
(check-expect (rocket-descent-to-msg 1.5) "The rocket is at 3/2 km.")
(check-expect (rocket-descent-to-msg false) "The rocket has landed!")

;; template used from RocketDescent


(define (rocket-descent-to-msg rd)
  (cond [
         (and (number? rd) (<= rd 100) (> rd 0) )
         (string-append "The rocket is at " (number->string rd) " km."
         )]
        [else  "The rocket has landed!"]))