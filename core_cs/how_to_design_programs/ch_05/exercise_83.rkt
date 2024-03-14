;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_83) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t




; Editor -> Image
; produce the image of the text and cursor location

(check-expect (render (make-editor "a" "b")) (overlay/align "left" "center"
               (beside 
               (text "a" 16 "black")
               (rectangle 1 20 "solid" "red")
               (text "b" 16 "black")
               )
               (empty-scene 200 20)))

(check-expect (render (make-editor "" "badsasdafsa")) (overlay/align "left" "center"
               (beside 
               (text "" 16 "black")
               (rectangle 1 20 "solid" "red")
               (text "badsasdafsa" 16 "black")
               )
               (empty-scene 200 20)))

(check-expect (render (make-editor "abcdefg" "")) (overlay/align "left" "center"
               (beside 
               (text "abcdefg" 16 "black")
               (rectangle 1 20 "solid" "red")
               (text "" 16 "black")
               )
               (empty-scene 200 20)))


(define (render editor)

(overlay/align "left" "center"
               (beside 
               (text (editor-pre editor) 16 "black")
               (rectangle 1 20 "solid" "red")
               (text (editor-post editor) 16 "black")
               )
               (empty-scene 200 20))
  )

