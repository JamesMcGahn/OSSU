;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; String -> String1
;; returns given string without the first character
;; (define (string-rest s)
;; (define (string-rest s) ...s)

(check-expect (string-rest "string") "tring")
(check-expect (string-rest "abc") "bc")

(define (string-rest s)
(substring s 1)
  )