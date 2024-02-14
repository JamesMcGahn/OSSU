;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)


(define block (rectangle 100 100 "solid" "blue"))
(define tall (rectangle 100 200 "solid" "blue"))
(define wide (rectangle 200 100 "solid" "blue"))

(define (image-classify img)
(if (= (image-height img) (image-width img)) "square" (if (>= (image-height img) (image-width img) ) "tall" "wide")))

(check-expect (image-classify block) "square")
(check-expect (image-classify tall) "tall")
(check-expect (image-classify wide) "wide")