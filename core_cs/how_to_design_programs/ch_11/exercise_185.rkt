;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_185) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 185. You know about first and rest from BSL, but BSL+ comes with even more selectors than that. Determine the values of the following expressions:
;(first (list 1 2 3))
;
;(rest (list 1 2 3))
;
;(second (list 1 2 3))


(check-expect 1 (first (list 1 2 3)))

(check-expect (list 2 3) (rest (list 1 2 3)))

(check-expect 2 (second (list 1 2 3)))