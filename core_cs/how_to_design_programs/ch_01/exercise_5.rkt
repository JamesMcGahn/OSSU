;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example_5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define TREESIZE 100)


(overlay/align/offset "center" "bottom"
(overlay/align/offset "center" "bottom"
(triangle TREESIZE  "solid" "green")
0 (/ TREESIZE 2)
(triangle TREESIZE  "solid" "green")
)
0 (/ TREESIZE 2)
(rectangle (/ TREESIZE 2) (/ TREESIZE 2) "solid" "brown")
)