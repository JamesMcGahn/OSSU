;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_81) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct midnight [hours minutes seconds])

; A midnight is a structure
; (make-midnight Number Number Number)
; interp (make-midnight Number Number Number) means
; hours is the hours since midnight
; minutes is the minutes since midnight
; seconds is the seconds since midnight

; an hour is one of:
; - [0:]

; a minute is one of:
; - [0:59]

; a second is one of:
; - [0:59]



; midnight -> second
; produces the number of seconds since midnight

(check-expect (time-seconds (make-midnight 0 0 59)) 59)
(check-expect (time-seconds (make-midnight 0 1 59)) (+ 60 59))
(check-expect (time-seconds (make-midnight 1 1 59)) (+  (* 60 60) 60 59))
(check-expect (time-seconds (make-midnight 6 59 59)) (+ (* 60 60 6 ) (* 59 60) 59))

(define (time-seconds r)
  (+ (* (* (midnight-hours r) 60) 60) (* (midnight-minutes r) 60) (midnight-seconds r))
)