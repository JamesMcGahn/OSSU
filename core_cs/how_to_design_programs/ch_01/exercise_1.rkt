;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example_1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 3)
(define y 4)

(sqrt (+(expt x 2) (expt y 2)) )



(define (plot x y)
  (sqrt (+(expt x 2) (expt y 2)) )
 )

(plot 3 4)
(plot 12 5)