;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_107) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/universe)
(require 2htdp/image)

(define cham (rectangle 50 80 "solid" "black"))
(define cat (rectangle 50 50 "solid" "grey"))

; Vcham is a structure
(define-struct Vcham (x happiness color))
; (make-Vcham Number Number)
; x is the x position on the scene
; happiness is the level of chams happiness

(define c1 (make-Vcham 0 100 "red"))
(define c2 (make-Vcham 15 50 "blue"))


; VCat is a structure
(define-struct VCat (x dx happiness))
; (make-Vcat Number Number)
; x is the x position on the scene
; happiness is the level of cats happiness

; Zoo is a structure
(define-struct zoo (cat cham animal))
; (make-zoo VCat Vcham String
; cat is a Vcat
; cham is a Vcham
; animal is a enum
; - cat
; - cham

;=== Constants

(define HEIGHT 300)
(define WIDTH 1500)
(define H-WIDTH 100)
(define H-HEIGHT 50)
(define BACKGROUND-SCENE (empty-scene 102 52 "black"))

(define start (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") ""))

(define SCENE 
  (beside 
   (empty-scene 500 HEIGHT "white")
   (empty-scene 500 HEIGHT "green") 
   (empty-scene 500 HEIGHT "red")))

; Vcham -> Vcham
; increases x position by 3 pixels if cham reaches scene width, moves cham back to 0 width
(define (tock-cham ws)

  (if (> (Vcham-x ws) (+ WIDTH (image-width cham))) (make-Vcham 0 (- (Vcham-happiness ws) .1) (Vcham-color ws)) (make-Vcham  (+ (Vcham-x ws) 3) (- (Vcham-happiness ws) .1) (Vcham-color ws)))
  )


; VCat -> VCat
; increases x position by 3 pixels if cat reaches scene width, cat changes direction back to 0
; when cat reaches 0 it changes direction back towards witdth
(define (tock-cat ws)
  (cond
    [(> (VCat-x ws) (- WIDTH (/ (image-width cat) 2) )) (make-VCat (- WIDTH (/ (image-width cat) 2) )  -1 (- (VCat-happiness ws) .1))]
    [(< (VCat-x ws) (+ (/ (image-width cat) 2) 0)) (make-VCat (+ (/ (image-width cat) 2) 0) 1 (- (VCat-happiness ws) .1))]
    [else (make-VCat  (+ (VCat-x ws)  (* (VCat-dx ws)  3)) (VCat-dx ws)    (- (VCat-happiness ws) .1))]
    )
  )

; WS-> WS
; increase and decrease cat and increase cham x position
(define (tock ws)
  (make-zoo (tock-cat (zoo-cat ws)) (tock-cham (zoo-cham ws)) (zoo-animal ws))
  )


;; WS -> Image
;; renders cham WS x pixels from the left
;; if WS x is odd render cham2 else cham 1
(define (render-cham ws image)
  (overlay/align "left" "top"
                 (place-image (overlay/align "left" "bottom" (rectangle (Vcham-happiness ws) 50 "solid" "green")
                                             (rectangle H-WIDTH H-HEIGHT "solid" "red")) (+ 1 (/ H-WIDTH 2)) (+ 1(/ H-HEIGHT 2)) BACKGROUND-SCENE
                                                                                         ) (place-image (rectangle 50 80 "solid" (Vcham-color ws)) (Vcham-x ws) (/ HEIGHT 2) image))
  )
  

;; WS -> Image
;; renders cat WS x pixels from the left
;; if WS x is odd render cat2 else cat 1
(define (render-cat ws)
  (overlay/align "right" "top"
                 (place-image (overlay/align "left" "bottom" (rectangle (VCat-happiness ws) 50 "solid" "green")
                                             (rectangle H-WIDTH H-HEIGHT "solid" "red")) (+ 1 (/ H-WIDTH 2))  (+ 1 (/ H-HEIGHT 2)) BACKGROUND-SCENE
                                                                                         ) (place-image cat (VCat-x ws) (/ HEIGHT 2) SCENE))
  )
  
;; WS -> Image
;; render Vcat and Vcham on scene
(define (render ws)
  (render-cham (zoo-cham ws) (render-cat (zoo-cat ws))))
  

;; Vcham -> Boolean
;; stop program when cham happiness is 0
(define (happy-zero-cham ws)
  (< (Vcham-happiness ws) 0)
  )

;; Vcat -> Boolean
;; stop program when cat happiness is 0
(define (happy-zero-cat ws)
  (< (VCat-happiness ws) 0)
  )

;; WS -> Boolean
;; stop program when cat or cham happiness is 0
(define (happy-zero ws)
  (or (happy-zero-cat (zoo-cat ws)) (happy-zero-cham (zoo-cham ws)))
  )


;; Vcham -> Vcham
;; increase Vcham happiness or color
;; increase happiness by 2 if down is pressed
(define (change-cham ws a-key)
  (cond
    [(key=? a-key "down")   (if (> (+ (Vcham-happiness ws) 2) 100) (make-Vcham (Vcham-x ws)  100 (Vcham-color ws))  (make-Vcham (Vcham-x ws) (+ (Vcham-happiness ws) 2) (Vcham-color ws)))]
    [(key=? a-key "r") (make-Vcham (Vcham-x ws) (Vcham-happiness ws) "red")]
    [(key=? a-key "b") (make-Vcham (Vcham-x ws) (Vcham-happiness ws) "blue")] 
    [(key=? a-key "g") (make-Vcham (Vcham-x ws) (Vcham-happiness ws) "green")] 
    ))
;;VCat -> VCat
;; increase VCat happiness
; increases health by 1/3 if key press is up, 1/5 if key press is down
(define (change-cat ws a-key)
  (cond
    [(key=? a-key "up")    (if (> (+ (VCat-happiness ws) (* 100 (/ 1 3) )) 100)   (make-VCat (VCat-x ws) (VCat-dx ws)  100) (make-VCat (VCat-x ws) (VCat-dx ws) (+ (VCat-happiness ws) (* 100 (/ 1 3) ))))]
    [(key=? a-key "down")   (if (> (+ (VCat-happiness ws) (* 100 (/ 1 5) )) 100) (make-VCat (VCat-x ws) (VCat-dx ws)  100)  (make-VCat (VCat-x ws) (VCat-dx ws) (+ (VCat-happiness ws) (* 100 (/ 1 5) ))))]
    ))

; WS KeyEvent -> WS
; change selection between Vcat and Cham, increase happiness of cham or cat, change color of vcham
;; otherwise returns WS

(check-expect (change start "c") (make-zoo (zoo-cat start) (zoo-cham start) "cat"))
(check-expect (change start "l") (make-zoo (zoo-cat start) (zoo-cham start) "cham"))
(check-expect (change start "p") start)
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") "cham") "down") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") "cham"))
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 98 "black") "cham") "down") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") "cham"))
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 2 "black") "cham") "down") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "black") "cham"))
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "black") "cham") "r") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "red") "cham"))
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "black") "cham") "b") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "blue") "cham"))
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "black") "cham") "g") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 4 "green") "cham"))
(check-expect (change (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") "cat") "down") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") "cat"))
(check-expect (change (make-zoo (make-VCat 0 1 0) (make-Vcham 0 100 "black") "cat") "down") (make-zoo (make-VCat 0 1 (/ 100 5)) (make-Vcham 0 100 "black") "cat"))
(check-expect (change (make-zoo (make-VCat 0 1 0) (make-Vcham 0 100 "black") "cat") "up") (make-zoo (make-VCat 0 1 (/ 100 3)) (make-Vcham 0 100 "black") "cat"))
(check-expect (change (make-zoo (make-VCat 0 1 89) (make-Vcham 0 100 "black") "cat") "up") (make-zoo (make-VCat 0 1 100) (make-Vcham 0 100 "black") "cat"))


(define (change ws a-key)
  (cond
    [(and (key=? a-key "down") (string=? "cham" (zoo-animal ws)) )  (make-zoo (zoo-cat ws) (change-cham (zoo-cham ws) a-key) (zoo-animal ws))]
    [(and (key=? a-key "up") (string=? "cat" (zoo-animal ws)) )   (make-zoo (change-cat (zoo-cat ws) a-key) (zoo-cham ws) (zoo-animal ws))]
    [(and (key=? a-key "down") (string=? "cat" (zoo-animal ws)) )  (make-zoo (change-cat (zoo-cat ws) a-key) (zoo-cham ws) (zoo-animal ws))]
    [(and (key=? a-key "r") (string=? "cham" (zoo-animal ws)) ) (make-zoo (zoo-cat ws) (change-cham (zoo-cham ws) a-key) (zoo-animal ws))]
    [(and (key=? a-key "b") (string=? "cham" (zoo-animal ws)) ) (make-zoo (zoo-cat ws) (change-cham (zoo-cham ws) a-key) (zoo-animal ws))]
    [(and (key=? a-key "g") (string=? "cham" (zoo-animal ws)) ) (make-zoo (zoo-cat ws) (change-cham (zoo-cham ws) a-key) (zoo-animal ws))]
    [(key=? a-key "c") (make-zoo (zoo-cat ws) (zoo-cham ws) "cat")]
    [(key=? a-key "l") (make-zoo (zoo-cat ws) (zoo-cham ws) "cham")]
    [else ws]))





(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when happy-zero]
    [on-key change]
    ))
















