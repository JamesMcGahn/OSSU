;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_143) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 143. Determine how average behaves in DrRacket when applied to the empty list.
;Then design checked-average, a function that produces an informative error message when it is applied to '(). 


; List-of-temperatures -> Number
; computes the average temperature
(check-expect (checked-average (cons 1 (cons 2 empty))) 1.5)
(check-expect (checked-average (cons 9 (cons 1 (cons 2 empty)))) 4)
(check-error (checked-average empty) "List is empty.")
(define (checked-average alot)
  (if (empty? alot) (error "List is empty.") (/ (sum alot) (how-many alot))))

; List-of-temperatures -> Number 
; adds up the temperatures on the given list
(check-expect (sum (cons 1 (cons 2 empty))) 3)
(check-expect (sum (cons 9 (cons 1 (cons 2 empty)))) 12)
(check-expect (sum empty) 0)
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot) (sum (rest alot)))]))

; List-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many (cons 1 (cons 2 empty))) 2)
(check-expect (how-many (cons 9 (cons 1 (cons 2 empty)))) 3)
(check-expect (how-many empty) 0)
              

(define (how-many alot)
    (cond
    [(empty? alot) 0]
    [else (+ 1 (how-many (rest alot)))]))