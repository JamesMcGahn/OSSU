;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define (cvolume length) 
     (expt length 3)	
)



(check-expect (cvolume 3) 27)
(check-expect (cvolume 9) 729)

(check-expect (csurface 2) (* 6 (* 2 2)))
(check-expect (csurface 9) (* 6 (* 9 9)))
(check-expect (csurface 6) 216)

(define (csurface length)
  (* 6 (* length  length))
 )