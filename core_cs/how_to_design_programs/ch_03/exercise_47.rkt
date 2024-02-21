;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_47) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)


(define WIDTH 100)
(define HEIGHT 50)
(define BACKGROUND-SCENE (empty-scene 100 50 "black"))




; WS -> WS
; increases x position by 3 pixels if cat reaches scene width, moves cat back to 0 width
(define (tock ws)
  (if (< ws 0) 0 
 (- ws 0.1)))

;; WS -> Image
;; renders health bar based on WS state
;; moves health bar to the left by 0.1 if WS is greater than 0 otherwise stays a 0

(define (render ws)

  (if (> ws 0)
  (place-image (overlay/align "left" "bottom" (rectangle ws 50 "solid" "green")
(rectangle WIDTH HEIGHT "solid" "red")) (/ WIDTH 2)  (/ HEIGHT 2) BACKGROUND-SCENE
 )
  (place-image 
(rectangle WIDTH HEIGHT "solid" "red") (/ WIDTH 2)  (/ HEIGHT 2) BACKGROUND-SCENE
 ))
  )


; WS KeyEvent -> WS
; increases health by 1/3 if key press is up, 1/5 if key press is down otherwise returns WS
(define (change ws a-key)
  (cond
    [(key=? a-key "up")    (if (> (+ ws (* 100 (/ 1 3) )) 100) 100 (+ ws (* 100 (/ 1 3) )))]
    [(key=? a-key "down")   (if (> (+ ws (* 100 (/ 1 5) )) 100) 100 (+ ws (* 100 (/ 1 5) )))]
    [else ws]))


(define (main ws)
  (big-bang ws
    [on-tick tock ]
    [to-draw render]
    [on-key change]
    ))