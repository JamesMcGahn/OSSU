;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname helpers-p2-making-rain-filtered) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; making-rain-filtered-starter.rkt

; 
; PROBLEM:
; 
; Design a simple interactive animation of rain falling down a screen. Wherever we click,
; a rain drop should be created and as time goes by it should fall. Over time the drops
; will reach the bottom of the screen and "fall off". You should filter these excess
; drops out of the world state - otherwise your program is continuing to tick and
; and draw them long after they are invisible.
; 
; In your design pay particular attention to the helper rules. In our solution we use
; these rules to split out helpers:
;   - function composition
;   - reference
;   - knowledge domain shift
;   
;   
; NOTE: This is a fairly long problem.  While you should be getting more comfortable with 
; world problems there is still a fair amount of work to do here. Our solution has 9
; functions including main. If you find it is taking you too long then jump ahead to the
; next homework problem and finish this later.
; 
; 

;; Make it rain where we want it to.

;; =================
;; Constants:

(define WIDTH  300)
(define HEIGHT 300)

(define SPEED 1)

(define DROP (ellipse 4 8 "solid" "blue"))

(define MTS (rectangle WIDTH HEIGHT "solid" "light blue"))

;; =================
;; Data definitions:

(define-struct drop (x y))
;; Drop is (make-drop Integer Integer)
;; interp. A raindrop on the screen, with x and y coordinates.

(define D1 (make-drop 10 30))

#;
(define (fn-for-drop d)
  (... (drop-x d) 
       (drop-y d)))

;; Template Rules used:
;; - compound: 2 fields


;; ListOfDrop is one of:
;;  - empty
;;  - (cons Drop ListOfDrop)
;; interp. a list of drops

(define LOD1 empty)
(define LOD2 (cons (make-drop 10 20) (cons (make-drop 3 6) empty)))

#;
(define (fn-for-lod lod)
  (cond [(empty? lod) (...)]
        [else
         (... (fn-for-drop (first lod))
              (fn-for-lod (rest lod)))]))

;; Template Rules used:
;; - one-of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Drop ListOfDrop)
;; - reference: (first lod) is Drop
;; - self reference: (rest lod) is ListOfDrop

;; =================
;; Functions:

;; ListOfDrop -> ListOfDrop
;; start rain program by evaluating (main empty)
(define (main lod)
  (big-bang lod
    (on-mouse handle-mouse)   ; ListOfDrop Integer Integer MouseEvent -> ListOfDrop
    (on-tick  next-drops)     ; ListOfDrop -> ListOfDrop
    (to-draw  render-drops))) ; ListOfDrop -> Image


;; ListOfDrop Integer Integer MouseEvent -> ListOfDrop
;; if mevt is "button-down" add a new drop at that position
;;

(check-expect (handle-mouse empty 1 1 "button-down") (cons (make-drop 1 1) empty ))   
(check-expect (handle-mouse empty 1 1 "button-up")  empty )

(define (handle-mouse lod x y mevt)
  (cond [(mouse=? mevt "button-down")
         (append lod (cons (make-drop x y) empty) )
         ]
        [else lod]
        )
  )


;; ListOfDrop -> ListOfDrop
;; produce filtered and ticked list of drops
;(define (next-drops lod)) ; stub

(check-expect (next-drops (cons (make-drop 10 10) empty)) (cons (make-drop 10 11) empty))
(check-expect (next-drops (cons (make-drop 30 (+ HEIGHT 1) )(cons (make-drop 10 10) empty))) (cons (make-drop 10 11) empty))
(define (next-drops lod)
  (pass-view (move-drops lod)))


;; LOD-> LOD
;; Increase list of drops y position by speed
(check-expect (move-drops empty) empty)
(check-expect (move-drops (cons (make-drop 10 10) empty)) (cons (make-drop 10 11) empty))


(define (move-drops lod)
  (cond [(empty? lod) empty]
        [else
         (cons (adjust-drop (first lod))
               (next-drops (rest lod)))]))

;; Drop -> Drop
;; increase drop y position by speed
(check-expect (adjust-drop (make-drop 10 10)) (make-drop 10 11))
(check-expect (adjust-drop (make-drop 0 0)) (make-drop 0 1))

(define (adjust-drop d)
  (make-drop (drop-x d) 
             (+  (drop-y d) SPEED)))


;; LOD -> LOD
;; Filter out drops from LOB that have a y position greater than height
(check-expect (pass-view empty) empty)
(check-expect (pass-view (cons (make-drop 10 11) empty)) (cons (make-drop 10 11) empty))
(check-expect (pass-view (cons (make-drop 10 (+ HEIGHT 1)) (cons (make-drop 10 11) empty))) (cons (make-drop 10 11) empty))


(define (pass-view lod)
  (cond [(empty? lod) empty]
        [else
         (

          if (pass-y-screen? (first lod))
             (pass-view (rest lod))
             (cons (first lod) (pass-view (rest lod))
                   ))

         ]))




;; Drop -> Boolean
;; is drop y position greater than screen height
(check-expect (pass-y-screen? (make-drop 10 (+ HEIGHT 1))) true)
(check-expect (pass-y-screen? (make-drop 10 (+ HEIGHT 0))) false)
              
(define (pass-y-screen? d)
  (< HEIGHT (drop-y d)))


;; ListOfDrop -> Image
;; Render the drops onto MTS
;;

(check-expect (render-drops empty) MTS)
(check-expect (render-drops (cons (make-drop 10 10) empty )) (place-image DROP 10 10 MTS))
(check-expect (render-drops (cons (make-drop 20 10) (cons (make-drop 10 10) empty ))) (place-image DROP 20 10 (place-image DROP 10 10 MTS)) )


(define (render-drops lod)
  (cond [(empty? lod) MTS]
        [else
         (place-drop (first lod)
              (render-drops (rest lod)))]))

(check-expect (place-drop (make-drop 10 10) MTS) (place-image DROP 10 10 MTS))
(check-expect (place-drop (make-drop 20 10) (place-image DROP 10 10 MTS)) (place-image DROP 20 10 (place-image DROP 10 10 MTS)))


;; Drop Image -> Image
;; convert drop to image and place on passed image
(define (place-drop d img)
  (place-image DROP (drop-x d) (drop-y d) img))