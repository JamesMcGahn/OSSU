;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_66) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct movie [title producer year])

(define-struct person [name hair eyes phone])

(define-struct pet [name number])

(define-struct CD [artist title price])

(define-struct sweater [material size producer])

(make-movie "Movie Title" "Bob Producer" 2023)
(make-person "Bob" "Black" "Blue" 222222222)
(make-pet "Frank" 234)
(make-CD "Band" "Sample Title" 23.34)
(make-sweater "nylon" "xl" "xyz")

