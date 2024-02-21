;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_39) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE  WHEEL-RADIUS "solid" "red"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR-BODY (rectangle (* WHEEL-DISTANCE 1.8) (* WHEEL-RADIUS 1.5) "solid" "red"))
(define CAR-TOP (rectangle (/ (image-width CAR-BODY) 1.5) (image-height CAR-BODY) "solid" "red"))

(define CAR
(underlay/align/offset "left" "bottom"
  (above CAR-TOP CAR-BODY ) 0 WHEEL-RADIUS                     
   BOTH-WHEELS))

CAR