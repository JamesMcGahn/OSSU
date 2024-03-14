;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_78) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; CharString
; CharString is one of
; 1String
; false

(define-struct three-word [first second third])

; A three-word is a structure
; (make-three-word CharString CharString CharString)
; interp (make-midnight CharString CharString CharString) means
; first is the first char in the word
; second is the second char in the word
; third is the third chard in the word


