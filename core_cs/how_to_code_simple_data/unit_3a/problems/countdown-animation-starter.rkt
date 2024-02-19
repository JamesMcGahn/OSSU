;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-animation-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation starter.rkt

; 
; PROBLEM:
; 
; Design an animation of a simple countdown. 
; 
; Your program should display a simple countdown, that starts at ten, and
; decreases by one each clock tick until it reaches zero, and stays there.
; 
; To make your countdown progress at a reasonable speed, you can use the 
; rate option to on-tick. If you say, for example, 
; (on-tick advance-countdown 1) then big-bang will wait 1 second between 
; calls to advance-countdown.
; 
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Once you are finished the simple version of the program, you can improve
; it by reseting the countdown to ten when you press the spacebar.
;

;; Countdown

;; =================
;; Constants:
(define WIDTH 50)
(define HEIGHT 50)
(define MTS (empty-scene WIDTH HEIGHT "midnight blue"))
(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))
(define CDSIZE 20)
(define CDCOLOR "white")
  

;; =================
;; Data definitions:
;; Countdown
;; Natural [0,10]
;; interp. seconds remaining in countdown
(define CD1 0) ; countdown end
(define CD2 5) ; countdown mid
(define CD3 10) ; countdown start

;;template used

;(define (fn-for-countdown t) (...t))
;; Atomic Nondistinct Natural [0,10]



;; =================
;; Functions:

;; CD -> CD
;; start the world with countdown 10 seconds (28tocks*10seconds)
;; 

(define (main cd)
  (big-bang cd ; CD
    (on-tick tock 1) ; CD->CD
    (to-draw render) ;CD -> Image
    (on-key handle-key) ; CD KeyEvent-> Cat
    ))




;; CD -> CD
;; produce the next tock when a full second has passed...
;; 

(check-expect (tock 10) 9)
(check-expect (tock 5) 4)
(check-expect (tock 0)  0)
    
(define (tock cd)
  (if (= cd 0) 0 
 (- cd 1)
 ))
  
  


;; WS -> Image
;; render text of current countdown


(check-expect (render 8) (place-image (text "8" CDSIZE CDCOLOR)
                                                CTR-X CTR-Y
                                                MTS))
(check-expect (render 10) (place-image (text "10" CDSIZE CDCOLOR)
                                                CTR-X CTR-Y
                                                MTS))
(check-expect (render 0) (place-image (text "0" CDSIZE CDCOLOR)
                                                CTR-X CTR-Y
                                                MTS))
 
(define (render cd)

  (place-image (text (number->string cd) CDSIZE CDCOLOR)  CTR-X CTR-Y MTS)
)


;; CD KeyEvent -> CD
;;reset countdown to 10 when spacebar is pressed

(check-expect (handle-key 1 " ") 10)
(check-expect (handle-key 5 "a") 5)
(check-expect (handle-key 0 "a") 0)
(check-expect (handle-key 0 " ") 10)

(define (handle-key cd ke)
  (cond [(key=? ke " ") 10]
        [else cd]))
