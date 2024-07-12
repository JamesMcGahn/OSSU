;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname backtracking_search_fs-v3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; fs-starter.rkt (type comments and examples)
;; fs-v1.rkt (complete data-definition plus function problems)
;; fs-v2.rkt (complete data-definition and sum-data function)
;; fs-v3.rkt (complete data-definition, sum-data function and all-names function)

;; Data definitions:

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.

;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements


(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))
#;
(define (fn-for-element e)
  (... (elt-name e)    ;String
       (elt-data e)    ;Integer
       (fn-for-loe (elt-subs e))))
#;
(define (fn-for-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (... (fn-for-element (first loe))
              (fn-for-loe (rest loe)))])) 


;; Functions:

;; *****  PROBLEM ************
;;
;;Design a function that consumes String and Element and looks for a data element with the given 
;;name. If it finds that element it produces the data, otherwise it produces false.


;; String Element -> Integer or false
;; search the tree for element with given name- produce data if found, false otherwise


(check-expect (find-loe "F3" empty) false)
(check-expect (find-el "F3" F1) false)
(check-expect (find-el "F3" F3) 3)
(check-expect (find-el "F3" D4) false)
(check-expect (find-el "F1" D4) 1)
(check-expect (find-el "F2" D4) 2)
(check-expect (find-el "D4" D4) 0)


(define (find-el s e)
  (if (string=? (elt-name e)  s)   ;String
      (elt-data e)    ;Integer
      (find-loe s (elt-subs e))))

(define (find-loe s loe)
  (cond [(empty? loe) false]
        [else
         (if (not (false? (find-el s (first loe))))
             (find-el s (first loe))
             (find-loe  s (rest loe)))])) 





;; *****  PROBLEM ************

;;Design a function that consumes Element and produces a rendering of the tree. For example: 

;; (render-tree D6) should produce something like the following.


;;HINTS:
;;  - This function is not very different than the first two functions above.
;;  - Keep it simple! Start with a not very fancy rendering like the one above.
;;    Once that works you can make it more elaborate if you want to.
;;  - And... be sure to USE the recipe. Not just follow it, but let it help you.
;;    For example, work out a number of examples BEFORE you try to code the function. 
;; ***********************************************


