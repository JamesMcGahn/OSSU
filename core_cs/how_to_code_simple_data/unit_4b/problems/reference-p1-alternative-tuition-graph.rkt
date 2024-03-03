;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname reference-p1-alternative-tuition-graph) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; alternative-tuition-graph-starter.rkt

; 
; Consider the following alternative type comment for Eva's school tuition 
; information program. Note that this is just a single type, with no reference, 
; but it captures all the same information as the two types solution in the 
; videos.
; 
; (define-struct school (name tuition next))
; ;; School is one of:
; ;;  - false
; ;;  - (make-school String Natural School)
; ;; interp. an arbitrary number of schools, where for each school we have its
; ;;         name and its tuition in USD
; 
; (A) Confirm for yourself that this is a well-formed self-referential data 
;     definition.
; 
; (B) Complete the data definition making sure to define all the same examples as 
;     for ListOfSchool in the videos.
; 
; (C) Design the chart function that consumes School. Save yourself time by 
;     simply copying the tests over from the original version of chart.
; 
; (D) Compare the two versions of chart. Which do you prefer? Why?
;


;; == Contstants

(define FONT-SIZE 24)
(define FONT-COLOR "red")

(define Y-SCALE 1/200)
(define BAR-WIDTH 30)
(define BAR-COLOR "lightblue")

;; == DATA Definitions

(define-struct school (name tuition next))
;; School is (make-school String Natural)
;; interp name is the schools name, tuition is the intl students tuition in USD
;; next is the next school

(define S1 (make-school "sch1" 30000 (make-school "sch3" 30000 false)))
(define S2 (make-school "sch2" 45000 (make-school "sch4" 30000 false)))


(define (fn-for-school s)
  (... (school-name s)
       (school-tuition s)
       ))

;; template rules
;; - compound - (make-school String Natural)
;; - atomic distinct - false
;;  - atomic non-distinct: (school-name s) is String
;;  - atomic non-distinct: (school-tuition s) is Natural
;;  - self-reference: (school-next s) is School



;; === Functions

;; School -> Image
;; produce bar chart showing names and tuitions of consumed schools

(check-expect (chart false) (square 0 "solid" "white"))
(check-expect  (chart (make-school "s1" 8000 false)) (beside/align "bottom"
                                                                         (overlay/align "center" "bottom"
                                                                                        (rotate 90 (text "s1" FONT-SIZE FONT-COLOR))
                                                                                        (rectangle BAR-WIDTH (* 8000 Y-SCALE)  "outline" "black")
                                                                                        (rectangle BAR-WIDTH (* 8000 Y-SCALE)  "solid" BAR-COLOR))
                                                                         (square 0 "solid" "white")))

(check-expect (chart  (make-school "s2" 10000 (make-school "s1" 8000 false))) (beside/align "bottom"
                                                                                                         (overlay/align "center" "bottom"
                                                                                                                        (rotate 90 (text "s2" FONT-SIZE FONT-COLOR))
                                                                                                                        (rectangle BAR-WIDTH (* 10000 Y-SCALE)  "outline" "black")
                                                                                                                        (rectangle BAR-WIDTH (* 10000 Y-SCALE)  "solid" BAR-COLOR))
                                                                                                         (overlay/align "center" "bottom"
                                                                                                                        (rotate 90 (text "s1" FONT-SIZE FONT-COLOR))
                                                                                                                        (rectangle BAR-WIDTH (* 8000 Y-SCALE)  "outline" "black")
                                                                                                                        (rectangle BAR-WIDTH (* 8000 Y-SCALE)  "solid" BAR-COLOR))
                                                                                                         (square 0 "solid" "white")))



; stub (define (chart s) (square 0 "solid" "white"))

(define (chart s)
  (cond [(false? s) (square 0 "solid" "white")]
        [else (beside/align "bottom" (make-bar (school-name s)(school-tuition s))
                            (chart (school-next s)))]))


;School-Name School-Tuition -> Image
; produce the bar for a single school in the bar chart

(check-expect (make-bar  "s1" 8000 )
              (overlay/align "center" "bottom"
                             (rotate 90 (text "s1" FONT-SIZE FONT-COLOR))
                             (rectangle BAR-WIDTH (* 8000 Y-SCALE)  "outline" "black")
                             (rectangle BAR-WIDTH (* 8000 Y-SCALE)  "solid" BAR-COLOR)))
(check-expect (make-bar  "s5" 33000 ) 
              (overlay/align "center" "bottom"
                             (rotate 90 (text "s5" FONT-SIZE FONT-COLOR))
                             (rectangle BAR-WIDTH (* 33000 Y-SCALE)  "outline" "black")
                             (rectangle BAR-WIDTH (* 33000 Y-SCALE)  "solid" BAR-COLOR)))


(define (make-bar n t)
  (overlay/align "center" "bottom"
                 (rotate 90 (text n FONT-SIZE FONT-COLOR))
                 (rectangle BAR-WIDTH (* t Y-SCALE)  "outline" "black")
                 (rectangle BAR-WIDTH (* t Y-SCALE)  "solid" BAR-COLOR))
  )