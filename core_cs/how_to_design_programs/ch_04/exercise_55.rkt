;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_55) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (place-rocket y )
  (place-image ROCKET 10 y BACKG)
)

(define (show x)
  (cond
    [(string? x)
     (place-rocket (- HEIGHT CENTER)  )]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-rocket (- HEIGHT CENTER)))]
    [(>= x 0)
     (place-rocket (- x CENTER))]
))