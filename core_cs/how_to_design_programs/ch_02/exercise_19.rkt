;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (string-insert str i)
   (string-append (substring str 0 i) "_" (substring str i))
)

(check-expect (string-insert "cheese" 1) "c_heese")
(check-expect (string-insert "" 0) "_")
(check-expect (string-insert "hamster" 7) "hamster_")