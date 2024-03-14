;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_77) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct movie [title producer year])

; A movie is a structure
; (make-phone String String Number)
; interp (make-movie String String Number) means
; title is the title of the movie
; producer of the movie
; year of the movie released 4 digits

(define-struct person [name hair eyes phone])

; A person is a structure
; (make-person String String String Number)
; interp (make-person String String String Number) means
; name is the name of the person
; hair is the color of the persons hair
; eyes is the color of the person eyes
; phone is the 10 digit number of the person

(define-struct pet [name number])

; A pet is a structure
; (make-pet String String String Number)
; interp (make-pet String Number) means
; name is the name of the pet
; number is the license number of the pet [0:9] 3 digits


(define-struct CD [artist title price])

; A CD is a structure
; (make-CD String String  Number)
; interp (make-person String String Number) means
; artist is the artist name of the CD
; title is the title of the CD
; price is the price of the CD 

(define-struct sweater [material size producer])

; A sweater is a structure
; (make-sweater String String String )
; interp (make-sweater String String String) means
; material is the material the sweater is made of
; size is the size of the sweater
; producer is the company who made the sweater