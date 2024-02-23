;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_51) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH 50)
(define HEIGHT 100)
(define RADIUS 15)
(define MTS (empty-scene WIDTH HEIGHT "white"))
(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))
(define SPACER (rectangle 2 2 "solid" "black"))
(define HOUSING (rectangle 50 98 "solid" "black"))

(define RED
  (overlay (above 
                  (circle RADIUS "solid"   "red")
                  SPACER
                  (circle RADIUS "outline" "yellow")
                  SPACER
                  (circle RADIUS "outline" "green")
                  )
           HOUSING))

(define GREEN
  (overlay (above 
                  (circle RADIUS "outline"   "red")
                  SPACER
                  (circle RADIUS "outline" "yellow")
                  SPACER
                  (circle RADIUS "solid" "green")
                  )
           HOUSING))

(define YELLOW
  (overlay (above 
                  (circle RADIUS "outline"   "red")
                  SPACER
                  (circle RADIUS "solid" "yellow")
                  SPACER
                  (circle RADIUS "outline" "green")
                  )
           HOUSING))

;; =================
;; Data definitions:

;; LS is ... (give WS a better name)
;; LightState is one of:
;;  - "red"
;;  - "yellow"
;;  - "green"
;; interp. the color of a traffic light
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"

#;
(define (fn-for-light-state ls) 
  (cond [(string=? "red" ls) (...)]
        [(string=? "yellow" ls) (...)]
        [(string=? "green" ls) (...)]))


;; =================
;; Functions:

;; LS -> LS
;; start the world with green light
;; 
(define (main ls)
  (big-bang ls                   ; WS
            (on-tick   next-color 1)     ; WS -> WS
            (to-draw   render)   ; WS -> Image
            
))
;; WS -> WS
;; produce the next color...
;;

(check-expect (next-color "green") "yellow")
(check-expect (next-color "yellow") "red")
(check-expect (next-color "red") "green")

(define (next-color ls)
  (cond [(string=? "red" ls) "green"]
        [(string=? "yellow" ls) "red"]
        [(string=? "green" ls) "yellow"]))


;; WS -> Image
;; render the traffic light solid for the current state
;;
(check-expect (render "red") RED)
(check-expect (render "green") GREEN)
(check-expect (render "yellow") YELLOW)
    
    
(define (render ls)
  (cond [(string=? "red" ls) RED]
        [(string=? "yellow" ls) YELLOW]
        [(string=? "green" ls) GREEN]))

  
