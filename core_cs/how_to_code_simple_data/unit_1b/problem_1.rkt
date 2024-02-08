;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname problem_1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Problem: Design a function that pluralizes a given word.
;(Pluralize means to convert the word to its plural form.)
;For simplicity you may assume that just adding s is enough to pluralize a word.

; signature: string -> string
; purpose: puralizes the given string. assumes adding s is pluralization

(check-expect (plural "car") "cars")
(check-expect (plural "bug") "bugs")
; elaborate example
(check-expect (plural "bug") (string-append "bug" "s"))

; stub: (define (plural s) "")

; template:
;(define (plural s)
; (...s))

(define (plural s)
  (string-append s "s")
)
  
