;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_166) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 166. The wage*.v2 function consumes a list of work records and produces a list of numbers. Of course, functions may also produce lists of structures.
;Develop a data representation for paychecks. Assume that a paycheck contains two distinctive pieces of information: the employee’s name and an amount. 
;Then design the function wage*.v3. It consumes a list of work records and computes a list of paychecks from it, one per record.


(define-struct work [employee rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Number Number)
; interpretation (make-work n r h) combines the name 
; with the pay rate r and the number of hours h




; Low (short for list of works) is one of: 
; – '()
; – (cons Work Low)
; interpretation an instance of Low represents the 
; hours worked for a number of employees

; Low -> List-of-numbers
; computes the weekly wages for all weekly work records 
 
(check-expect
  (wage*.v2 (cons (make-work "Robby" 11.95 39) '()))
  (cons (* 11.95 39) '()))
 
(define (wage*.v2 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low) (cons (wage.v2 (first an-low))
                          (wage*.v2 (rest an-low)))]))
 
; Work -> Number
; computes the wage for the given work record w
(define (wage.v2 w)
  (* (work-rate w) (work-hours w)))


(define (wage*.v3 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low) (cons (wage.v3 (first an-low))
                          (wage*.v3 (rest an-low)))]))



(define-struct paycheck [name amount])
; (make-paycheck String Number)
; make-paycheck combines the name on the check the amount

; Work -> Paycheck
; computes the wage for the given work record w
(define (wage.v3 w)
  (make-paycheck (work-employee w) (* (work-rate w) (work-hours w))))


(check-expect
  (wage*.v3 (cons (make-work "Robby" 11.95 39) '()))
  (cons (make-paycheck "Robby" (* 11.95 39)) '()))

(define-struct paycheck.v2 [name ID amount])
; (make-paycheck String String Number)
; make-paycheck combines the name, employee ID and the check the amount


(define-struct work.v2 [employee ID rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Number Number)
; interpretation (make-work n r h) combines the name 
; with the pay rate r and the number of hours h

; Work -> Paycheck.v2
; computes the wage for the given work record w
(define (wage.v4 w)
  (make-paycheck.v2 (work.v2-employee w) (work.v2-ID w) (* (work.v2-rate w) (work.v2-hours w))))

(define (wage*.v4 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low) (cons (wage.v4 (first an-low))
                          (wage*.v4 (rest an-low)))]))

(check-expect
  (wage*.v4 (cons (make-work.v2 "Robby" "SED12342" 11.95 39) '()))
  (cons (make-paycheck.v2 "Robby" "SED12342" (* 11.95 39)) '()))