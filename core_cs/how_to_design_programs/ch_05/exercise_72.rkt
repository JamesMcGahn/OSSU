;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_72) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct phone [area number])
; A phone is a structure
; (make-phone Number String)
; interp (make-phone Number String) means
; area code of the phone number
; number is the phone number

(make-phone 207 "363-2421")
(make-phone 101 "776-1099")
(make-phone 208 "112-9981")


(define-struct phone# [area switch num])
; A phone is a structure
; (make-phone Number Number)
; interp (make-phone Number Number) means
; area code of the phone number 3 digits [0:9]
; switch is the number of the exchange - 3 digits [0:9]
; num is the number of the phone line - 4 digits [0:9]

(make-phone# 207 111 4444)
(make-phone# 101 201 3333)
(make-phone# 208 343 1323)