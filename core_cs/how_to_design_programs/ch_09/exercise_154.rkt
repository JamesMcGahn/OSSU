;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname exercise_154) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 154. Design the function colors. It consumes a Russian doll and produces a string of all colors, separated by a comma and a space. Thus our example should produce
;"yellow, green, red"

(define-struct layer [color doll])


; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)


(check-expect (colors (make-layer "yellow" (make-layer "green" "red"))) "yellow, green, red")
(check-expect (colors (make-layer "blue" (make-layer "orange" (make-layer "white" (make-layer "yellow" (make-layer "green" "red")))))) "blue, orange, white, yellow, green, red")
(check-expect (colors (make-layer "blue" "red")) "blue, red")


(define (colors dl)
 (cond
   [(string? (layer-doll dl)) (string-append (layer-color dl) ", " (layer-doll dl))]
   [else (string-append (layer-color dl) ", " (colors (layer-doll dl)))]
  )
  )

