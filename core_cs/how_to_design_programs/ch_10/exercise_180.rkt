;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_180) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
; Exercise 180. Design editor-text without using implode. 

(require 2htdp/image)


(define HEIGHT 20) ; the height of the editor 
(define WIDTH 200) ; its width 
(define FONT-SIZE 16) ; the font size 
(define FONT-COLOR "black") ; the font color 
 
(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)

;(string-append (implode (rev pre))
;              (implode post))


(define (create-editor a b)
  (make-editor (rev a) b))

  
(define (rev lst)
  (cond
    [(empty? lst) empty]
    [else  (add-to (rev (rest lst)) (first lst))]
        )
  )

(define (add-to rest-ls first-ls)
    (cond
    [(empty? rest-ls) (cons first-ls empty)]
    [else (cons (first rest-ls) (add-to (rest rest-ls)  first-ls))]))

(check-expect (create-editor (explode "abc") (explode "efg")) (make-editor (explode "cba") (explode "efg")))



;Editor->Image
; renders an editor as an image of the two texts 
; separated by the cursor 

(check-expect (render (make-editor (list "a") (list "b"))) (overlay/align "left" "center"
                                                            (beside 
                                                             (text "a" 16 "black")
                                                             (rectangle 1 20 "solid" "red")
                                                             (text "b" 16 "black")
                                                             )
                                                            (empty-scene 200 20)))

(check-expect (render (make-editor empty (explode "badsasdafsa"))) (overlay/align "left" "center"
                                                                     (beside 
                                                                      (text "" 16 "black")
                                                                      (rectangle 1 20 "solid" "red")
                                                                      (text "badsasdafsa" 16 "black")
                                                                      )
                                                                     (empty-scene 200 20)))

(check-expect (render (make-editor (rev (explode "abcdefg")) empty)) (overlay/align "left" "center"
                                                                 (beside 
                                                                  (text "abcdefg" 16 "black")
                                                                  (rectangle 1 20 "solid" "red")
                                                                  (text "" 16 "black")
                                                                  )
                                                                 (empty-scene 200 20)))

(define (render editor)

  (overlay/align "left" "center"
                 (beside 
                  (text (if (empty? (editor-pre editor)) "" (implodes (rev (editor-pre editor)))) 16 "black")
                  (rectangle 1 20 "solid" "red")
                  (text (if (empty? (editor-post editor)) "" (implodes (editor-post editor))) 16 "black") 
                  )
                 (empty-scene 200 20))
  )

; List -> String
; turns list into string

(define (implodes lst)
(cond
  [(empty? lst) ""]
  [else (string-append (first lst) (implodes (rest lst)))]
))


;
(define (editor-delete ls)
  (rest ls)
)

; Editor -> Editor
; moves the cursor position one 1String left, 
; if possible
(define (editor-left ed)
  (make-editor  (rest (editor-pre ed)) (append (list (first (editor-pre ed))) (editor-post ed) ))
)

; Editor -> Editor
; moves the cursor position one 1String left, 
; if possible
(define (editor-right ed)
  (make-editor (append (list (first (editor-post ed))) (editor-pre ed) ) (rest (editor-post ed)))
)


(define (editor-add ed key)
  (make-editor (append (list key) (editor-pre ed)) (editor-post ed)))



; Editor KeyEvent -> Editor
; deals with a key event, given some editor

(define (edit ed ke )
  (cond [(and (>  (length (editor-pre ed)) 0) (string=? "\b" ke)) (make-editor (editor-delete (editor-pre ed))  (editor-post ed))]
        [(and (>  (length (editor-pre ed)) 0) (string=? "left" ke))  (editor-left ed) ]
        [(and (>  (length (editor-post ed)) 0) (string=? "right" ke)) (editor-right ed) ]
        [
          (not (or (string=? "left" ke) (string=? "right" ke) (string=? "\b" ke) (string=? "\t" ke) (string=? "\r" ke)))
          
          
          (editor-add ed ke)]
        [else ed]        
        )
  )


(define (tock ws) ws)

;; WS -> WS
;; start the world with (main start)
;;
(define (main ws)
 (big-bang ws ; WS
 (on-tick tock) ; WS -> WS
 (to-draw render) ; WS -> Image
 (on-key edit))) ; WS KeyEvent -> W