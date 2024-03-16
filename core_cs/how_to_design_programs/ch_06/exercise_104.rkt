;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_104) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct auto (passengers license mpg))
; auto is a structure
; (make-auto Number String Number)
; number of passengers the auto can carry
; license is the license plate of the auto
; mpg is the miles per gallon

(define-struct bus (passengers license mpg))
; bus is a structure
; (make-bus Number String Number)
; number of passengers the bus can carry
; license is the license plate of the bus
; mpg is the miles per gallon

(define-struct van (passengers license mpg))
; van is a structure
; (make-van Number String Number)
; number of passengers the van can carry
; license is the license plate of the van
; mpg is the miles per gallon

(define-struct SUV (passengers license mpg))
; SUV is a structure
; (make-SUV Number String Number)
; number of passengers the SUV can carry
; license is the license plate of the SUV
; mpg is the miles per gallon

(define (fn-for-vechile v)
  (cond [(auto? v) (... (auto-passengers v) (auto-license v) (auto-mpg v))]
        [(bus? v) (... (bus-passengers v) (bus-license v) (bus-mpg v))]
        [(van? v) (... (van-passengers v) (van-license v) (van-mpg v))]
        [(SUV? v) (... (SUV-passengers v) (SUV-license v) (SUV-mpg v))]
        ))