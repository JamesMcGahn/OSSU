;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise_234) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 234. Create the function make-ranking, which consumes a list of ranked song titles and produces a list representation of an HTML table. Consider this example:


(define one-list
  '("Asia: Heat of the Moment"
    "U2: One"
    "The White Stripes: Seven Nation Army"))






; List-of-numbers -> ... nested list ...
; creates a row for an HTML table from l
(define (make-row l)
  (cond
    [(empty? l) '()]
    [else (cons (make-cell (first l))
                (make-row (rest l)))]))
 
; Number, String -> ... nested list ...
; creates a cell for an HTML table from a number or string
(define (make-cell n)
  (cond
    [(string? n)  `(td , n )]
    [else `(td ,(number->string n) )]
    ))
  

;List-of-Strings -> List (Number String)
;produces list of songs in rank order

(define (ranking los)
  (reverse (add-ranks (reverse los))))
 

(define (add-ranks los)
  (cond
    [(empty? los) '()]
    [else (cons (list (length los) (first los))
                (add-ranks (rest los)))]))



  

(define (make-rows los)
  (cond
    [(empty? los) `()]
    [else `(tr ,@(make-row (first los)) ,@(make-rows (rest los)))]))



(define (make-table los)
  `(table ((border "1")) ,@(make-rows los)))

         
(ranking one-list)
(make-table (ranking one-list))