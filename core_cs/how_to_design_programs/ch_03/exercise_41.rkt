;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_41) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE  WHEEL-RADIUS "solid" "red"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR-BODY (rectangle (* WHEEL-DISTANCE 1.8) (* WHEEL-RADIUS 1.5) "solid" "red"))
(define CAR-TOP (rectangle (/ (image-width CAR-BODY) 1.5) (image-height CAR-BODY) "solid" "red"))
(define CAR
(underlay/align/offset "left" "bottom"
  (above CAR-TOP CAR-BODY ) 0 WHEEL-RADIUS                     
   BOTH-WHEELS))
(define HEIGHT (* (image-height CAR) 1.5))
(define WIDTH-OF-WORLD (* (image-width CAR) 10))

(define BACKGROUND-SCENE (empty-scene WIDTH-OF-WORLD HEIGHT "midnight blue"))
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define SCENE (overlay/align "middle" "bottom" TREE BACKGROUND-SCENE))

; WS -> WS
; move car + 3 pixels to the right for every tick

(define (tock ws)
  (+ ws 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

; WS -> CAR
; places CAR on the background scene according to WS state
(define (render ws)

(place-image CAR ws (- HEIGHT (/ (image-height CAR)2)) SCENE)
  )

(check-expect (render 0) (place-image CAR 0 (- HEIGHT (/ (image-height CAR)2)) SCENE)
  )
(check-expect (render WIDTH-OF-WORLD) (place-image CAR WIDTH-OF-WORLD (- HEIGHT (/ (image-height CAR)2)) SCENE)
  )
(check-expect (render (/ WIDTH-OF-WORLD 2)) (place-image CAR (/ WIDTH-OF-WORLD 2) (- HEIGHT (/ (image-height CAR)2)) SCENE)
  )

; WS -> Boolean
; stops the car if car reaches the width of the scene
(define (stop ws)
  (>= ws (- WIDTH-OF-WORLD (/ (image-width CAR) 2))))


(check-expect (stop 0) false)
(check-expect (stop (/ WIDTH-OF-WORLD 2)) false)
(check-expect (stop  WIDTH-OF-WORLD) true)
(check-expect (stop (- WIDTH-OF-WORLD (/ (image-width CAR) 2))) true)

(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when stop]
    ))