;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_189) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 189. Here is the function search:

; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first alon) n)
              (search n (rest alon)))]))
;It determines whether some number occurs in a list of numbers. The function may have to traverse the
;entire list to find out that the number of interest isn’t contained in the list.
;Develop the function search-sorted, which determines whether a number occurs in a sorted list of numbers.
;The function must take advantage of the fact that the list is sorted.

(check-expect (sort (list 1 3 2 5 2)) (list 5 3 2 2 1))

(define (sort l)
 (cond
   [(empty? l) empty]
   [else (sort-ls (first l) (sort (rest l)))]))


(define (sort-ls f l)
  (cond
    [(empty? l) (cons f empty)]
    [else (if (> f (first l)) (cons f l) (cons (first l) (sort-ls f (rest l))))]
   )
  )

(define (sort-search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first (sort alon)) n)
              (search n (rest (sort alon))))]))

(check-expect (sort-search 9 (list 1 3 2 5 9)) true)
(check-expect (sort-search 1 (list 1 3 2 5 9)) true)
(check-expect (sort-search 10 (list 1 3 2 5 9)) false)
(check-expect (sort-search 10 empty ) false)


