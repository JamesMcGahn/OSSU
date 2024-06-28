;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_161) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;Exercise 161. Translate the examples into tests and make sure they all succeed. Then change the function in figure 64 so that everyone gets $14 per hour.
;Now revise the entire program so that changing the wage for everyone is a single change to the entire program and not several. 

; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours
(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))
 
; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* 12 h))

(check-expect (wage* (cons 28 '())) (cons 336 '()))
(check-expect (wage* (cons 4 (cons 2 '()))) (cons 48 (cons 24 '())))


(define (wage2* whrs)
  (cond
    [(empty? whrs) '()]
    [else (cons (wage2 (first whrs)) (wage2* (rest whrs)))]))

(define (wage2 h)
  (* 14 h))

(check-expect (wage2* (cons 28 '())) (cons 392 '()))
(check-expect (wage2* (cons 4 (cons 2 '()))) (cons 56 (cons 28 '())))

(define WAGE 16)

(define (wage3 h)
  (* WAGE h))
