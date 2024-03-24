;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_115) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Any -> Boolean
; is the given value an element of TrafficLight
(define (light? x p)
  (cond
    [(and (string? x) (or (string=? "red" x)
                     (string=? "green" x)
                     (string=? "yellow" x))) true]
    [else (error (string-append (if (= p 1)"First" "Second") " argument passed is not one of TrafficLight"))]))


(define MESSAGE
  "traffic light expected, given some other value")
 
; Any Any -> Boolean
; are the two values elements of TrafficLight and, 
; if so, are they equal
 
(check-expect (light=? "red" "red") #true)
(check-expect (light=? "red" "green") #false)
(check-expect (light=? "green" "green") #true)
(check-expect (light=? "yellow" "yellow") #true)
(check-error  (light=? 9 "yellow") "First argument passed is not one of TrafficLight")
(check-error  (light=? "cheese" "yellow") "First argument passed is not one of TrafficLight")
(check-error  (light=? "red" true) "Second argument passed is not one of TrafficLight")
 
(define (light=? a-value another-value)
  (if (and (light? a-value 1) (light? another-value 2))
      (string=? a-value another-value)
      (error MESSAGE)))