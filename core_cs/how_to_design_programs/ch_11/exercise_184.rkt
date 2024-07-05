;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_184) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 184. Determine the values of the following expressions:
;(list (string=? "a" "b") #false)

;(list (+ 10 20) (* 10 20) (/ 10 20))

;(list "dana" "jane" "mary" "laura")


(check-expect (list false false ) (list (string=? "a" "b") #false))

(check-expect (list 30 200 .5 ) (list (+ 10 20) (* 10 20) (/ 10 20)))

(check-expect (list "dana" "jane" "mary" "laura") (list "dana" "jane" "mary" "laura"))