;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example_9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(define in "abc")




(if (image? in) (* (image-height in) (image-width in)) (if (boolean? in) (if (false? in) 20 10) (if (string? in) (string-length in) (if (and (number? in) (> in 0)) (- in 1) (* in -1)))))