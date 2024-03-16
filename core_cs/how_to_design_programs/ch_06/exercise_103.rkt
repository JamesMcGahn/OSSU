;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_103) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct spider (legs space))
; spiders is a structure
; (make-spider Number Number)
; legs is the number of legs it has left
; space is the space they need for transport

(define s1 (make-spider 8 2))
(define s2 (make-spider 2 1))

(define-struct elephant (space))
; elephant is a structure
; (make-elephant  Number)
; space is the space they need for transport

(define e1 (make-elephant 8))
(define e2 (make-elephant 15))

(define-struct boa (length girth space))
; boa is a structure
; (make-boa  Number Number Number)
; length is the length of the boa
; girth is the girth of the boa
; space is the space they need for transport

(define b1 (make-boa 8 2 5))
(define b2 (make-boa 2 1 5))

(define-struct armadillo (space color))
; armadillo is a structure
; (make-armadillo  Number String)
; space is the space they need for transport
; color is the color of the armadillo

(define a1 (make-armadillo 3 "black"))
(define a2 (make-armadillo 2 "grey"))

(define (fn-for-zoo a)
  (cond [(spider? a) (... (spiders-legs a) (spiders-space a))]
        [(elephant? a) (...(elephant-space a))]
        [(boa? a) (... (boa-length a) (boa-girth a) (boa-space a))]
        [(armadillo? a) (... (armadillo-space a) (armadillo-color a))]
        ))

(define (fits-in-cage cv av)
  (>= cv av))


(check-expect (fits? (make-spider 1 10) 9) false)
(check-expect (fits? (make-spider 1 2) 9) true)
(check-expect (fits? (make-elephant 15) 9) false)
(check-expect (fits? (make-boa 2 1 5) 9) true)
(check-expect (fits? (make-armadillo 3 "black") 9) true)


(define (fits? a cage)
  (cond [(spider? a) (fits-in-cage cage (spider-space a))]
        [(elephant? a) (fits-in-cage cage (elephant-space a))]
        [(boa? a) (fits-in-cage cage (boa-space a))]
        [(armadillo? a) (fits-in-cage cage (armadillo-space a))]
        ))
