;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 2-One-Of-p2-merge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; merge-starter.rkt



;;Problem:
;;
;;Design the function merge. It consumes two lists of numbers, which it assumes are 
;;each sorted in ascending order. It produces a single list of all the numbers, 
;;also sorted in ascending order. 

;;Your solution should explicitly show the cross product of type comments table, 
;;filled in with the values in each case. Your final function should have a cond 
;;with 3 cases. You can do this simplification using the cross product table by 
;;recognizing that there are subtly equal answers. 

;;Hint: Think carefully about the values of both lists. You might see a way to 
;;change a cell content so that 2 cells have the same value.

                                        ;lstb
         ;--------------------------------|----------|
         ;                 |    empty        cons
         ;-----------------|--------------|----------|
         ;    empty             empty        lstb
;lsta    ;-----------------|--------------|----------|
         ;   cons               lsta        (if (< (first lsta) (first lstb)) (cons (first lsta) (sort-lst (rest lsta) lstb)) (cons (first lstb) (sort-lst lsta (rest lstb)))
         ;-------------------------------------------
;
(check-expect (sort-lst empty empty) empty)
(check-expect (sort-lst empty (list 1)) (list 1))
(check-expect (sort-lst (list 1) empty) (list 1))
(check-expect (sort-lst (list 1 2 3 4) (list 2 4 5 6)) (list 1 2 2  3 4 4 5 6))
(check-expect (sort-lst (list 2 4 5 6) (list 1 2 3 4) ) (list 1 2 2  3 4 4 5 6))


(define (sort-lst lsta lstb)
  (cond [(empty? lsta) lstb]
        [(empty? lstb) lsta]
        [else (if (< (first lsta) (first lstb)) (cons (first lsta) (sort-lst (rest lsta) lstb)) (cons (first lstb) (sort-lst lsta (rest lstb)))  ) ]
        )
  )