#lang racket

(require (lib "graphics.ss" "graphics")) (open-graphics)
(require games/cards)

(define ventana (open-viewport "Ocho-Loco" 800 700))

((draw-pixmap ventana) "images/2_of_clubs.png" (make-posn 0.0 0.0)"black")