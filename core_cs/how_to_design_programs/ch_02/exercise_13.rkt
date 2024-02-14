;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (string-first s)
  (if (> (string-length s) 0) (substring s 0 1) s)
)

(check-expect (string-first "abc") "a")
(check-expect (string-first "") "")
(check-expect (string-first "two words") "t")
