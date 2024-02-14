;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; String -> String1
;; returns given string without the last character
;; (define (string-rest s)
;; (define (string-rest s) ...s)

(check-expect (string-remove-last "string") "strin")
(check-expect (string-remove-last "abc") "ab")

(define (string-remove-last s)
(substring s 0 (- (string-length s) 1))
  )