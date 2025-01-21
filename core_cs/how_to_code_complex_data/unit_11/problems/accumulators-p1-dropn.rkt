;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dropn-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; dropn-starter.rkt


;; PROBLEM:
;; 
;; Design a function that consumes a list of elements lox and a natural number
;; n and produces the list formed by dropping every nth element from lox.

(check-expect (dropn (list 1 2 3 4 5 6 7) 2) (list 1 2 4 5 7))


(check-expect (dropn empty 0) empty)
(check-expect (dropn (list "a" "b" "c" "d" "e" "f") 0) empty)
(check-expect (dropn (list "a" "b" "c" "d" "e" "f") 1) (list "a" "c" "e"))
(check-expect (dropn (list "a" "b" "c" "d" "e" "f") 2) (list "a" "b" "d" "e"))

(define (dropn lox0 n)
  (local [(define (skip1 lox acc)
            (cond [(empty? lox) empty]
                  [else
                   (if (= acc n)
                       (skip1 (rest lox) 0)
                       
                       (cons (first lox)
                             (skip1 (rest lox) (add1 acc)))
                       )
                       

                   ]))]

    (skip1 lox0 0)))