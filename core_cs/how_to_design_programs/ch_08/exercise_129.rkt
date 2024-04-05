;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_129) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define planets (cons "sun" (cons "mercury" (cons "venus" (cons "earth" (cons "mars" (cons "jupiter" (cons "saturn" (cons "uranus" (cons "neptune" (cons "pluto" empty)))))))))))

(define meal (cons "steak" (cons "fries" (cons "soda" (cons "bread" (cons "corn" empty))))))

(define colors (cons "blue" (cons "red" (cons "yellow" (cons "green" empty)))))

planets
meal
colors