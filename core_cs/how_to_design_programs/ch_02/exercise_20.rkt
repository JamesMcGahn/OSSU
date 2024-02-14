;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define (string-delete str i)
(string-append (substring str 0 i)  (substring str (+ i 1)))
  )

(check-expect (string-delete "abc" 2) "ab")
(check-expect (string-delete "hamster" 3) "hamter")
