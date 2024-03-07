;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders


;; Constants:

(define WIDTH  300)
(define HEIGHT 500)

(define INVADER-X-SPEED 1.5)  ;speeds (not velocities) in pixels per tick
(define INVADER-Y-SPEED 1.5)
(define TANK-SPEED 20)
(define MISSILE-SPEED 10)

(define HIT-RANGE 10)

(define INVADE-RATE 100)

(define BACKGROUND (empty-scene WIDTH HEIGHT))

(define INVADER
  (overlay/xy (ellipse 10 15 "outline" "blue")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "blue")))            ;saucer

(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "black")       ;tread center
                       (ellipse 30 10 "solid" "green"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "black")       ;gun
                     (rectangle 20 10 "solid" "black"))))   ;main body

(define TANK-HEIGHT/2 (/ (image-height TANK) 2))

(define MISSILE (ellipse 5 15 "solid" "red"))

(define MTS (rectangle WIDTH HEIGHT "solid" "light blue"))

;; Data Definitions:

(define-struct game (invaders missiles tank tick))
;; Game is (make-game  (listof Invader) (listof Missile) Tank)
;; interp. the current state of a space invaders game
;;         with the current invaders, missiles and tank position

;; Game constants defined below Missile data definition

#;
(define (fn-for-game s)
  (... (fn-for-loinvader (game-invaders s))
       (fn-for-lom (game-missiles s))
       (fn-for-tank (game-tank s))))



(define-struct tank (x dir))
;; Tank is (make-tank Number Integer[-1, 1])
;; interp. the tank location is x, HEIGHT - TANK-HEIGHT/2 in screen coordinates
;;         the tank moves TANK-SPEED pixels per clock tick left if dir -1, right if dir 1

(define T0 (make-tank (/ WIDTH 2) 1))   ;center going right
(define T1 (make-tank 50 1))            ;going right
(define T2 (make-tank 50 -1))           ;going left

#;
(define (fn-for-tank t)
  (... (tank-x t) (tank-dir t)))


(define-struct invader (x y dx))
;; Invader is (make-invader Number Number Number)
;; interp. the invader is at (x, y) in screen coordinates
;;         the invader along x by dx pixels per clock tick

(define I1 (make-invader 150 100 1))           ;not landed, moving right
(define I2 (make-invader 150 HEIGHT -1))       ;exactly landed, moving left
(define I3 (make-invader 150 (+ HEIGHT 10) 1)) ;> landed, moving right


#;
(define (fn-for-invader invader)
  (... (invader-x invader) (invader-y invader) (invader-dx invader)))


(define-struct missile (x y))
;; Missile is (make-missile Number Number)
;; interp. the missile's location is x y in screen coordinates

(define M1 (make-missile 150 300))                       ;not hit U1
(define M2 (make-missile (invader-x I1) (+ (invader-y I1) 10)))  ;exactly hit U1
(define M3 (make-missile (invader-x I1) (+ (invader-y I1)  5)))  ;> hit U1

#;
(define (fn-for-missile m)
  (... (missile-x m) (missile-y m)))



(define G0 (make-game empty empty T0 0))
(define G1 (make-game empty empty T1 1))
(define G2 (make-game (list I1) (list M1) T1 1) )
(define G3 (make-game (list I1 I2 (make-invader 50 50 -1)) (list M1 M2) T1 1))
(define start G0)


;; =============== Functions=======================================:
;; =================================================================

;; ====== MAIN ========================================================
;; =======================================================================

;; WS -> WS
;; start the world with (main start)
;; 
(define (main ws)
  (big-bang ws                   ; WS
    (on-tick   tock)     ; WS -> WS
    (to-draw   render)   ; WS -> Image
    (stop-when stop-game) ;WS -> Boolean
    (on-key    handle-key)))    ; WS KeyEvent -> WS


;=======================================================================
;=======================================================================


;========Tick Function===================================================
;=======================================================================


(define (tock ws)
  (add-invader(make-game (hit-target (pass-view (move-missiles (game-missiles ws))) (move-invaders (game-invaders ws)))  (missile-target (move-invaders (game-invaders ws)) (pass-view (move-missiles (game-missiles ws))))         (game-tank ws) (+ (game-tick ws) 1))
              ))



;====== Invader Functions =============================================
;=======================================================================

;; WS -> WS
;; adds a new invader at 2 secs and 4 secs randomly on the across the 0 x axis with a speed from 1-5

(check-expect (add-invader G0) G0)

(define (add-invader ws)

  (cond [(= (/ (game-tick ws) 56 ) 1) (make-game (cons (make-invader (random WIDTH) 0 (+ 1 (random 4))) (game-invaders ws)) (game-missiles ws) (game-tank ws) (game-tick ws))]
        [(= (/ (game-tick ws) 112 ) 1) (make-game (cons (make-invader (random WIDTH) 0 (* -1 (+ 1 (random 4)))) (game-invaders ws)) (game-missiles ws) (game-tank ws) 0)]

        [else ws]

        ))


;; ListOfSpaceInvaders -> ListOfSpaceInvaders
;; adjust LOS across x axis and down the y axis

(check-expect (move-invaders empty) empty)
(check-expect (move-invaders (cons (make-invader WIDTH 100 -1) empty)) (cons (make-invader (- WIDTH 1) 101 -1) empty))
(check-expect (move-invaders (cons (make-invader WIDTH 100 5) empty)) (cons (make-invader WIDTH  100 -5) empty))
(check-expect (move-invaders (cons (make-invader 0 100 -5) empty)) (cons (make-invader 0  100 5) empty))
(check-expect (move-invaders (cons (make-invader 5 100 5) empty)) (cons (make-invader 10  105 5) empty))



(define (move-invaders invaders)
  (cond [(empty? invaders) empty]
        [else
         (cons (adjust-invader (first invaders))
               (move-invaders (rest invaders)))]))

;; SpaceInvader -> SpaceInvader
;; invaders move on a 45 degree 1:1 (x:y) ratio untill it hits a 0 or with boundary
;; if invader reaches either 0 or the width boundary, flip the slope of line

(define (adjust-invader c)
  (cond [(> (+ (invader-x c) (invader-dx c)) WIDTH) (make-invader WIDTH (invader-y c) (- (invader-dx c)))]
        [(< (+ (invader-x c) (invader-dx c)) 0 ) (make-invader 0 (invader-y c) (- (invader-dx c)))]
        [(< (invader-dx c) 1) (make-invader (+ (invader-x c) (invader-dx c)) (+ (invader-y c) (* (invader-dx c) -1)) (invader-dx c))  ]
        [else (make-invader (+ (invader-x c) (invader-dx c)) (+ (invader-y c) (invader-dx c)) (invader-dx c))]
        ))

;; LOM LOI -> LOI
;; removes invaders from list when they collide with a missile

(check-expect (hit-target empty empty) empty)
(check-expect (hit-target (cons (make-missile 150 105) empty) (list (make-invader 150 105 1))) empty)
(check-expect (hit-target (cons (make-missile 150 300) empty) (list (make-invader 150 100 1))) (list (make-invader 150 100 1)) )

(define (hit-target lom loi)
  (cond [(empty? loi) empty]
        [else       
         (
          if (collision? (first loi) lom )
             (hit-target lom (rest loi))
             (cons (first loi) (hit-target  lom (rest loi))
                   ))
         ]
        ))
 


(check-expect (collision? (make-invader 150 100 1)  (cons (make-missile 150 300) empty)) false) ; x-hit y-miss
(check-expect (collision? (make-invader 0 105 1)  (cons (make-missile 150 105) empty)) false)   ; x-miss y-hit
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile 150 105) empty)) true) ; x-hit y-hit
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile (+ HIT-RANGE 150) 105) empty)) true) ; missile within in hit range x
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile (- 150 HIT-RANGE) 105) empty)) true)
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile (+ HIT-RANGE 150) (+ HIT-RANGE 105)) empty)) true) ; missile within in hit range x
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile  150 (- 105 HIT-RANGE)) empty)) true)
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile 105 105) (cons (make-missile 200 105) empty))) false) ; list of missile misses
(check-expect (collision? (make-invader 150 105 1)  (cons (make-missile 105 105) (cons (make-missile 150 105) (cons (make-missile 200 105) empty)))) true) ; hit in list

(define (collision? invader lom)
  (cond [(empty? lom) false]
        [else (cond [(and (and (>= (- (invader-x invader) (missile-x (first lom))) (* -1 HIT-RANGE)) (<= (- (invader-x invader) (missile-x (first lom))) HIT-RANGE))
                          (and (>= (- (invader-y invader) (missile-y (first lom))) (* -1 HIT-RANGE)) (<= (- (invader-y invader) (missile-y (first lom))) HIT-RANGE)))
                     true]
                    [else (collision? invader (rest lom) )] 
                    )]
        )
  )





;; ==== Missile Functions ==============================================
;=======================================================================


;; ListOfMissile -> ListOfMissile
;; decrease y position of LOM 

(check-expect (move-missiles empty) empty)
(check-expect (move-missiles (cons (make-missile 10 20) (cons (make-missile 10 10) empty))) (cons (make-missile 10 (- 20 MISSILE-SPEED )) (cons (make-missile 10 (- 10 MISSILE-SPEED )) empty)))

(define (move-missiles miss)
  (cond [(empty? miss) empty]
        [else
         (cons (adjust-missile (first miss))
               (move-missiles (rest miss)))]))

;; Missile -> Missile
;; decrease missile y position by speed

(check-expect (adjust-missile (make-missile 10 10)) (make-missile 10 (- 10 MISSILE-SPEED )))
(check-expect (adjust-missile (make-missile 0 55)) (make-missile 0 (- 55 MISSILE-SPEED )))

(define (adjust-missile d)
  (make-missile (missile-x d) 
                (-  (missile-y d) MISSILE-SPEED)))

;; LOM -> LOM
;; if missiles reach pass y 0, removes missile from List
(check-expect (pass-view empty) empty)
(check-expect (pass-view (list (make-missile 10 5) (make-missile 10 -1))) (list (make-missile 10 5)))

(define (pass-view lom)
  (cond [(empty? lom) empty]
        [else
         (
          if (pass-y-screen? (first lom))
             (pass-view (rest lom))
             (cons (first lom) (pass-view (rest lom))
                   ))
         ]))

;; Missile -> Boolean
;; is missile y position less than y 0
(check-expect (pass-y-screen? (make-missile 10 -1)) true)
(check-expect (pass-y-screen? (make-missile 10 5)) false)
              
(define (pass-y-screen? d)
  (> 0 (missile-y d)))

;; LOI LOM -> LOM
;; remove missiles from list that collide with space invaders

(check-expect (missile-target empty empty) empty)
(check-expect (missile-target (list (make-invader 150 105 1)) (list (make-missile 150 105))) empty)
(check-expect (missile-target  (list (make-invader 150 100 1)) (cons (make-missile 150 300) empty)) (cons (make-missile 150 300) empty) )

(define (missile-target loi lom)
  (cond [(empty? lom) empty]
        [else       
         (
          if (missile-collision? (first lom) loi )
             (missile-target loi (rest lom))
             (cons (first lom) (missile-target  loi (rest lom))
                   ))
         ]
        ))

;Missile LOI -> Boolean
; return true if missile hit collided with any space invaders

(check-expect (missile-collision? (make-missile 150 100 )  (cons (make-invader 150 300 1) empty)) false) ; x-hit y-miss
(check-expect (missile-collision? (make-missile 0 105 )  (cons (make-invader 150 105 1) empty)) false)   ; x-miss y-hit
(check-expect (missile-collision? (make-missile 150 105 )  (cons (make-invader 150 105 1) empty)) true) ; x-hit y-hit

(define (missile-collision? missile loi)
  (cond [(empty? loi) false]
        [else (cond [(and (and (>= (- (missile-x missile) (invader-x (first loi))) (* -1 HIT-RANGE)) (<= (- (missile-x missile) (invader-x (first loi))) HIT-RANGE))
                          (and (>= (- (missile-y missile) (invader-y (first loi))) (* -1 HIT-RANGE)) (<= (- (missile-y missile) (invader-y (first loi))) HIT-RANGE)))
                     true]
                    [else (missile-collision? missile (rest loi) )] 
                    )]
        )
  )



; ==== Render Functions ================================================
; =======================================================================


;; WS -> Image
;; render scene with tank missile and invaders
(check-expect (render G0) (place-image 
                           TANK (/ WIDTH 2) (- HEIGHT TANK-HEIGHT/2)
                           MTS                                     ))
(define (render ws)
  (render-invaders (game-invaders ws)
                   (render-missiles (game-missiles ws) (place-image 
                                                        TANK (tank-x (game-tank ws)) (- HEIGHT TANK-HEIGHT/2)
                                                        MTS                                     )))
  )

;; ListOfMissils Image -> Image
(check-expect (render-missiles empty (place-image 
                                      TANK 250 (- HEIGHT TANK-HEIGHT/2)
                                      MTS                                     ))
              (place-image 
               TANK 250 (- HEIGHT TANK-HEIGHT/2)
               MTS                                     ))

(check-expect (render-missiles (list (make-missile 10 10)) (place-image 
                                                            TANK 250 (- HEIGHT TANK-HEIGHT/2)
                                                            MTS                                     ))
              (place-image MISSILE 10 10 (place-image 
                                          TANK 250 (- HEIGHT TANK-HEIGHT/2)
                                          MTS                                     )))


(define (render-missiles miss image)
  (cond [(empty? miss) image]
        [else
         (place-missile (first miss)
                        (render-missiles (rest miss) image))]))

;; Missile Image -> Image
;; conver missile to image and place on passed image

(check-expect (place-missile (make-missile 10 10 ) (place-image 
                                                    TANK 250 (- HEIGHT TANK-HEIGHT/2)
                                                    MTS                                     )) (place-image MISSILE 10 10 (place-image 
                                                                                                                           TANK 250 (- HEIGHT TANK-HEIGHT/2)
                                                                                                                           MTS                                     )))

(define (place-missile m img)
  (place-image MISSILE (missile-x m) (missile-y m) img))


;; ListOfSpaceInvader Image -> Image
;; place space invaders on passed image
(check-expect (render-invaders empty MTS) MTS)
(check-expect (render-invaders (list (make-invader 10 10 -1)) MTS) (place-image INVADER 10 10 MTS))

(define (render-invaders inv image)
  (cond [(empty? inv) image]
        [else
         (place-invader (first inv)
                        (render-invaders (rest inv) image))]))

;; SpaceInvader Image -> Image
;; convert invader to image and place on passed image

(check-expect (place-invader (make-invader 10 10 -1) MTS) (place-image INVADER 10 10 MTS))
(define (place-invader i img)
  (place-image INVADER (invader-x i) (invader-y i) img))


; ===== Key Event Functions =============================================
; =======================================================================
  

(check-expect (handle-key G0 "left") (make-game empty empty (make-tank (- (/ WIDTH 2) TANK-SPEED) -1) 0 ) )
(check-expect (handle-key G0 "right") (make-game empty empty (make-tank (+ (/ WIDTH 2) TANK-SPEED) 1) 0) )
(check-expect (handle-key G0 " ") (make-game empty (list (make-missile  (tank-x T0) (- HEIGHT TANK-HEIGHT/2))) T0 0) )
(check-expect (handle-key G0 "a") G0)

;; WS KeyEvent -> WS
;; right arrow is pressed move tank right, left arrow is pressed move tank left
;; space bar is pressed fire new missile


(define (handle-key ws ke)
  (cond
    [(key=? ke "left")  (make-game (game-invaders ws) (game-missiles ws) (make-tank (- (tank-x (game-tank ws)) TANK-SPEED) -1) (game-tick ws))]
    [(key=? ke "right") (make-game (game-invaders ws) (game-missiles ws) (make-tank (+ (tank-x (game-tank ws)) TANK-SPEED) 1) (game-tick ws))]
    [(key=? ke " ") (make-game (game-invaders ws) (cons (make-missile  (tank-x (game-tank ws)) (- HEIGHT TANK-HEIGHT/2) ) (game-missiles ws)) (game-tank ws) (game-tick ws))]
    [else ws]))

; ======= STOP FUNCTION ===========
;; WS -> Boolean
;; stop game is invader has landed

(check-expect (stop-game G0) false)
(check-expect (stop-game (make-game (list I1 I2 (make-invader 50 (+ HEIGHT 1) -1)) (list M1 M2) T1 1)) true)

(define (stop-game ws)
  (invader-landed (game-invaders ws))
  )


;; ListOfInvaders -> Boolean
;; return true if any of LOI are past height of scene

(check-expect (invader-landed empty) false)
(check-expect (invader-landed (list (make-invader 3 15 1) (make-invader 250 150 -1))) false)
(check-expect (invader-landed (list (make-invader 3 15 1) (make-invader 250 (+ HEIGHT 1) -1))) true)

(define (invader-landed loi)
  (cond [(empty? loi) false]
   [(> (invader-y (first loi)) HEIGHT) true ]
   [else (invader-landed (rest loi))]
   )
  )
