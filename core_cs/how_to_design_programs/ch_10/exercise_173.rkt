;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_173) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 173. Design a program that removes all articles from a text file. 
;The program consumes the name n of a file, reads the file, removes the articles, 
;and writes the result out to a file whose name is the result of concatenating "no-articles-" with n. 
;For this exercise, an article is one of the following three words: "a", "an", and "the".


(require 2htdp/batch-io)
(require racket/path)	


(define (read n)
(write-file (string-append "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/" "no-articles-" (some-system-path->string (file-name-from-path n))) (collapse (read-words/line n)))  
)

(define (collapse text )
  (cond
    [(empty? text) ""]
    [else (string-append (strip (first text)) (collapse (rest text)))]

    ))

(define (strip ln)
  (cond
    [(empty? ln) "\n"]
    [(or (string=? "a" (first ln)) (string=? "an" (first ln)) (string=? "the" (first ln)))  (strip (rest ln))]
    [else (string-append (first ln) " " (strip (rest ln)))]
    )
  )

(read "/Users/jamesmcgahn/Desktop/Code Projects/OSSU/core_cs/how_to_design_programs/ch_10/ttt2.txt")