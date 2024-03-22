;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_113) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
 
(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place

; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])


(define (check-sigs s)
  (cond [(or (aim? s) (fired? s)) true]
  [else (error "sigs needs to be one of aim or fired")])
  )


; A Coordinate is one of: 
; – a NegativeNumber 
; interpretation on the y axis, distance from top
; – a PositiveNumber 
; interpretation on the x axis, distance from left
; – a Posn
; interpretation an ordinary Cartesian point

(define (check-coord s)
  (cond [(or (number? s) (posn? s)) true]
  [else (error "coord needs to be one of number or posn")])
  )


; Vcham is a structure
(define-struct VCham (x happiness color))
; (make-Vcham Number Number)
; x is the x position on the scene
; happiness is the level of chams happiness

; VCat is a structure
(define-struct VCat (x dx happiness))
; (make-Vcat Number Number)
; x is the x position on the scene
; happiness is the level of cats happiness


; A VAnimal is either
; – a VCat
; – a VCham

(define (check-vanimal s)
  (cond [(or (VCham? s) (VCat? s)) true]
  [else (error "coord needs to be one of vcat or vcham")])
  )

