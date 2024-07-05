;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_188) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 188. Design a program that sorts lists of emails by date:
(define-struct email [from date message])
; An Email Message is a structure: 
;   (make-email String Number String)
; interpretation (make-email f d m) represents text m 
; sent by f, d seconds after the beginning of time 

(define (email-sorter e)
  (cond
    [(empty? e) empty]
    [else (sort-time (first e) (email-sorter (rest e)))]))

(define (sort-time msg restof)
  (cond
    [(empty? restof) (cons msg empty)]
    [else
     (if (> (email-date msg) (email-date (first restof))) (cons msg restof) (cons (first restof) (sort-time msg (rest restof))))]))


(check-expect (email-sorter (list (make-email "bob" 120121 "hi") (make-email "bob" 220121 "hi") (make-email "bob" 320121 "hi"))) (list (make-email "bob" 320121 "hi") (make-email "bob" 220121 "hi") (make-email "bob" 120121 "hi")))


(email-sorter (list (make-email "bob" 320122 "hi") (make-email "bob" 120121 "hi") (make-email "bob" 220121 "hi") (make-email "bob" 320121 "hi")))