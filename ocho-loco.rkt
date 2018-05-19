#lang racket/gui

(require racket/draw)

(define logo-bitmap (read-bitmap "images/2_of_clubs.png"))

;; Let's make a larger bitmap.
(define large-bitmap (make-bitmap (* 2 (send logo-bitmap get-width))
                                  (* 2 (send logo-bitmap get-height))))

;; And let's draw on it.
(define dc (new bitmap-dc% [bitmap large-bitmap]))
(send dc scale .3 .3)
(send dc set-alpha .5)
(send dc draw-bitmap logo-bitmap 150 150)

(define f (new frame% [label "A picture"]))
(send f show #t)
(void (new message% [parent f] [label large-bitmap]))