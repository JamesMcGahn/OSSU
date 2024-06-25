;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_155) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 155. Design the function inner, which consumes an RD and produces the (color of the) innermost doll. Use DrRacket’s stepper to evaluate (inner rd) for your favorite rd. 

(define-struct layer [color doll])


; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)


(check-expect (colors (make-layer "yellow" (make-layer "green" "red"))) "red")
(check-expect (colors (make-layer "blue" (make-layer "orange" (make-layer "white" (make-layer "yellow" (make-layer "green" "brown")))))) "brown")
(check-expect (colors (make-layer "blue" "white")) "white")


(define (colors dl)
 (cond
   [(string? (layer-doll dl)) (layer-doll dl)]
   [else (colors (layer-doll dl))]
  )
  )
