;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

empty ; empty list

(define L1 (cons "Flames" empty))
(define L2 (cons 10 (cons 9 (cons 8 ( cons 5 empty)))))

L1
L2

(first L1)
(first L2)

(first (rest L2))

(empty? empty)
(empty? L1)