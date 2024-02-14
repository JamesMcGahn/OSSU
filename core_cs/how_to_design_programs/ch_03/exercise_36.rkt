;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_36) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Image -> Number
;; returns the area (pixels) for a given Image
;; (define (image-area img)
;; (define (image-area img) ...img)

(check-expect (image-area (rectangle 10 10 "solid" "blue")) 100)
(check-expect (image-area (rectangle 10 20 "solid" "blue")) 200)

(define (image-area img)
(* (image-height img) (image-width img))
  )