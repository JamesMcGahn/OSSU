;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> String1
;; returns the first character from given string
;; (define (string-first s)
;; (define (string-first s) ...s)

(check-expect (string-first "abc") "a")
(check-expect (string-first "a") "a")

(define (string-first s)
(substring s 0 1)
  )