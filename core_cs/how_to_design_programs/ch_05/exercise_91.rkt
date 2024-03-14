;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_91) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/universe)
(require 2htdp/image)

(define cat (rectangle 50 80 "solid" "black"))

; VCat is a structure
(define-struct VCat (x dx happiness))
; (make-Vcat Number Number)
; x is the x position on the scene
; happiness is the level of cats happiness

(define c1 (make-VCat 0 1 100))
(define c2 (make-VCat 15 -1 50))



(define HEIGHT 300)
(define WIDTH 500)



(define H-WIDTH 100)
(define H-HEIGHT 50)
(define BACKGROUND-SCENE (empty-scene 100 50 "black"))

(define SCENE (empty-scene WIDTH HEIGHT "white"))

; WS -> WS
; increases x position by 3 pixels if cat reaches scene width, moves cat back to 0 width
(define (tock ws)
  (cond
    [(> (VCat-x ws) (- WIDTH (/ (image-width cat) 2) )) (make-VCat (- WIDTH (/ (image-width cat) 2) )  -1 (- (VCat-happiness ws) .1))]
    [(< (VCat-x ws) (+ (/ (image-width cat) 2) 0)) (make-VCat (+ (/ (image-width cat) 2) 0) 1 (- (VCat-happiness ws) .1))]
    [else (make-VCat  (+ (VCat-x ws)  (* (VCat-dx ws)  3)) (VCat-dx ws)    (- (VCat-happiness ws) .1))]
   )
  )
;; WS -> Image
;; renders cat WS x pixels from the left
;; if WS x is odd render cat2 else cat 1
(define (render ws)

    (if (> 1 0)
        (overlay/align "left" "top"
 (place-image (overlay/align "left" "bottom" (rectangle (VCat-happiness ws) 50 "solid" "green")
(rectangle H-WIDTH H-HEIGHT "solid" "red")) (/ H-WIDTH 2)  (/ H-HEIGHT 2) BACKGROUND-SCENE
 ) (place-image cat (VCat-x ws) (/ HEIGHT 2) SCENE))
  (overlay (place-image 
(rectangle H-WIDTH H-HEIGHT "solid" "red") (/ H-WIDTH 2)  (/ H-HEIGHT 2) BACKGROUND-SCENE
 ) (place-image cat (VCat-x ws) (/ HEIGHT 2) SCENE))
  ))
  


;; WS -> Boolean
(define (happy-zero ws)
  (< (VCat-happiness ws) 0)
  )



; WS KeyEvent -> WS
; increases health by 1/3 if key press is up, 1/5 if key press is down otherwise returns WS
(define (change ws a-key)
  (cond
    [(key=? a-key "up")    (if (> (+ (VCat-happiness ws) (* 100 (/ 1 3) )) 100)   (make-VCat (VCat-x ws) (VCat-dx ws)  100) (make-VCat (VCat-x ws) (VCat-dx ws) (+ (VCat-happiness ws) (* 100 (/ 1 3) ))))]
    [(key=? a-key "down")   (if (> (+ (VCat-happiness ws) (* 100 (/ 1 5) )) 100) (make-VCat (VCat-x ws) (VCat-dx ws)  100)  (make-VCat (VCat-x ws) (VCat-dx ws) (+ (VCat-happiness ws) (* 100 (/ 1 5) ))))]
    [else ws]))





(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when happy-zero]
    [on-key change]
))















