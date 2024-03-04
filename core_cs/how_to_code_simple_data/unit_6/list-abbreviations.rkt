;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname list-abbreviations) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(cons "a" (cons "b" (cons "c" empty)))

(list "a" "b" "c")

(list (+ 1 2) (+ 2 4))

(define L1 (list "b" "c"))
(define L2 (list "d" "e"))
(cons "a" L1)
;(list "a" "b" "c")
(list "a" L1)
;(list "a" (list "b" "c"))

(append L1 L2)
;(list "b" "c" "d" "e")