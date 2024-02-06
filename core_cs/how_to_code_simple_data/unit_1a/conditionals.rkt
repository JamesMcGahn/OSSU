;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname conditionals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define W 1)
(define H 0)

(= W H)
(> 1 W)
(= W 1)

(>= H 0)
(string=? "apple" "ham")
(string=? "turtle" "turtle")

(define image1 (circle 10 "solid" "blue"))
(define image2 (circle 20 "solid" "red"))

(< (image-width image1) (image-width image2))


(if (< (image-width image1) (image-height image1)) "tall" "wide")
(if (< (image-width image1) (image-height image1)) (image-height image1) (image-width image1))

(and (= (image-width image1) (image-height image1)) (=(image-width image2) (image-height image2)))