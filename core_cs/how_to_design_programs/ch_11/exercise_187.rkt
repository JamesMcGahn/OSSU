;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_187) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 187. Design a program that sorts lists of game players by score:

(define-struct gp [name score])
; A GamePlayer is a structure: 
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who 
; scored a maximum of s points

(define (sort-players players)
  (cond
    [(empty? players) empty]
    [(cons? players) (rank (first players) (sort-players (rest players)))]
         
))

(define (rank p1 pl)
  (cond 
    [(empty? pl) (cons p1 empty) ]
    [else (if (> (gp-score p1) (gp-score (first pl))) (cons p1 pl) (cons (first pl) (rank p1  (rest pl ))))]
        
  ))

(check-expect (sort-players (list (make-gp "a" 1) (make-gp "b" 2) (make-gp "c" 3) (make-gp "d" 4))) (list (make-gp "d" 4) (make-gp "c" 3) (make-gp "b" 2) (make-gp "a" 1)))
(check-expect (sort-players (list (make-gp "a" 7) (make-gp "b" 2) (make-gp "c" 3) (make-gp "d" 4))) (list (make-gp "a" 7) (make-gp "d" 4) (make-gp "c" 3) (make-gp "b" 2) ))