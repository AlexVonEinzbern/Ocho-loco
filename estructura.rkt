#lang racket/gui

(require "imagenes.rkt")
(require racket/draw)

;;Definamos la estructura CARD

(define-struct CARD (nombre valor pinta direccion))
;Análisis, CARD representa una carta de una baraja de poker.
;nombre: es el nombre de la de carta, por ejemplo 02CL, para representar el 2 de clubs, es un symbol.
;valor: es el valor de la carta, por ejemplo en la carta 02CL, el número es 02, es un symbol.
;pinta: es la pinta de la carta, por ejemplo en la carta 02CL, la pinta es clubs, es un symbol.
;direccion: es el lugar donde se encuentra alojada la imágen, es un directorio.


;;;;;;;;;;;;;;;CLUBS-RED

(define r_ACE_CLUBS (make-CARD 'ACE_CL 'ACE 'clubs ace_of_clubs))
(define r_02CL (make-CARD '02CL '02 'clubs 2_of_clubs))
(define r_03CL (make-CARD '03CL '03 'clubs 3_of_clubs))
(define r_04CL (make-CARD '04CL '04 'clubs 4_of_clubs))
(define r_05CL (make-CARD '05CL '05 'clubs 5_of_clubs))
(define r_06CL (make-CARD '06CL '06 'clubs 6_of_clubs))
(define r_07CL (make-CARD '07CL '07 'clubs 7_of_clubs))
(define r_08CL (make-CARD '08CL '08 'clubs 8_of_clubs))
(define r_09CL (make-CARD '09CL '09 'clubs 9_of_clubs))
(define r_10CL (make-CARD '10CL '10 'clubs 10_of_clubs))
(define r_JKCL (make-CARD 'JKCL 'JK 'clubs jack_of_clubs))
(define r_QNCL (make-CARD 'QNCL 'QN 'clubs queen_of_clubs))
(define r_KGCL (make-CARD 'KGCL 'KG 'clubs king_of_clubs))

;;;;;;;;;;;;;;;;DIAMONDS-RED

(define r_ACE_DEAMONDS (make-CARD 'ACE_DM 'ACE 'diamonds ace_of_diamonds))
(define r_02DM (make-CARD '02DM '02 'diamonds 2_of_diamonds))
(define r_03DM (make-CARD '03DM '03 'diamonds 3_of_diamonds))
(define r_04DM (make-CARD '04DM '04 'diamonds 4_of_diamonds))
(define r_05DM (make-CARD '05DM '05 'diamonds 5_of_diamonds))
(define r_06DM (make-CARD '06DM '06 'diamonds 6_of_diamonds))
(define r_07DM (make-CARD '07DM '07 'diamonds 7_of_diamonds))
(define r_08DM (make-CARD '08DM '08 'diamonds 8_of_diamonds))
(define r_09DM (make-CARD '09DM '09 'diamonds 9_of_diamonds))
(define r_10DM (make-CARD '10DM '10 'diamonds 10_of_diamonds))
(define r_JKDM (make-CARD 'JKDM 'JK 'diamonds jack_of_diamonds))
(define r_QNDM (make-CARD 'QNDM 'QN 'diamonds queen_of_diamonds))
(define r_KGDM (make-CARD 'KGDM 'KG 'diamonds king_of_diamonds))


;;;;;;;;;;;;;;;;;;HEARTS-RED

(define r_ACE_HEARTS (make-CARD 'ACE_HT 'ACE 'hearts ace_of_hearts))
(define r_02HT (make-CARD '02HT '02 'hearts 2_of_hearts))
(define r_03HT (make-CARD '03HT '03 'hearts 3_of_hearts))
(define r_04HT (make-CARD '04HT '04 'hearts 4_of_hearts))
(define r_05HT (make-CARD '05HT '05 'hearts 5_of_hearts))
(define r_06HT (make-CARD '06HT '06 'hearts 6_of_hearts))
(define r_07HT (make-CARD '07HT '07 'hearts 7_of_hearts))
(define r_08HT (make-CARD '08HT '08 'hearts 8_of_hearts))
(define r_09HT (make-CARD '09HT '09 'hearts 9_of_hearts))
(define r_10HT (make-CARD '10HT '10 'hearts 10_of_hearts))
(define r_JKHT (make-CARD 'JKHT 'JK 'hearts jack_of_hearts))
(define r_QNHT (make-CARD 'QNHT 'QN 'hearts queen_of_hearts))
(define r_KGHT (make-CARD 'KGHT 'KG 'hearts king_of_hearts))

;;;;;;;;;;;;;;;;;SPADES-RED

(define r_ACE_SPADES (make-CARD 'ACE_SD 'ACE 'spades ace_of_spades))
(define r_02SD (make-CARD '02SD '02 'spades 2_of_spades))
(define r_03SD (make-CARD '03SD '03 'spades 3_of_spades))
(define r_04SD (make-CARD '04SD '04 'spades 4_of_spades))
(define r_05SD (make-CARD '05SD '05 'spades 5_of_spades))
(define r_06SD (make-CARD '06SD '06 'spades 6_of_spades))
(define r_07SD (make-CARD '07SD '07 'spades 7_of_spades))
(define r_08SD (make-CARD '08SD '08 'spades 8_of_spades))
(define r_09SD (make-CARD '09SD '09 'spades 9_of_spades))
(define r_10SD (make-CARD '10SD '10 'spades 10_of_spades))
(define r_JKSD (make-CARD 'JKSD 'JK 'spades jack_of_spades))
(define r_QNSD (make-CARD 'QNSD 'QN 'spades queen_of_spades))
(define r_KGSD (make-CARD 'KGSD 'KG 'spades king_of_spades))

;;;;;;;;;;;;;;;;;JOKERS-RED

(define r_RED_JOKER (make-CARD 'red_joker 'red_joker 'joker red_joker))
(define r_BLACK_JOKER (make-CARD 'black_joker 'black_joker 'joker black_joker))

;;;;;;;;;;;;;;;CLUBS-BLUE

(define b_ACE_CLUBS (make-CARD 'ACE_CL 'ACE 'clubs ace_of_clubs))
(define b_02CL (make-CARD '02CL '02 'clubs 2_of_clubs))
(define b_03CL (make-CARD '03CL '03 'clubs 3_of_clubs))
(define b_04CL (make-CARD '04CL '04 'clubs 4_of_clubs))
(define b_05CL (make-CARD '05CL '05 'clubs 5_of_clubs))
(define b_06CL (make-CARD '06CL '06 'clubs 6_of_clubs))
(define b_07CL (make-CARD '07CL '07 'clubs 7_of_clubs))
(define b_08CL (make-CARD '08CL '08 'clubs 8_of_clubs))
(define b_09CL (make-CARD '09CL '09 'clubs 9_of_clubs))
(define b_10CL (make-CARD '10CL '10 'clubs 10_of_clubs))
(define b_JKCL (make-CARD 'JKCL 'JK 'clubs jack_of_clubs))
(define b_QNCL (make-CARD 'QNCL 'QN 'clubs queen_of_clubs))
(define b_KGCL (make-CARD 'KGCL 'KG 'clubs king_of_clubs))

;;;;;;;;;;;;;;;;DIAMONDS-BLUE

(define b_ACE_DEAMONDS (make-CARD 'ACE_DM 'ACE 'diamonds ace_of_diamonds))
(define b_02DM (make-CARD '02DM '02 'diamonds 2_of_diamonds))
(define b_03DM (make-CARD '03DM '03 'diamonds 3_of_diamonds))
(define b_04DM (make-CARD '04DM '04 'diamonds 4_of_diamonds))
(define b_05DM (make-CARD '05DM '05 'diamonds 5_of_diamonds))
(define b_06DM (make-CARD '06DM '06 'diamonds 6_of_diamonds))
(define b_07DM (make-CARD '07DM '07 'diamonds 7_of_diamonds))
(define b_08DM (make-CARD '08DM '08 'diamonds 8_of_diamonds))
(define b_09DM (make-CARD '09DM '09 'diamonds 9_of_diamonds))
(define b_10DM (make-CARD '10DM '10 'diamonds 10_of_diamonds))
(define b_JKDM (make-CARD 'JKDM 'JK 'diamonds jack_of_diamonds))
(define b_QNDM (make-CARD 'QNDM 'QN 'diamonds queen_of_diamonds))
(define b_KGDM (make-CARD 'KGDM 'KG 'diamonds king_of_diamonds))



;;;;;;;;;;;;;;;;;;HEARTS-BLUE

(define b_ACE_HEARTS (make-CARD 'ACE_HT 'ACE 'hearts ace_of_hearts))
(define b_02HT (make-CARD '02HT '02 'hearts 2_of_hearts))
(define b_03HT (make-CARD '03HT '03 'hearts 3_of_hearts))
(define b_04HT (make-CARD '04HT '04 'hearts 4_of_hearts))
(define b_05HT (make-CARD '05HT '05 'hearts 5_of_hearts))
(define b_06HT (make-CARD '06HT '06 'hearts 6_of_hearts))
(define b_07HT (make-CARD '07HT '07 'hearts 7_of_hearts))
(define b_08HT (make-CARD '08HT '08 'hearts 8_of_hearts))
(define b_09HT (make-CARD '09HT '09 'hearts 9_of_hearts))
(define b_10HT (make-CARD '10HT '10 'hearts 10_of_hearts))
(define b_JKHT (make-CARD 'JKHT 'JK 'hearts jack_of_hearts))
(define b_QNHT (make-CARD 'QNHT 'QN 'hearts queen_of_hearts))
(define b_KGHT (make-CARD 'KGHT 'KG 'hearts king_of_hearts))

;;;;;;;;;;;;;;;;;SPADES-BLUE

(define b_ACE_SPADES (make-CARD 'ACE_SD 'ACE 'spades ace_of_spades))
(define b_02SD (make-CARD '02SD '02 'spades 2_of_spades))
(define b_03SD (make-CARD '03SD '03 'spades 3_of_spades))
(define b_04SD (make-CARD '04SD '04 'spades 4_of_spades))
(define b_05SD (make-CARD '05SD '05 'spades 5_of_spades))
(define b_06SD (make-CARD '06SD '06 'spades 6_of_spades))
(define b_07SD (make-CARD '07SD '07 'spades 7_of_spades))
(define b_08SD (make-CARD '08SD '08 'spades 8_of_spades))
(define b_09SD (make-CARD '09SD '09 'spades 9_of_spades))
(define b_10SD (make-CARD '10SD '10 'spades 10_of_spades))
(define b_JKSD (make-CARD 'JKSD 'JK 'spades jack_of_spades))
(define b_QNSD (make-CARD 'QNSD 'QN 'spades queen_of_spades))
(define b_KGSD (make-CARD 'KGSD 'KG 'spades king_of_spades))

;;;;;;;;;;;;;;;;;JOKERS-BLUE

(define b_RED_JOKER (make-CARD 'red_joker 'red_joker 'joker red_joker))
(define b_BLACK_JOKER (make-CARD 'black_joker 'black_joker 'joker black_joker))

(provide (all-defined-out))
