;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_110) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Any -> Number
; computes the area of a disk with radius v, 
; if v is a number

(check-error (checked-area-of-disk 0) "area-of-disk: number expected")
(check-error (checked-area-of-disk -1)"area-of-disk: number expected")
(check-expect (checked-area-of-disk 3) (* 3.14 (expt 3 2)))

(define (checked-area-of-disk v)
  (cond
    [(and (number? v) (> v 0)) (* 3.14 (expt v 2))]
    [else (error "area-of-disk: number expected")]))

