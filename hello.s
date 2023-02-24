; Autor reseni: Maksim Kalutski xkalut00

; Projekt 2 - INP 2022
; Vernamova sifra na architekture MIPS64

; DATA SEGMENT
                .data
login:          .asciiz "xkalut00"  ; sem doplnte vas login
cipher:         .space  17  ; misto pro zapis sifrovaneho loginu

params_sys5:    .space  8   ; misto pro ulozeni adresy pocatku
                            ; retezce pro vypis pomoci syscall 5
                            ; (viz nize "funkce" print_string)

; CODE SEGMENT
                .text
                ; registers that i can use -r24, -r9 - temporary registers
                ;                          -r7, -r4 - stores arguments
                ;                          -r17 - saved registers
                ;                          -r0 - always 0
                ; xkalut00
                ; "k" = 107 -> 11, "a" = 97 -> -1 

                ; ZDE NAHRADTE KOD VASIM RESENIM

main:           addi r24, r0, -1	 ;r24 = -"a"
                addi r9, r0, 12		 ;r9 = 12 -> difference between +"k" and -"a"
                addi r7, r0, 0		 ;r7 = 0 -> counter

next:        	lb r4, login(r7)	 ;load byte from login to r4

                slti r17, r4, 97     ;number check, if less than 97 -> "a"
                bne r17, r0, end	 ;jump end

                sub r9, r0, r9		 ;switch between 12 and -12
                sub r24, r24, r9	 ;switch between -"a" and +"k"
                add r4, r4, r24		 ;aplying vignere cipher
 
                slti r17, r4, 97	 ;check if symbol is in interval "a"-"z"
                beq r17, r0, low	 ;jump low if in bottom bounds 
                addi r4, r4, 26		 ;else add 26

low:            slti r17, r4, 123	 ;check if symbol is in interval "a"-"z"
                bne r17, r0, high	 ;jump high if in top bounds
                addi r4, r4, -26 	 ;else subtract 26

high:           sb r4, cipher(r7)	 ;save byte to cipher
                addi r7, r7, 1		 ;increment counter
                j next			     ;repeat

end:            daddi r4, r0, cipher ;load address of cipher to r4
                jal print_string     ;call print_string function
                syscall 0            ;halt

print_string:   ; adresa retezce se ocekava v r4
                sw      r4, params_sys5(r0)
                daddi   r14, r0, params_sys5    ; adr pro syscall 5 musi do r14
                syscall 5   ; systemova procedura - vypis retezce na terminal
                jr      r31 ; return - r31 je urcen na return address
