;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-images-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; arrange-images-starter.rkt (problem statement)

; 
; PROBLEM:
; 
; In this problem imagine you have a bunch of pictures that you would like to 
; store as data and present in different ways. We'll do a simple version of that 
; here, and set the stage for a more elaborate version later.
; 
; (A) Design a data definition to represent an arbitrary number of images.
; 
; (B) Design a function called arrange-images that consumes an arbitrary number
;     of images and lays them out left-to-right in increasing order of size.
;

;; == constants
(define BLANK (square 0 "solid" "white"))


;; == for testing
(define L1 (rectangle 10 20 "solid" "blue"))
(define L2 (rectangle 10 30 "solid" "red"))
(define L3 (rectangle 10 40 "solid" "red"))



;; == data def

;; ListOfImages is one of;
;; - empty
;; - (cons Image ListOfImage)
;; interp an arbitrary number of images

(define LOI1 empty)
(define LOI2 (cons L1 (cons L2 empty)))

;;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; == functions

;; ListOfImages -> Image
;; sort images in increasing order of size (area) and then lay them out left to right
(check-expect (arrange-images empty) BLANK)
(check-expect (arrange-images (cons L1 (cons L2 empty)))
              (beside L1 L2 BLANK))
(check-expect (arrange-images (cons L2 (cons L1 empty)))
              (beside L1 L2 BLANK))
;(define (arrange-images loi) BLANK) ;stub

(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place images beside each other in order of list
(check-expect (layout-images (cons L1 (cons L2 empty)))
              (beside L1 L2 BLANK))
(define (layout-images loi)
  (cond [(empty? loi) BLANK]
        [else
         (beside (first loi)
                 (layout-images (rest loi)))]))

;; ListOfImage -> ListOfImage
;; sort images in increasing order of size

(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons L2 (cons L1 empty)))
              (cons L1 (cons L2 empty)))


(define (sort-images loi)
  (cond [(empty? loi) empty]
        [else
         (insert (first loi)
              (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; insert img in proper place in lst (in increasing order of size)
;; ASSUME: lst is already sorted
(check-expect (insert L1 empty) (cons L1 empty))
(check-expect (insert L1 (cons L2 (cons L3 empty))) (cons L1 (cons L2 (cons L3 empty))))
(check-expect (insert L3 (cons L1 (cons L2 empty))) (cons L1 (cons L2 (cons L3 empty))))


(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if (larger? img (first loi))
             (cons (first loi)
                   (insert img
                           (rest loi)))
             (cons img loi))
         ]))

;; Image Image -> Boolean
;; product true if img1 is larger than img2 (area)

;(define (larger? img1 img2) true) ;
(check-expect (larger? (rectangle 1 2 "solid"  "red") (rectangle 2 2 "solid" "red")) false)
(check-expect (larger? (rectangle 3 2 "solid" "red") (rectangle 2 2 "solid" "red")) true)
(check-expect (larger? (rectangle 2 2 "solid" "red") (rectangle 2 2 "solid" "red")) false)



(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2)))
  )