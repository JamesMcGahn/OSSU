;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define BASE_ATTENDENCE 120)
(define BASE_TICKET_PRICE 5)
(define BASE_PEOPLE 15)
(define CHANGE_BY_10 .1)
(define FIXED_COST 0)
(define VAR_COST .04)


(define (attendees ticket-price)
  (- BASE_ATTENDENCE (* (- ticket-price BASE_TICKET_PRICE) (/ BASE_PEOPLE CHANGE_BY_10))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* VAR_COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)

(define (profit2 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(profit2 1)
(profit2 2)
(profit2 3)
(profit2 4)
(profit2 5)
