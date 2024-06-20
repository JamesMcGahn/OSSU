;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_145) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 145.
;Design the sorted>? predicate, which consumes a NEList-of-temperatures and produces #true if the temperatures are sorted in descending order.
;That is, if the second is smaller than the first, the third smaller than the second, and so on. Otherwise it produces #false.

(check-expect (sorted>? empty) true)
(check-expect (sorted>? (cons 1 (cons 2 (cons 4 empty)))) false)
(check-expect (sorted>? (cons 1 (cons 5 (cons 4 empty)))) false)
(check-expect (sorted>? (cons 5 (cons 5 (cons 4 empty)))) true)
(check-expect (sorted>? (cons 8 (cons 5 (cons 4  (cons 1 empty))))) true)


(define (sorted>? l)
(cond
  [(or (= (length l) 1) (empty? l)) true]
  [else (if (>= (first l) (first (rest l))) (sorted>? (rest l)) false)]

    ))
  
 
