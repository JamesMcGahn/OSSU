;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_84) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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


; KeyEvent Editor -> Editor
; adds a single-character KeyEvent ke to the end of the pre field of ed, unless ke denotes the backspace ("\b") key.
; In that case, it deletes the character immediately to the left of the cursor (if there are any).
; The function ignores the tab key ("\t") and the return key ("\r").
; left or right ke moves cursor to the left or right

(check-expect (edit "\b" (make-editor "aassd" "vvasd")) (make-editor "aass" "vvasd"))
(check-expect (edit "\t" (make-editor "aassd" "vvasd")) (make-editor "aassd" "vvasd"))
(check-expect (edit "\r" (make-editor "aassd" "vvasd")) (make-editor "aassd" "vvasd"))
(check-expect (edit "left" (make-editor "aassd" "vvasd")) (make-editor "aass" "dvvasd"))
(check-expect (edit "left" (make-editor "" "dvvasd")) (make-editor "" "dvvasd"))
(check-expect (edit "right" (make-editor "aassd" "vvasd")) (make-editor "aassdv" "vasd"))
(check-expect (edit "right" (make-editor "aassdv" "")) (make-editor "aassdv" ""))
(check-expect (edit "a" (make-editor "aassdva" "")) (make-editor "aassdvaa" ""))
(check-expect (edit "a" (make-editor "" "")) (make-editor "a" ""))
(check-expect (edit "a" (make-editor "a" "dd")) (make-editor "aa" "dd"))

(define (edit ke ed)
  (cond [(string=? "\b" ke) (make-editor (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1)) (editor-post ed) )]
        [(or (string=? "\t" ke) (string=? "\r" ke)) ed]
        [(and (> (string-length (editor-pre ed)) 0) (string=? "left" ke))  (make-editor (substring (editor-pre ed) 0 (- (string-length (editor-pre ed)) 1)) (string-append (substring (editor-pre ed) (- (string-length (editor-pre ed)) 1) ) (editor-post ed) ))]
        [(and (> (string-length (editor-post ed)) 0) (string=? "right" ke)) (make-editor (string-append (editor-pre ed) (substring (editor-post ed) 0 1)) (substring (editor-post ed) 1))]
        [(not (or (string=? "left" ke) (string=? "right" ke) )) (make-editor (string-append (editor-pre ed) ke) (editor-post ed))]
        [else ed]
        )
  )

