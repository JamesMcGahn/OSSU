;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_73) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Posn Number -> Posn
; produces a posn with n in the x field of passed posn

(check-expect (posn-up-x (make-posn 4 5) 1) (make-posn 1 5))
(check-expect (posn-up-x (make-posn 1 5) 3) (make-posn 3 5))

(define (posn-up-x p n)
  (make-posn n (posn-y p))
  )