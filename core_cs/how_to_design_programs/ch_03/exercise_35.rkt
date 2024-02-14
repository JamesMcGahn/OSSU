;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_35) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> String1
;; returns the last character from given string
;; (define (string-last s)
;; (define (string-last s) ...s)

(check-expect (string-last "abc") "c")
(check-expect (string-last "a") "a")

(define (string-last s)
(substring s (- (string-length s) 1))
  )