;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname self-reference-p6-image-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; image-list-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of images. Call it ListOfImage. 
; 

;; ListOfImages is one of:
;;  - empty
;;  - (cons Number ListOfImages)
;;  - self-reference: (rest loi) is ListOfImages
;; interp. a list of Images
(define LON1 empty)
(define LON2 (cons (rectangle 10 10 "solid" "red") (cons (rectangle 10 10 "solid" "blue") empty)))
#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfImages)
;;  - self-reference: (rest lon) is ListOfImages





;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of images and produces a number 
; that is the sum of the areas of each image. For area, just use the image's 
; width times its height.
; 
; ListOfImages -> Number
; produces sum of areas of a list of images

(check-expect (sum-area empty) 0)
(check-expect (sum-area  (cons (rectangle 10 10 "solid" "blue") empty)) 100)
(check-expect (sum-area  (cons (rectangle 10 10 "solid" "red") (cons (rectangle 10 10 "solid" "blue") empty))
) 200)
(check-expect (sum-area  (cons (rectangle 20 10 "solid" "red") (cons (rectangle 10 10 "solid" "red") (cons (rectangle 10 10 "solid" "blue") empty)))
) 400)

(define (sum-area loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-width (first loi)) (image-height (first loi)))
              (sum-area (rest loi)))]))
