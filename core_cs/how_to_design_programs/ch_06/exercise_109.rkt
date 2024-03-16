;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_109) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; ws is one of
;; – "start, expect an 'a'"
;; – "expect 'b', 'c', or 'd'"
;; – "finished" 
;; – "error, illegal key"



;; WS -> WS
;; start with (main "")
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-key change]
    ))

(check-expect (tock "start") "start")
(define (tock ws) ws)

(check-expect (render "start") (place-image (triangle 100 "solid" "white") (/ 100 2) (/ 100 2) (empty-scene 100 100 "black")))
(check-expect (render "expect") (place-image (triangle 100 "solid" "yellow") (/ 100 2) (/ 100 2) (empty-scene 100 100 "black")))
(check-expect (render "finished") (place-image (triangle 100 "solid" "green") (/ 100 2) (/ 100 2) (empty-scene 100 100 "black")))
(check-expect (render "error") (place-image (triangle 100 "solid" "red") (/ 100 2) (/ 100 2) (empty-scene 100 100 "black")))
(check-expect (render "") (place-image (triangle 100 "solid" "white") (/ 100 2) (/ 100 2) (empty-scene 100 100 "black")))


(define (render ws)
  (place-image (triangle 100 "solid"
                         (cond [(string=? "expect" ws) "yellow"]
                               [(string=? "finished" ws) "green"]
                               [(string=? "error" ws) "red"]
                               [else "white"]
                               )
                         ) (/ 100 2) (/ 100 2) (empty-scene 100 100 "black"))
  )

(check-expect (change "start" "a") "expect")
(check-expect (change "start" "b") "error")
(check-expect (change "expect" "b") "expect")
(check-expect (change "expect" "c") "expect")
(check-expect (change "expect" "d") "finished")
(check-expect (change "start" "d") "error")

(define (change ws key)
  (cond [(and (string=? "a" key) (string=? "start" ws)) "expect"]
        [(and (or (string=? "b" key) (string=? "c" key)) (string=? "expect" ws)) "expect"]
        [(and (string=? "d" key) (string=? "expect" ws)) "finished"]
        [else "error"]
        ))


