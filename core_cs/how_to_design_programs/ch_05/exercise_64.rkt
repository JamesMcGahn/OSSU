;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_64) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; posn -> Number
; calculates the distance between two points


(check-expect (manhattan-distance (make-posn 1 2) (make-posn 1 5))3)
(check-expect (manhattan-distance (make-posn 4 3) (make-posn 0 0)) 5)

(define (manhattan-distance point1 point2)

  (sqrt
   (+ (sqr (- (posn-x point2) (posn-x point1)))
      (sqr (- (posn-y point2) (posn-y point1)))
   )
  )
  )