#lang racket/gui

(require racket/draw)
(require "imagenes.rkt")

;;Desde "imagenes.rkt" podemos importar todas las cartas como solo usar el logo-bitmap
(define logo-bitmap crazyeights_logo)

;; Let's make a larger bitmap, tamaño de la ventana 1200x630
(define large-bitmap (make-bitmap 1200 630))

;; And let's draw on it.
(define dc (new bitmap-dc% [bitmap large-bitmap]))
(send dc scale 1 1)  ;;Escala de la imágen
(send dc set-alpha 1) ;;Intensidad de los colores de la imágen, 0 desaparece, 1 es el color normal

;;Dibujar el objeto en la posición 50 50 dentro de la ventana f
(send dc draw-bitmap logo-bitmap 0 0)

(define f (new frame% [label "8 loco"])) ;;Se define la ventana f con el título "8 loco"

;;Se define el menú llama menu-bar
(define menu-bar (new menu-bar%(parent f)))
(new menu%
     (label "&Juego")
     (parent menu-bar))

(new menu%
     (label "&Configuracion")
     (parent menu-bar))

(new menu%
     (label "&Ayuda")
     (parent menu-bar))

(send f show #t)
(void (new message% [parent f] [label large-bitmap]))


















