;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_92) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/universe)
(require 2htdp/image)

(define cham (rectangle 50 80 "solid" "black"))

; Vcham is a structure
(define-struct Vcham (x happiness color))
; (make-Vcham Number Number)
; x is the x position on the scene
; happiness is the level of chams happiness

(define c1 (make-Vcham 0 100 "red"))
(define c2 (make-Vcham 15 50 "blue"))



(define HEIGHT 300)
(define WIDTH 500)



(define H-WIDTH 100)
(define H-HEIGHT 50)
(define BACKGROUND-SCENE (empty-scene 100 50 "black"))

(define SCENE (empty-scene WIDTH HEIGHT "white"))

; WS -> WS
; increases x position by 3 pixels if cham reaches scene width, moves cham back to 0 width
(define (tock ws)

  (if (> (Vcham-x ws) (+ WIDTH (image-width cham))) (make-Vcham 0 (- (Vcham-happiness ws) .1) (Vcham-color ws)) (make-Vcham  (+ (Vcham-x ws) 3) (- (Vcham-happiness ws) .1) (Vcham-color ws)))
  )
;; WS -> Image
;; renders cham WS x pixels from the left
;; if WS x is odd render cham2 else cham 1
(define (render ws)

    (if (> 1 0)
        (overlay/align "left" "top"
 (place-image (overlay/align "left" "bottom" (rectangle (Vcham-happiness ws) 50 "solid" "green")
(rectangle H-WIDTH H-HEIGHT "solid" "red")) (/ H-WIDTH 2)  (/ H-HEIGHT 2) BACKGROUND-SCENE
 ) (place-image (rectangle 50 80 "solid" (Vcham-color ws)) (Vcham-x ws) (/ HEIGHT 2) SCENE))
  (overlay (place-image 
(rectangle H-WIDTH H-HEIGHT "solid" "red") (/ H-WIDTH 2)  (/ H-HEIGHT 2) BACKGROUND-SCENE
 ) (place-image (rectangle 50 80 "solid" (Vcham-color ws)) (Vcham-x ws) (/ HEIGHT 2) SCENE))
  ))
  


;; WS -> Boolean
(define (happy-zero ws)
  (< (Vcham-happiness ws) 0)
  )



; WS KeyEvent -> WS
; increases health by 1/3 if key press is up, 1/5 if key press is down otherwise returns WS
(define (change ws a-key)
  (cond
    [(key=? a-key "down")   (if (> (+ (Vcham-happiness ws) 2) 100) (make-Vcham (Vcham-x ws)  100 (Vcham-color ws))  (make-Vcham (Vcham-x ws) (+ (Vcham-happiness ws) 2) (Vcham-color ws)))]
    [(key=? a-key "r") (make-Vcham (Vcham-x ws) (Vcham-happiness ws) "red")]
    [(key=? a-key "b") (make-Vcham (Vcham-x ws) (Vcham-happiness ws) "blue")] 
    [(key=? a-key "g") (make-Vcham (Vcham-x ws) (Vcham-happiness ws) "green")] 

    [else ws]))





(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when happy-zero]
    [on-key change]
))















