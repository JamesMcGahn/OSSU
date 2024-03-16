;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_108) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WALK (text "WALK" 25 "green"))
(define STOP (text "STOP" 25 "orange"))

(define WIDTH 100)
(define HEIGHT 50)
(define MTS (empty-scene WIDTH HEIGHT "black"))




; CrossLight is a structure
(define-struct crossLight (state count))
; (make-CrossLight String Number)
; interp
; state is the current state of the light, an enum
;; - walk
;; - stop
; count is a seconds walk light is running 
; - [0:20]
;;

(define (fn-for-cl p)
  (... (crossLight-state p)  (crossLight-count p ) )
  )



(define start (make-crossLight "stop" 0))

;; WS -> WS
;; start with (main start)
(define (main ws)
  (big-bang ws
    [on-tick tock 1]
    [to-draw render]
    [on-key change]
    ))


;; WS -> WS
;; increase count during walk state otherwise return ws
;; if count is < 20 and walk is the state, increase count by 1
;; if count is 20, change state to stop and count to 0
;; otherwise return ws

(check-expect (tock (make-crossLight "stop" 0)) (make-crossLight "stop" 0))
(check-expect (tock (make-crossLight "walk" 20)) (make-crossLight "stop" 0))
(check-expect (tock (make-crossLight "walk" 19)) (make-crossLight "walk" 20))
(check-expect (tock (make-crossLight "walk" 1)) (make-crossLight "walk" 2))

(define (tock ws)
  (cond [(= (crossLight-count ws ) 20)   (make-crossLight "stop" 0)]
        [(and (string=? "walk" (crossLight-state ws))  (< (crossLight-count ws ) 20))  (make-crossLight "walk" (+ (crossLight-count ws ) 1))]
        [else ws]
        ))
;; WS -> Image
;; produce walking / stop light image on screen
;; if count is less than 10 display "WALK", if greater than 10 display the number 20- count - orange for odd num, green for even num
;; otherwise disply "STOP"

(check-expect (render (make-crossLight "stop" 0)) (place-image STOP (/ WIDTH 2) (/ HEIGHT 2) MTS) )
(check-expect (render (make-crossLight "walk" 1)) (place-image WALK  (/ WIDTH 2) (/ HEIGHT 2) MTS) )
(check-expect (render (make-crossLight "walk" 10)) (place-image WALK  (/ WIDTH 2) (/ HEIGHT 2) MTS) )
(check-expect (render (make-crossLight "walk" 11)) (place-image (text "9" 25 "orange")  (/ WIDTH 2) (/ HEIGHT 2) MTS)  )
(check-expect (render (make-crossLight "walk" 20)) (place-image (text "0" 25 "green")  (/ WIDTH 2) (/ HEIGHT 2) MTS)  )

(define (render ws)
  (cond [(and (string=? "walk" (crossLight-state ws))  (<= (crossLight-count ws ) 10)) (place-image WALK  (/ WIDTH 2) (/ HEIGHT 2) MTS)  ]
        [(and (string=? "walk" (crossLight-state ws))  (>= (crossLight-count ws ) 10))  (place-image (text (number->string (- 20 (crossLight-count ws )))  25  (if (= (modulo (crossLight-count ws ) 2) 0) "green" "orange"))  (/ WIDTH 2) (/ HEIGHT 2) MTS)]
        [else  (place-image STOP (/ WIDTH 2) (/ HEIGHT 2) MTS)] 
        )
  )


;; WS KeyEvent -> WS
;; start walk ws when the space bar is pressed otherwise return ws

(check-expect (change (make-crossLight "stop" 0) " ") (make-crossLight "walk" 1))
(check-expect (change (make-crossLight "stop" 0) "a") (make-crossLight "stop" 0))

(define (change ws k)
  (cond [(string=? k " ") (make-crossLight "walk" 1)]
        [else ws]
  ))



