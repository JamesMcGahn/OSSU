;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname exercise_134) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define names (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '())))))))
)

; ListofStrings String -> Boolean
; determines whether String is in list


(check-expect (contains names "John") false)
(check-expect (contains names "Findler") true)
(check-expect (contains names "Friedman") true)


(define (contains lst name)
  (cond
    [(empty? lst) false]
    [(string=? (first lst) name) true]
    [else (contains (rest lst) name)]
    )
  )