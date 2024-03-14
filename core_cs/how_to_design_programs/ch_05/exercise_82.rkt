;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_82) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; CharString
; CharString is one of
; 1String
; false

(define-struct three-word [first second third])

; A three-word is a structure
; (make-three-word CharString CharString CharString)
; interp (make-midnight CharString CharString CharString) means
; first is the first char in the word
; second is the second char in the word
; third is the third chard in the word

;CharString->Charstring
; produces a word that indicates where the given ones agree and disagree.
; retains the content of the structure fields if the two agree; otherwise it places #false in the field of the resulting word.
(check-expect (compare-word (make-three-word "a" "b" "c") (make-three-word "a" "b" "c")) (make-three-word "a" "b" "c"))
(check-expect (compare-word (make-three-word "d" "b" "c") (make-three-word "a" "b" "c")) (make-three-word false "b" "c"))
(check-expect (compare-word (make-three-word "a" "a" "c") (make-three-word "a" "b" "c")) (make-three-word "a" false "c"))
(check-expect (compare-word (make-three-word "a" "a" "c") (make-three-word "a" "b" "p")) (make-three-word "a" false false))
(check-expect (compare-word (make-three-word "a" "a" "c") (make-three-word "d" "r" "p")) (make-three-word false false false))

(define (compare-word w1 w2)
  (make-three-word (if (string=? (three-word-first w1) (three-word-first w2))  (three-word-first w1) false)
             (if (string=? (three-word-second w1) (three-word-second w2))  (three-word-second w1) false)
             (if (string=? (three-word-third w1) (three-word-third w2))  (three-word-third w1) false)
             )
  )

  