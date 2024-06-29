;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_172) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 172. Design the function collapse, which converts a list of lines into a string. The strings should be separated by blank spaces (" "). 
; The lines should be separated with a newline ("\n").


(require 2htdp/batch-io)
(define text (read-words/line "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/ttt.txt"))


(define (collapse text )
  (cond
    [(empty? text) ""]
    [else (string-append (strip (first text)) (collapse (rest text)))]

  ))

(define (strip ln)
  (cond
    [(empty? ln) "\n"]
    [else (string-append (first ln) " " (strip (rest ln)))]
  )
)
(write-file "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/ttt.dat"
            (collapse (read-words/line "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/ttt.txt")))
