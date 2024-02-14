;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_27) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define BASE_ATTENDENCE 120)
(define BASE_TICKET_PRICE 5)
(define BASE_PEOPLE 15)
(define CHANGE_BY_10 .1)
(define FIXED_COST 180)
(define VAR_COST .04)


(define (attendees ticket-price)
  (- BASE_ATTENDENCE (* (- ticket-price BASE_TICKET_PRICE) (/ BASE_PEOPLE CHANGE_BY_10))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* VAR_COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))