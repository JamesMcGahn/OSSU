;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_142) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;Exercise 142. Design the ill-sized? function, which consumes a list of images loi and a positive number n.
;It produces the first image on loi that is not an n by n square; if it cannot find such an image, it produces #false.

; ImageOrFalse is one of:
; – Image
; – #false 

;LOI -> ImageOrFalse
; produces first image that is not n*n square
; return false if none found


(define t1 (cons (rectangle 4 4 "solid" "blue") (cons (rectangle 4 4 "solid" "blue") empty)))
(define t2 (cons (rectangle 4 4 "solid" "blue") (cons (rectangle 4 4 "solid" "blue") (cons (rectangle 4 5 "solid" "blue") empty))))

(check-expect (ill-sized? t1) false)
(check-expect (ill-sized? t2) (rectangle 4 5 "solid" "blue"))


(define (ill-sized? p)
  (cond
    [(empty? p) false]
    [else (if (= (image-height (first p)) (image-width (first p))) (ill-sized? (rest p)) (first p))]
    ))