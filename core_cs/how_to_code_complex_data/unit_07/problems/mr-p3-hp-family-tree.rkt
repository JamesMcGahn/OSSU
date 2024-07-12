;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname hp-family-tree-starter) (read-case-sensitive #t) (teachpacks ((lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "batch-io.rkt" "teachpack" "2htdp")) #f)))

;; hp-family-tree-starter.rkt




;In this problem set you will represent information about descendant family 
;trees from Harry Potter and design functions that operate on those trees.

;To make your task much easier we suggest two things:
;  - you only need a DESCENDANT family tree
;  - read through this entire problem set carefully to see what information 
;    the functions below are going to need. Design your data definitions to
;    only represent that information.
;  - you can find all the information you need by looking at the individual 
;    character pages like the one we point you to for Arthur Weasley.

;;;;PROBLEM 1:

;Design a data definition that represents a family tree from the Harry Potter 
;wiki, which contains all necessary information for the other problems.  You 
;will use this data definition throughout the rest of the homework.



;; Data definitions:

; Wizard is (make-wiz String String String ListOfWizard)
;interp a family tree of a wizard
;name is the name of the wizard
; wand the type of wood their wand is made of, empty string if not known
; patronus is the wizards patronus
; children is a ListofWizards


;ListofWizards
;interp a list of Wizard
; empty
; (cons Wizard ListofWizards)

(define-struct wizard (name wand patronus children))

#;
(define (fn-for-element e)
  (... (wizard-name e)    ;String
       (wizard-wand e)    ;String
       (wizard-patronus e)    ;String
       (fn-for-loe (wizard-children e))))
#;
(define (fn-for-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (... (fn-for-element (first loe))
              (fn-for-loe (rest loe)))])) 


;;;;;;;;PROBLEM 2: 
;
;Define a constant named ARTHUR that represents the descendant family tree for 
;Arthur Weasley. You can find all the infomation you need by starting 
;at: http://harrypotter.wikia.com/wiki/Arthur_Weasley.
;
;You must include all of Arthur's children and these grandchildren: Lily, 
;Victoire, Albus, James.
;
;Note that on the Potter wiki you will find a lot of information. But for some 
;people some of the information may be missing. Enter that information with a 
;special value of "" (the empty string) meaning it is not present. Don't forget
;this special value when writing your interp.


(define ARTHUR
  (make-wizard "Arthur" "" "Weasel"
            (list (make-wizard "Bill" "" "" (list (make-wizard "Victoire"  "" "" empty)      
                                               (make-wizard "Dominique" "" "" empty)   
                                               (make-wizard "Louis"     "" "" empty)))   
                  (make-wizard "Charlie" "ash" "" empty)
                  (make-wizard "Percy" "" "" (list (make-wizard "Molly" "" "" empty)          
                                                (make-wizard "Lucy"  "" "" empty)))
                  (make-wizard "Fred"    ""    "" empty)
                  (make-wizard "George"  ""    "" (list (make-wizard "Fred" "" "" empty)     
                                                     (make-wizard "Roxanne"  "" "" empty)))
                  (make-wizard "Ron"     "ash" "Jack Russell Terrier" (list (make-wizard "Rose" "" "" empty)  
                                                                         (make-wizard "Hugo" "" "" empty)))
                  (make-wizard "Ginny"   ""    "horse" 
                            (list (make-wizard "James" "" "" empty)
                                  (make-wizard "Albus" "" "" empty)
                                  (make-wizard "Lily"  "" "" empty))))))

;;;;;PROBLEM 3:

;Design a function that produces a pair list (i.e. list of two-element lists)
;of every person in the tree and his or her patronus. For example, assuming 
;that HARRY is a tree representing Harry Potter and that he has no children
;(even though we know he does) the result would be: (list (list "Harry" "Stag")).
;
;You must use ARTHUR as one of your examples.

(check-expect (fn-for-lop  empty) empty)
(check-expect (fn-for-pat (make-wizard "a" "b" "c" empty)) (list (list "a" "c")))
(check-expect (fn-for-pat ARTHUR)
              (list
               (list "Arthur" "Weasel")
               (list "Bill" "")
               (list "Victoire" "")
               (list "Dominique" "")
               (list "Louis" "")
               (list "Charlie" "")
               (list "Percy" "")
               (list "Molly" "")
               (list "Lucy" "")
               (list "Fred" "")
               (list "George" "")
               (list "Fred" "")
               (list "Roxanne" "")
               (list "Ron" "Jack Russell Terrier")
               (list "Rose" "")
               (list "Hugo" "")
               (list "Ginny" "horse")
               (list "James" "")
               (list "Albus" "")
               (list "Lily" "")))


(define (fn-for-pat e)
       (cons (list (wizard-name e) (wizard-patronus e)) (fn-for-lop (wizard-children e))))  
      

(define (fn-for-lop loe)
  (cond [(empty? loe) empty]
        [else
         (append (fn-for-pat (first loe))
              (fn-for-lop (rest loe)))])) 


;PROBLEM 4:
;
;Design a function that produces the names of every person in a given tree 
;whose wands are made of a given material. 

;You must use ARTHUR as one of your examples.


(check-expect (find-low  "x" empty) empty)
(check-expect (find-wand "x" (make-wizard "a" "b" "c" empty) ) empty)
(check-expect (find-wand "b" (make-wizard "a" "b" "c" empty) ) (list "a"))                                           
(check-expect (find-wand "ash" ARTHUR ) (list "Charlie" "Ron"))

(define (find-wand s e)
  (if (string=? (wizard-wand e)  s)   ;String
      (cons (wizard-name e) (find-low s (wizard-children e)))
      (find-low s (wizard-children e))
      ))

(define (find-low s loe)
  (cond [(empty? loe) empty]
        [else
         (append  (find-wand s (first loe)) (find-low  s (rest loe)) )]
            
             )) 

