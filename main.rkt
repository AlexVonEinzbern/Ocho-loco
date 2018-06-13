#lang racket

(require "estructura.rkt"); importamos el archivo estructuras.rkt, ya que en el se encuentran las cartas.
(require dyoo-while-loop); instalamos la bibliotéca while-loop usando el comando 'raco pkg install while-loop' en la terminal

;CONTRATO:
;menu,local -> interfáz de usuario.

;PROPOSITO:
;Es un juego de cartas, 8loco con los siguientes requerimientos:
;1. Debe usar secuenciación, asignación , vectores , local
;2. Habrá como mínimo 3 jugadores (uno puede ser la máquina )
;3. Se juega con 2 barajas
;4. Se reparten 5 cartas a cada jugador, aleatoriamente
;5. El jugador en turno debe responder a la carta jugada con una de la misma pinta o el mismo caracter. Si no tiene, debe comer una carta y pasa turno.
;6. Si la carta jugada es un 3 se salta el turno del siguiente jugador.
;7. Si la carta jugada es un 10 se invierte el sentido del juego.
;8. Si se juega un 8, el jugador puede cambiar a la pinta que quiera.
;9. Si se juega un 2 o un joker, se debe responder con alguna de estas dos cartas y quien no tenga se comerá la cantidad indicada por las cartas (el joker vale 5) y pondrá una carta de la última pinta puesta en juego.
;10. Quien primero se quede sin cartas ganará el juego.
;11. Si se acaban las cartas disponibles, se acaba el juego y no hay ganador.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LISTA DE LA BARAJA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;baraja es una lista de objetos de la estructura "CARD".

(define baraja (list r_ACE_CLUBS r_02CL r_03CL r_04CL r_05CL r_06CL r_07CL r_08CL r_09CL r_10CL r_JKCL r_QNCL r_KGCL
                 r_ACE_DEAMONDS r_02DM r_03DM r_04DM r_05DM r_06DM r_07DM r_08DM r_09DM r_10DM r_JKDM r_QNDM r_KGDM
                 r_ACE_HEARTS r_02HT r_03HT r_04HT r_05HT r_06HT r_07HT r_08HT r_09HT r_10HT r_JKHT r_QNHT r_KGHT
                 r_ACE_SPADES r_02SD r_03SD r_04SD r_05SD r_06SD r_07SD r_08SD r_09SD r_10SD r_JKSD r_QNSD r_KGSD
                 r_RED_JOKER r_BLACK_JOKER
                 b_ACE_CLUBS b_02CL b_03CL b_04CL b_05CL b_06CL b_07CL b_08CL b_09CL b_10CL b_JKCL b_QNCL b_KGCL
                 b_ACE_DEAMONDS b_02DM b_03DM b_04DM b_05DM b_06DM b_07DM b_08DM b_09DM b_10DM b_JKDM b_QNDM b_KGDM
                 b_ACE_HEARTS b_02HT b_03HT b_04HT b_05HT b_06HT b_07HT b_08HT b_09HT b_10HT b_JKHT b_QNHT b_KGHT
                 b_ACE_SPADES b_02SD b_03SD b_04SD b_05SD b_06SD b_07SD b_08SD b_09SD b_10SD b_JKSD b_QNSD b_KGSD
                 b_RED_JOKER b_BLACK_JOKER))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INICIALIZAMOS ALGUNAS VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;

 (define cantidad 0)
 (define opcion 0)
 (define opcion2 0)
 (define nombre 0)
 (define jugadores 0)
 (define numerop 0)
 (define opcion3 0)
 (define carta_esco 0)
 (define pinta_esco 0)
 (define a 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;INICIALIZAMOS LA LISTA cartas_juego COMO VACIA;;;;;;;;;;;;;;;;;

(define cartas_juego empty)


;CUERPO:

(define (menu)
  (local (
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCIÓN AUXILIAR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CONTRATO:
;numerojugadores, read (lee un dato ingresado por el usuario) -> strings (muestra en pantalla)

          (define (numerojugadores)
            (begin
              (printf "digite cantidad de jugadores: ")
              (set! cantidad (read))
              (if (and (number? cantidad)(<= cantidad 10))
                  #t
                  (begin
                    (printf "solo se pueden 10 jugadores~n")
                    (numerojugadores)))))
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCIÓN AUXILIAR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CONTRATO:
;nombrejugadores, read (lee un dato ingresado por el usuario) -> strings (muestra en pantalla)

          (define (nombrejugadores)
            (begin
              (define myvector (make-vector cantidad 0))
              (printf "coloque el nombre de los jugadores: ")
              (for ([i (in-range cantidad)])
                (vector-set! myvector i (read)))))
                 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EMPEZAR JUEGO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          
          (define (empezar_juego)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MANO DE LOS JUGADORES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CONTRATO:
;mano, lista -> n listas con 5 cartas iniciales cada una para n jugadores.
            
            (define (mano una-lista)
              (cond
                [(= (length una-lista) 5) una-lista]
                [else
                 (begin
                   (define aleatorio (first(shuffle baraja)))
                   (set! una-lista (cons aleatorio una-lista))
                   (set! baraja (remove aleatorio baraja))
                   (mano una-lista))]))

;CONTRATO:
;comer_n, lista number number-> listas
;PROPOSITO:
;toma un elemento al azar de la baraja "global" y se lo agrega a un jugador y se lo quita a la baraja "global"

            (define (comer_n una-lista j n)
 
              (for ([i (in-range n)])
                (begin
                  (define aleatorio (first(shuffle baraja)))
                  (vector-set! barajas_jugadores j (cons aleatorio una-lista))
                  (set! baraja (remove aleatorio baraja))
                  (mano una-lista))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;:;;;;;;;;BARAJAS DE CADA JUGADOR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            (define barajas_jugadores(make-vector cantidad empty))
            (define barajas_jugadores_ruta (make-vector cantidad empty))

            (for ([i (in-range cantidad)])
              (vector-set! barajas_jugadores i (mano (vector-ref barajas_jugadores i))))
            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CARTA AL AZAR PARA INICIAR EL JUEGO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            
            (define aleatorio (first(shuffle baraja)))
            (set! cartas_juego (cons aleatorio cartas_juego))
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FUNCION QUE COME UNA CARTA ALEATORIA DE LA BARAJA;;;;;;;;;;;;;;;;;;;;;
;CONTRATO:
;comer, lista number-> listas
;PROPOSITO:
;toma un elemento al azar de la baraja "global" y se lo agrega a un jugador y se lo quita a la baraja "global"
            
            (define (comer una-lista j)

              (begin
                (define aleatorio (first(shuffle baraja)))
                (vector-set! barajas_jugadores j (cons aleatorio una-lista))
                (set! baraja (remove aleatorio baraja))))
            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

            (for ([k (in-range cantidad)])
              (while (not (empty? (vector-ref barajas_jugadores k)))
                 
                     (for ([j (in-range cantidad)])
                       
                       (begin
                         (printf "~nCarta en juego: ")
                         (display (CARD-nombre (first cartas_juego)))
                         (printf "~nCartas del jugador ")
                         (display (+ 1 j))
                         (for ([i (in-range (length (vector-ref barajas_jugadores j)))])
                           (printf"~n")
                           (display (+ i 1))
                           (display ". ")
                           (display (CARD-nombre (list-ref (vector-ref barajas_jugadores j) i)))) 

                         (printf "~n***INGRESE LA POSICION DE LA CARTA A SELECCIONAR O INTRODUZCA '+ PARA COMER~n")
                         (set! opcion3 (read))

                         (if (equal? '+ opcion3) (begin (comer (vector-ref barajas_jugadores j) j) (printf "Carta en juego: ") (display (CARD-nombre (first cartas_juego)))
                                                        (printf "~nCartas del jugador ") (display (+ 1 j)) (for ([i (in-range (length (vector-ref barajas_jugadores j)))]) (printf"~n") (display (+ i 1)) (display ". ") (display (CARD-nombre (list-ref (vector-ref barajas_jugadores j) i)))))
                             (begin                                                               
                               (set! carta_esco (list-ref (vector-ref barajas_jugadores j) (- opcion3 1)))

                               (if (or (equal? (CARD-valor carta_esco) '08) (equal? (CARD-valor carta_esco) '02))

                                   (begin

                                     (cond [(equal? (CARD-valor carta_esco) '08)
                                            (begin
                                              (printf "~nSeleccione la pinta a la que desea cambiar :~n")
                                              (printf "1. Clubs~n")
                                              (printf "2. Diamonds~n")
                                              (printf "3. Hearts~n")
                                              (printf "4. Spades~n")
                                              (set! pinta_esco (read))
                                              (cond 
                                                [(= 1 pinta_esco) (begin (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j))) (set! cartas_juego (cons carta_esco cartas_juego)) (set! carta_esco (make-CARD 'CL 'pinta 'clubs 'pinta)))]
                                                [(= 2 pinta_esco) (begin (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j))) (set! cartas_juego (cons carta_esco cartas_juego)) (set! carta_esco (make-CARD 'DM 'pinta 'diamonds 'pinta)))]
                                                [(= 3 pinta_esco) (begin (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j))) (set! cartas_juego (cons carta_esco cartas_juego)) (set! carta_esco (make-CARD 'HT 'pinta 'hearts 'pinta)))]
                                                [(= 4 pinta_esco) (begin (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j))) (set! cartas_juego (cons carta_esco cartas_juego)) (set! carta_esco (make-CARD 'SD 'pinta 'spades 'pinta)))]))]
                                           [(equal? (CARD-valor carta_esco) '02)
        
                                            (begin
                                              (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j)))
                                              (set! cartas_juego (cons carta_esco cartas_juego))
                                              (if (= j (- cantidad 1)) (set! a 0) (set! a (+ 1 j)))
                                              (comer (vector-ref barajas_jugadores a) a)
                                              (comer (vector-ref barajas_jugadores a) a))]

                                           [(equal? (CARD-pinta carta_esco) 'joker)
        
                                            (begin
                                              (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j)))
                                              (set! cartas_juego (cons carta_esco cartas_juego))
                                               (if (= j (- cantidad 1)) (set! a 0) (set! a (+ 1 j)))
                                              (comer (vector-ref barajas_jugadores a) a)
                                              (comer (vector-ref barajas_jugadores a) a)
                                              (comer (vector-ref barajas_jugadores a) a)
                                              (comer (vector-ref barajas_jugadores a) a)
                                              (comer (vector-ref barajas_jugadores a) a))]))
      
                                   (while (and 
                                           (not (equal? (CARD-valor carta_esco) (CARD-valor (first cartas_juego))))
                                           (not (equal? (CARD-pinta carta_esco) (CARD-pinta (first cartas_juego))))
                                           (not (equal? (first cartas_juego) 'joker)))

                                          (printf "~n***INGRESE  LA POSICION DE LA CARTA VALIDA O INTRODUZCA '+ PARA COMER~n")
                                          (printf "~nCarta en juego: ")
                                          (display (CARD-nombre (first cartas_juego)))
                                          (printf "~nCartas del jugador ")
                                          (display (+ 1 j))
                                          (for ([i (in-range (length (vector-ref barajas_jugadores j)))])
                                            (printf"~n")
                                            (display (+ i 1))
                                            (display ". ")
                                            (display (CARD-nombre (list-ref (vector-ref barajas_jugadores j) i)))) 
                                          (printf"~n")
                                          (set! opcion3 (read))

                                          (if (equal? '+ opcion3) (begin (set! carta_esco (first cartas_juego)) (comer (vector-ref barajas_jugadores j) j) (printf "Carta en juego: ") (display (CARD-nombre (first cartas_juego)))
                                                                         (printf "~nCartas del jugador ") (display (+ 1 j)) (for ([i (in-range (length (vector-ref barajas_jugadores j)))]) (printf"~n") (display (+ i 1)) (display ". ") (display (CARD-nombre (list-ref (vector-ref barajas_jugadores j) i)))))
                                              (begin (set! carta_esco (list-ref (vector-ref barajas_jugadores j) (- opcion3 1)))
                                                     (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j)))
                                                     (set! cartas_juego (cons carta_esco cartas_juego))
                                                     (printf "~nCarta en juego: ")
                                                     (display (CARD-nombre (first cartas_juego)))
                                                     (printf "~nCartas del jugador ")
                                                     (display (+ 1 j))
                                                     (for ([i (in-range (length (vector-ref barajas_jugadores j)))])
                                                       (printf"~n")
                                                       (display (+ i 1))
                                                       (display ". ")
                                                       (display (CARD-nombre (list-ref (vector-ref barajas_jugadores j) i))))))))


                               (vector-set! barajas_jugadores j (remove carta_esco (vector-ref barajas_jugadores j)))
                               (set! cartas_juego (cons carta_esco cartas_juego))

                               (printf "~nCarta en juego: ")
                               (display (CARD-nombre (first cartas_juego)))
                               (printf "~nCartas del jugador ")
                               (display (+ 1 j))
                               (for ([i (in-range (length (vector-ref barajas_jugadores j)))])
                                 (printf"~n")
                                 (display (+ i 1))
                                 (display ". ")
                                 (display (CARD-nombre (list-ref (vector-ref barajas_jugadores j) i)))))))

                           (if (empty? (vector-ref barajas_jugadores j)) (begin         (printf "~nGano el jugador ")
                                                                                        (display (+ j 1))
                                                                                        (printf "~n********Felicitaciones!!! ")
                                                                                        (menu)
                                ) (void))

                       ))
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MENÚ DE INICIO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CONTRATO:
;menuinicio
;PROPOSITO:
;muestra en pantalla la interfaz al usuario donde se muestra el menpu de inicio.
          
          (define (menuinicio)
            (begin
              (printf "~n BIENVENIDO AL JUEGO DE 8LOCO ~n1. INICIAR~n")
              (printf "2. INSTRUCCIONES ~n")
              (printf "3. SALIR ~n")
              (set! opcion (read))
              (if (<= opcion 3)
                  (cond
                    [(= 1 opcion) (begin
                                    (numerojugadores)
                                    (nombrejugadores)
                                    (empezar_juego))]
                    [(= 2 opcion) (begin
                                    (display "    
-Se reparten 5 cartas a cada jugador, aleatoriamente
-El jugador en turno debe responder a la carta jugada con una de la misma pinta o el mismo caracter. Si no tiene, debe comer una carta y pasa turno.
-Si la carta jugada es un 3 se salta el turno del siguiente jugador.
-Si la carta jugada es un 10 se invierte el sentido del juego
-Si se juega un 8, el jugador puede cambiar a la pinta que quiera.
-Si se juega un 2 o un joker, se debe responder con alguna de estas dos cartas y quien no tenga se comerá la cantidad indicada por las cartas (el joker vale 5) y pondrá una carta de la última pinta puesta en juego.
-Quien primero se quede sin cartas ganará el juego
-Si se acaban las cartas disponibles, se acaba el juego y no hay ganador. \n")
                                    (menuinicio))]
                    [(= 3 opcion) (display "gracias por jugar 8loco \n")])
                     
                  (begin
                    (printf "solo se puede colocar estas tres opciones ~n")
                    (menuinicio))))))

    (menuinicio)))

(menu)