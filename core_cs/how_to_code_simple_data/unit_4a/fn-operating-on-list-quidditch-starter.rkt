;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fn-operating-on-list-quidditch-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; quidditch-starter.rkt

; 
; PROBLEM:
; 
; Imagine that you are designing a program that will keep track of
; your favorite Quidditch teams. (http://iqasport.org/).
; 
; Design a data definition to represent a list of Quidditch teams. 
;    


;== info
; ubc
; mcgill
; team who must not be named

;= data
; "ubc"
; "mcgill"
; "team who must not be named"

;empty
;(cons "ubc" (cons "mcgill" empty))



;; ListOfString is one of
;; - empty
;; - cons String ListOfString
;; interp a list of strings

(define LOS1 empty)
(define LOS2 (cons "mcgill" empty))
(define LOS3 (cons "ubc" (cons "mcgill" empty)))

(define (fn-for-los los)
  (cond [(empty? los)(...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))
         ]
        )
  )

;;Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; compound: (cons String ListofString)
;; self-refence: (rest los) is ListOfString

; 
; PROBLEM:
; 
; We want to know whether your list of favorite Quidditch teams includes
; UBC! Design a function that consumes ListOfString and produces true if 
; the list includes "UBC".
; 

;; ListOfString -> Boolean
;; product true if los includes "UBC"

(check-expect (contains-ubc? empty) false)
(check-expect (contains-ubc? (cons "mcgill" empty)) false)
(check-expect (contains-ubc? (cons "ubc" empty)) true)
(check-expect (contains-ubc? (cons "mcgill" (cons "ubc" empty))) true)

;(define (contains-ubc? los) false) stub



(define (contains-ubc? los)
  (cond [(empty? los) false]
        [else
         (if (string=? (first los) "ubc") true
              (contains-ubc? (rest los)))
         ]
        )
  )











