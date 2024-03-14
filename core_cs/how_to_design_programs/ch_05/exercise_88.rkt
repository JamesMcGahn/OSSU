;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_88) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; VCat is a structure
(define-struct VCat x happiness)
; (make-Vcat Number Number)
; x is the x position on the scene
; happiness is the level of cats happiness

(define c1 (make-VCat 0 100))
(define c2 (make-VCat 15 50))