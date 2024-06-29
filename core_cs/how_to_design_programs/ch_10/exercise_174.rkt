;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_174) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 174. Design a program that encodes text files numerically. Each letter in a word should be encoded as a numeric three-letter string with a value between 0 and 256.

(require 2htdp/batch-io)

(define (encode text )
  (cond
    [(empty? text) ""]
    [else (string-append (strip (first text)) (encode (rest text)))]

  ))

(define (strip ln)
  (cond
    [(empty? ln) "\n"]
    [else (string-append (exploded (explode (first ln))) " " (strip (rest ln)))]
  )
)

(define (exploded word)
  (cond
    [(empty? word) ""]
    [else (string-append (encode-letter (first word)) (exploded (rest word)))]))


(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))
 
; 1String -> String
; converts the given 1String into a String
 

 
(define (code1 c)
  (number->string (string->int c)))


(write-file "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/ttt3.txt"
            (encode (read-words/line "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/ttt.txt")))
