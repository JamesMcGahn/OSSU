;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_181) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 181. Use list to construct the equivalent of these lists:
(cons "a" (cons "b" (cons "c" (cons "d" '()))))
(list "a" "b" "c" "d")
(cons (cons 1 (cons 2 '())) '())
(list 1 2)
(cons "a" (cons (cons 1 '()) (cons #false '())))
(list "a" "1" false)
(cons (cons "a" (cons 2 '())) (cons "hello" '()))
(list (list "a") "hello")