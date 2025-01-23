;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise_231) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Exercise 231. Eliminate quote in favor of list from these expressions:
'(1 "a" 2 #false 3 "c")

'()

;; and this table-like shape:
'(("alan" 1000)
  ("barb" 2000)
  ("carl" 1500))

(list 1 "a" 2 #false 3 "c")
(list )
(list (list "alan" 1000) (list "barb" 2000) (list "carl" 1500) )