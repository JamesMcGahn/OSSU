;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_78) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct midnight [hours minutes seconds])

; A midnight is a structure
; (make-midnight Number Number Number)
; interp (make-midnight Number Number Number) means
; hours is the hours since midnight
; minutes is the minutes since midnight
; seconds is the seconds since midnight

; an hour is one of:
; - [0:]

; a minute is one of:
; - [0:59]

; a second is one of:
; - [0:59]

