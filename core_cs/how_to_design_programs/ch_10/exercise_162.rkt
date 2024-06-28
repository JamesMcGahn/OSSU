;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_162) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 162. No employee could possibly work more than 100 hours per week. 
;To protect the company against fraud, the function should check that no item of the input list of wage* exceeds 100. 
;If one of them does, the function should immediately signal an error.
;How do we have to change the function in figure 64 if we want to perform this basic reality check? 


(define WAGE 14)

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours
(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))
 
; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (cond
    [(> h 100) (error "Hours are more than 100")]
    [else (* WAGE h)]))


(check-expect (wage* (cons 28 '())) (cons 392 '()))
(check-expect (wage* (cons 4 (cons 2 '()))) (cons 56 (cons 28 '())))
(check-error (wage* (cons 3 (cons 101 (cons 4 (cons 2 '()))))) "Hours are more than 100")