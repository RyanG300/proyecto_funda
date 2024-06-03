nclude "emu8086.inc"
.model large
.stack
.data

;---------------------nickname---------------------- 

    msg1 db 'Jugador 1. Ingrese su nickname(3-10 letras): $'
    msg2 db 'Jugador 2. Ingrese su nickname(3-10 letras): $'

;--------------------mensaje error------------------  

    err_msg db 'Error: el nickname debe tener entre 3 y 10 letras. Intente nuevamente.$'
    
;----------------------buffers----------------------

    buffer1 db 20, ?, 20 dup('$')                ; Espacio para el nickname del usuario 1
    buffer2 db 20, ?, 20 dup('$')                ; Espacio para el nickname del usuario 2

;------------------mensaje jugadores----------------
    
    jugador1_msj db 'Jugador 1: ',10,13,"$"
    jugador2_msj db 'Jugador 2: ',10,13,"$"
    nuevalinea db 10,13,'$' 

;-------------------opcion tiempo-------------------

    tiempoInicial dw 0
    tiempo1 dw 100                                ; Un valor de tiempo arbitrario
    resultadoEsperado db 5                        ; Numero a adivinar
    intentosReales dw 0
    tiempoReal dw 0
    xTemp db 0
    yTemp db 0     
     
;---------------modo tiempo o intentos---------------

    tiempo_o_intentos db 0
    puntaje db 0 
    intentos_v db 0
    
;------------------------numero----------------------
    
    num1 db "Jugador 1 ingresa un numero(1-10): $",10,13 
    num2 db "Jugador 2 ingresa un numero(1-10): $",10,13
    error_msg db 13, 10, "Numero fuera de rango, intente de nuevo$"  
    numero db 0
    buffer3 db 5  dup(?),"$"                        ; buffer para el numero ingresado por el jugador 1
    buffer4 db 3, 0, 3 dup(0)                     ; buffer para el numero adivinado por el jugador 2
    buffer5 db 3, 0, 3 dup(?)                     ; buffer para el numero ingresado por el jugador 2
    
    seleccion2 db 'Jugador 2, elija un numero del 1 al 10: $',,10,13
    incorrecto_msg db 'Incorrecto. Intente nuevamente.', '$'
    pantalla_numeros db 'Los numeros del 1 al 10 son:', '$'
    tabla_numeros db "1 2 3 4 5 6 7 8 9 10","$",,10,13 
    numero_jugador1 dw 0                          ; almacenar el número elegido por el jugador 1
    
;---------------jugador vs maquina-----------------

    err_msg_dificultad db "Error: La opcion seleccionada no existe. Volviendo al menu...","$" 
    dificultad db 0   
    numero_a_adivinar db 0,"$"
    
    
;-----------------pantalla principal---------------
    
pantalla_principal dw " ",10,13
    dw "                                                                        ",10,13
    dw "                                                                        ",10,13
    dw "                                                                        ",10,13
    dw "                                                                        ",10,13
    dw "                                                                        ",10,13 
    dw "                                                                        ",10,13
    dw "      _________________________________________________________________ ",10,13 
    dw "     |                                                                 |",10,13
    dw "     |     __                 _                                    _   |",10,13  
    dw "     |  /\ \ \_   _ _ __ ___ | |__   ___ _ __    /\  /\_   _ _ __ | |_ |",10,13  
    dw "     | /  \/ / | | | '_ ` _ \| '_ \ / _ \ '__|  / /_/ / | | | '_ \| __||",10,13  
    dw "     |/ /\  /| |_| | | | | | | |_) |  __/ |    / __  /| |_| | | | | |_ |",10,13  
    dw "     |\_\ \/  \__,_|_| |_| |_|_.__/ \___|_|    \/ /_/  \__._|_| |_|\__||",10,13 
    dw "     |                                                                 |",10,13
    dw "     |                  Presione enter para continuar                  |",10,13 
    dw "     |_________________________________________________________________|",10,13 
    dw "$",10,13

;---------------pantalla modo juego----------------      

pantalla_modo_juego dw " ",10,13 
    dw "                                                                            ",10,13
    dw "                                                                            ",10,13
    dw "                            Elije un modo de juego                          ",10,13
    dw "                                                                            ",10,13  
    dw "                                                                            ",10,13
    dw "                                                                            ",10,13
    dw "   .----------------.         .----------------.         .----------------. ",10,13
    dw "  | .--------------. |       | .--------------. |       | .--------------. |",10,13
    dw "  | |     __       | |       | |    _____     | |       | |    ______    | |",10,13
    dw "  | |    /  |      | |       | |   / ___ `.   | |       | |   / ____ `.  | |",10,13
    dw "  | |    `| |      | |       | |  |_/___) |   | |       | |   `'  __) |  | |",10,13
    dw "  | |     | |      | |       | |   .'____.'   | |       | |   _  |__ '.  | |",10,13
    dw "  | |    _| |_     | |       | |  / /____     | |       | |  | \____) |  | |",10,13
    dw "  | |   |_____|    | |       | |  |_______|   | |       | |   \______.'  | |",10,13
    dw "  | |              | |       | |              | |       | |              | |",10,13
    dw "  | '--------------' |       | '--------------' |       | '--------------' |",10,13
    dw "   '----------------'         '----------------'         '----------------' ",10,13
    dw "                                                                            ",10,13
    dw "    JugadorVsJugador           JugadorVsMaquina             Juego Rapido    ",10,13 
    dw "$",10,13

;---------------pantalla tiempo intentos------------
     
pantalla_tiempo_intentos dw " ",10,13 dw " ",10,13 
    dw "                                                                            ",10,13
    dw "                                                                            ",10,13
    dw "                                                                            ",10,13
    dw "     .----------------.                             .----------------.      ",10,13
    dw "    | .--------------. |                           | .--------------. |     ",10,13
    dw "    | |     __       | |                           | |    _____     | |     ",10,13
    dw "    | |    /  |      | |                           | |   / ___ ..   | |     ",10,13
    dw "    | |    `| |      | |                           | |  |_/___) |   | |     ",10,13
    dw "    | |     | |      | |                           | |   ..____.'   | |     ",10,13
    dw "    | |    _| |_     | |                           | |  / /____     | |     ",10,13
    dw "    | |   |_____|    | |                           | |  |_______|   | |     ",10,13
    dw "    | |              | |                           | |              | |     ",10,13
    dw "    | .--------------. |                           | .--------------. |     ",10,13
    dw "     .----------------.                             .----------------.      ",10,13
    dw "          Tiempo                                         Intentos           ",10,13
    dw "                                                                            ",10,13
    dw "$",10,13 
    
;----------------pantalla juego rapido---------------     
     
pantalla_juego_rapido dw " ",10,13
    dw "                                 Adivina el numero                          ",10,13
    dw "                                                                            ",10,13
    dw " _____________________                                                      ",0ah,0dh
    dw "{                     }   _                      ___            _    _      ",0ah,0dh
    dw "{                     }  | | _ _  ___  ___  ___ | . \ ___  ___ <_> _| | ___ ",0ah,0dh
    dw "{                     } _| || | |/ ._>/ . |/ . \|   /<_> || . \| |/ . |/ . \",0ah,0dh
    dw "{                     } \__/`___|\___.\_. |\___/|_\_\<___||  _/|_|\___|\___/",0ah,0dh
    dw "{                     }               <___'               |_|               ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }      ___________     ___________     ___________    ",0ah,0dh
    dw "{                     }     {           }   {           }   {           }   ",0ah,0dh
    dw "{                     }     {           }   {           }   {           }   ",0ah,0dh
    dw "{                     }     { Rendirse  }   { Reiniciar }   {   Salir   }   ",0ah,0dh
    dw "{                     }     {           }   {           }   {           }   ",0ah,0dh
    dw "{_____________________}     {___________}   {___________}   {___________}   ",0ah,0dh
    dw "$", 0ah,0dh                     

;-------------pantalla jugador vs jugador-------------

pantalla_jugador_vs_jugador dw " ",10,13
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                        ____    _  _  ___     ____                          ",0ah,0dh
    dw "                       (_  _)  ( \/ )/ __)   (_  _)                         ",0ah,0dh
    dw "                      .-_)(     \  / \__ \  .-_)(                           ",0ah,0dh
    dw "                      \____)     \/  (___/  \____)                          ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                ___________     ___________     ___________                 ",0ah,0dh
    dw "               {           }   {           }   {           }                ",0ah,0dh
    dw "               {           }   {           }   {           }                ",0ah,0dh
    dw "               { Rendirse  }   { Reiniciar }   {   Salir   }                ",0ah,0dh
    dw "               {           }   {           }   {           }                ",0ah,0dh
    dw "               {___________}   {___________}   {___________}                ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "$",0ah,0dh

;------------pantalla jugador vs maquina---------------

pantalla_jugador_vs_maquina dw " ",10,13
    dw "   ____  __  __   ___    __    ____  _____  ____    _  _  ___               ",10,13
    dw "  (_  _)(  )(  ) / __)  /__\  (  _ \(  _  )(  _ \  ( \/ )/ __)              ",10,13
    dw " .-_)(   )(__)( ( (_-. /(__)\  )(_) ))(_)(  )   /   \  / \__ \              ",10,13
    dw " \____) (______) \___/(__)(__)(____/(_____)(_)\_)    \/  (___/              ",10,13
    dw "                       __  __    __    _____  __  __  ____  _  _    __      ",10,13
    dw "                      (  \/  )  /__\  (  _  )(  )(  )(_  _)( \( )  /__\     ",10,13
    dw "                       )    (  /(__)\  )(_)(  )(__)(  _)(_  )  (  /(__)\    ",10,13
    dw "                      (_/\/\_)(__)(__)(___/\\(______)(____)(_)\_)(__)(__)   ",10,13
    dw "                                                                            ",10,13   
    dw "                                                                            ",10,13    
    dw "$",10,13 

;--------------pantalla dificultad---------------------
    
pantalla_jugador_vs_maquina_dificultad dw " ",10,13    
    dw "                                                                            ",10,13                                     
    dw "  __________________________                                                ",10,13
    dw " {                          }                                               ",10,13
    dw " {                          }                                               ",10,13
    dw " {  SELECCIONE DIFICULTAD:  }                                               ",10,13
    dw " {                          }                                               ",10,13
    dw " {     ________________     }                                               ",10,13
    dw " {    {                }    }                                               ",10,13
    dw " {    {    facil(1)    }    }                                               ",10,13
    dw " {    {________________}    }                                               ",10,13
    dw " {                          }                                               ",10,13
    dw " {     ________________     }                                               ",10,13
    dw " {    {                }    }                                               ",10,13
    dw " {    {    Medio(2)    }    }                                               ",10,13
    dw " {    {________________}    }                                               ",10,13
    dw " {                          }                                               ",10,13
    dw " {     ________________     }                                               ",10,13
    dw " {    {                }    }                                               ",10,13
    dw " {    {   Dificil(3)   }    }                      _______________          ",10,13
    dw " {    {________________}    }                     {               }         ",10,13 
    dw " {                          }                     {   Volver(4)   }         ",10,13
    dw " {__________________________}                     {_______________}         ",10,13 
    dw "$",10,13

;--------------pantalla jugador vs maquina-------------

juego_jugador_vs_maquina dw " ",10,13 
    dw "                               _______                             ",10,13 
    dw "                             _/       \_                           ",10,13 
    dw "                            / |       | \                          ",10,13
    dw "                           /  |__   __|  \                         ",10,13 
    dw "                          |__/((o| |o))\__|                        ",10,13 
    dw "                          |      | |      |                        ",10,13 
    dw "                          |\     |_|     /|                        ",10,13 
    dw "                          | \           / |                        ",10,13 
    dw "                           \| /  ___  \ |/                         ",10,13 
    dw "                            \ | / _ \ | /                          ",10,13 
    dw "                             \_________/                           ",10,13 
    dw "                              _|_____|_                            ",10,13 
    dw "                         ____|_________|____                       ",10,13 
    dw "                        /                   \                      ",10,13 
    dw "                       |       _______       |                     ",10,13 
    dw "                       |      |   _   |      |                     ",10,13 
    dw "                       |      |   _   |      |                     ",10,13 
    dw "          _____________|______|_______|______|_____________        ",10,13 
    dw "$",10,13 

;----------------------opciones------------------------

salir_rendirse_reiniciar_menu dw " ",10,13           
    dw " ___________     ___________     ___________  ",10,13 
    dw "{           }   {           }   {           } ",10,13 
    dw "{           }   {           }   {           } ",10,13
    dw "{ Rendirse  }   { Reiniciar }   {   Salir   } ",10,13 
    dw "{           }   {           }   {           } ",10,13 
    dw "{___________}   {___________}   {___________} ",10,13 
    dw "$",10,13

;---------------------game over------------------------
     
GAME_OVER_1 dw " ",10,13
    dw "  ___    __    __  __  ____    _____  _  _  ____  ____   ",10,13
    dw " / __)  /__\  (  \/  )( ___)  (  _  )( \/ )( ___)(  _ \  ",10,13
    dw "( (_-. /(__)\  )    (  )__)    )(_)(  \  /  )__)  )   /  ",10,13
    dw " \___/(__)(__)(_/\/\_)(____)  (_____)  \/  (____)(_)\_)  ",10,13
    dw "                                                         ",10,13
    dw "    _______________________________________________      ",10,13
    dw "   {                                               }     ",10,13
    dw "   {                  Puntuacion:                  }     ",10,13 
          ;{                      10                       }
GAME_OVER_2 dw ""10,13
    dw "   {                                               }     ",10,13
    dw "   {                                               }     ",10,13
    dw "   {              ___________________              }     ",10,13
    dw "   {             {                   }             }     ",10,13
    dw "   {             {                   }             }     ",10,13
    dw "   {             {       SALIR       }             }     ",10,13
    dw "   {             {                   }             }     ",10,13
    dw "   {             {___________________}             }     ",10,13
    dw "   {                                               }     ",10,13
    dw "   {                                               }     ",10,13
    dw "   {_______________________________________________}     ",10,13
    dw "$",10,13
    
;---------------------ganar partidas---------------------

pantalla_gana_jugador1 dw " ", 10,13
    dw "     ______   _ _      _     _           _               ",10,13                             
    dw "    |  ____| | (_)    (_)   | |         | |              ",10,13               
    dw "    | |__ ___| |_  ___ _  __| | __ _  __| | ___  ___     ",10,13               
    dw "    |  __/ _ \ | |/ __| |/ _` |/ _` |/ _` |/ _ \/ __|    ",10,13               
    dw "    | | |  __/ | | (__| | (_| | (_| | (_| |  __/\__ \    ",10,13               
    dw "    |_|  \___|_|_|\___|_|\__,_|\__,_|\__,_|\___||___/    ",10,13               
    dw "                                                         ",10,13
    dw "         _                       _              __       ",10,13                  
    dw "        (_)                     | |            /_ |      ",10,13                 
    dw "         _ _   _  __ _  __ _  __| | ___  _ __   | |      ",10,13
    dw "        | | | | |/ _` |/ _` |/ _` |/ _ \| '__|  | |      ",10,13
    dw "        | | |_| | (_| | (_| | (_| | (_) | |     | |      ",10,13
    dw "        | |\__,_|\__, |\__,_|\__,_|\___/|_|     |_|      ",10,13
    dw "        / |       __/ |                                  ",10,13
    dw "       |__/       |___/                                  ",10,13                
    dw "$",10,13


pantalla_gana_jugador2 dw " ", 10,13
    dw "     ______   _ _      _     _           _               ",10,13                             
    dw "    |  ____| | (_)    (_)   | |         | |              ",10,13               
    dw "    | |__ ___| |_  ___ _  __| | __ _  __| | ___  ___     ",10,13               
    dw "    |  __/ _ \ | |/ __| |/ _` |/ _` |/ _` |/ _ \/ __|    ",10,13               
    dw "    | | |  __/ | | (__| | (_| | (_| | (_| |  __/\__ \    ",10,13               
    dw "    |_|  \___|_|_|\___|_|\__,_|\__,_|\__,_|\___||___/    ",10,13               
    dw "                                                         ",10,13
    dw "         _                       _              ___      ",10,13                  
    dw "        (_)                     | |            |__ \     ",10,13                 
    dw "         _ _   _  __ _  __ _  __| | ___  _ __     ) |    ",10,13
    dw "        | | | | |/ _` |/ _` |/ _` |/ _ \| '__|   / /     ",10,13
    dw "        | | |_| | (_| | (_| | (_| | (_) | |     / /_     ",10,13
    dw "        | |\__,_|\__, |\__,_|\__,_|\___/|_|    |____|    ",10,13
    dw "        / |       __/ |                                  ",10,13
    dw "       |__/       |___/                                  ",10,13                
    dw "$",10,13

   
.code
;------------------------definimos todo---------------------------
define_print_string
define_print_num
define_print_num_uns
define_scan_num 
DEFINE_CLEAR_SCREEN 

mov ax, @data
mov ds, ax   

;------------------implementar macros----------------------------- 

imprimir_pantallas macro pantalla
    mov ah,09h
    lea dx, pantalla
    int 21h
endm

;------------------macro para limpiar pantalla--------------------

limpiar_pantalla macro              ;Con esta macro se limpian las pantallas                                   
        mov ah,0fh
        int 10h
        mov ah,0
        int 10h
endm 

;-------------macro para el proceso de juego jvsm-----------------

numeros_entre macro dato            ;Esta macro se encarga de establecer entre que conjunto de numeros estara el numero a adivinar
    mov al,numero_a_adivinar
xor bl,bl 
mov bl,dato                         ;Dato es el numero que determina la dificultad. Siendo (4) facil, (8) medio, y (10) dificil
    cmp al,30                       ;Comparamos con treinta para establecer hacia donde partimos
    je en_medio_30
    jg arriba_30
    jl abajo_30
    
    en_medio_30:
        add al,bl
        call print_num
        print " y "
        add bl,4
        sub al,bl
        sub bl,4
        call print_num
        print "."
        jmp salir_numeros_entre 
    arriba_30:
        cmp al,45
        je  en_medio_45
        jg  arriba_45
        jl  abajo_45
    abajo_30:
        cmp al,15
        je en_medio_15
        jg arriba_15
        jl abajo_15
    en_medio_45:
        add bl,1
        add al,bl
        call PRINT_NUM 
        print " y "
        sub al,bl 
        sub bl,2
        sub al,bl
        sub bl,4
        call PRINT_NUM
        print "." 
        jmp salir_numeros_entre
    arriba_45:
        sub bl,3
        add al,bl
        call PRINT_NUM
        print " y " 
        add bl,7
        sub al,bl
        sub bl,4        
        call PRINT_NUM 
        print "."
        jmp salir_numeros_entre
    abajo_45:                       
        add bl,4
        add al,bl        
        call PRINT_NUM
        print " y " 
        sub al,bl
        sub bl,4        
        call PRINT_NUM
        print "."
        jmp salir_numeros_entre 
    en_medio_15:
        add bl,2
        add al,bl     
        call PRINT_NUM
        print " y " 
        add bl,2
        sub al,bl
        mov bl,4        
        call PRINT_NUM
        print "."
        jmp salir_numeros_entre 
    abajo_15:
        add bl,4
        add al,bl                           
        call PRINT_NUM
        print " y " 
        sub al,bl
        mov bl,4        
        call PRINT_NUM
        print "."
        jmp salir_numeros_entre 
    arriba_15:
        add bl,2
        add al,bl                           
        call PRINT_NUM
        print " y "
        add bl,2 
        sub al,bl
        mov bl,4        
        call PRINT_NUM
        print "." 
        jmp salir_numeros_entre                               
    salir_numeros_entre:                                    
endm 

;-----------macro para el proceso de establecer intentos---------- 
         
intentos_proceso macro 
    limpiar_pantalla 
    print "Introduzca la cantidad de intentos deseado: "  ;Pedimos la cantidad de intentos 
    call SCAN_NUM
    mov intentos_v, cl                                    ;Lo guardamos en intentos_v
    xor cl,cl 
    mov tiempo_o_intentos,2                               ;Ponemos un dos en "tiempo_o_intentos", esto sera un indicativo para que el algoritmo sepa que hacer   
    limpiar_pantalla
endm     

;------------------------------------------------------------------
      
color_red equ 4C0h                                        ; Atributo de color rojo    

;------------------------menu principal----------------------------
    
menu_principal:
    limpiar_pantalla 
    imprimir_pantallas pantalla_principal

enter:   
    mov ah,08h
    int 21h
    cmp al,0dh
    je modo_juego                   ;Si el usuario presiona enter, entonces, se inicia el juego
    jne enter

modo_juego:
    limpiar_pantalla
    imprimir_pantallas pantalla_modo_juego
    mov ah,08h
    int 21h                         ; Espera a que el usuario presione una tecla
    cmp al, '1'                     ; Compara con el valor ASCII del caracter '1' (49)
    je jvsj
    cmp al, '2'                     ; Compara con el valor ASCII del caracter '2' (50)
    je jvsm
    cmp al, '3'                     ; Compara con el valor ASCII del caracter '3' (51)
    je juego_rapido
    jmp modo_juego
    
jvsj:

;-------------elegir si jugar por tiempo o intentos---------------

opcion_tiempo_intentos:
    limpiar_pantalla
    imprimir_pantallas pantalla_tiempo_intentos
    mov ah,08h
    int 21h                         ; Espera a que el usuario presione una tecla
    cmp al, '1'                     ; Compara con el valor ASCII del caracter '1' (49)
    je tiempo
    cmp al, '2'                     ; Compara con el valor ASCII del caracter '2' (50)
    je intentos                    
    jmp opcion_tiempo_intentos
    
;------------------------------TIEMPO-----------------------------
    
tiempo:
    
;-------muestra el mensaje para el nickname del jugador 1-----------

limpiar_pantalla   
input_name_jugador1:
    lea dx, msg1
    mov ah, 9
    int 21h    
    
;---------------lee el nombre del usuario1------------------------ 

    lea dx, buffer1
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer1[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error                    ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error                    ; si es mayor que 10, mostrar error
    
;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_jugador
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
        
;---------------muestra el nickname del usuario-------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp numero1  

;-----------------------el usuario elije un numero----------------

numero1: 

    limpiar_pantalla
    lea dx, num1
    mov ah, 09h
    int 21h
    call leer_numero                  ; lee el numero ingresado
    jmp input_name_jugador2           ; si el numero es valido, continua

;----------------------mensaje de error-------------------------
invalidar_numero:
    limpiar_pantalla
    lea dx, error_msg
    mov ah, 09h
    int 21h
    call esperar_3_segundos           ; espera 3 segundos
    jmp numero1                       ; Saltar al inicio para volver a pedir el numero

;---------Leer una cadena de entrada desde el teclado-----------

leer_numero proc
    
    lea dx, buffer5
    mov ah, 0Ah                       ; funcion para leer entrada de cadena
    int 21h
    je validar_numero
    ret   
    
leer_numero endp

;---------Convertir cadena de entrada a numero binario----------

validar_numero proc
    lea si, buffer5+2                 ; Saltar longitud y primer byte de buffer
    xor bx, bx                        ; Limpiar BX para acumular el valor
    xor dx, dx                        ; Limpiar DX para multiplicacion

    convertir_loop:
        mov al, [si]
        cmp al, 0Dh                   ; Comprobar si es el terminador de linea (Enter)
        je check_range
        sub al, '0'                   ; Convertir de ASCII a binario
        mov ah, 0
        mov cx, 10
        mul cx                        ; Multiplicar BX por 10
        add bx,ax
        inc si
        jmp convertir_loop

    check_range:
        cmp bx, 1
        jb invalidar_numero           ; Si el numero es menor que 1, ir a invalidar_numero
        cmp bx, 10
        ja invalidar_numero           ; Si el numero es menor que 1, ir a invalidar_numero
        jmp input_name_jugador2
        ret 
         
validar_numero endp


;---------------------------JUGADOR 2-----------------------------
   
input_name_jugador2:

    limpiar_pantalla   

;-------muestra el mensaje para el nickname del jugador 2---------
    lea dx, msg2
    mov ah, 9
    int 21h
    
;---------------lee el nombre del usuario2------------------------ 

    lea dx, buffer2
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer2[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error2                   ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error2                   ; si es mayor que 10, mostrar error 

;---------------muestra el mensaje de "Jugador2:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_jugador
    lea dx, jugador2_msj
    mov ah, 9
    int 21h
    
;---------------muestra el nombre del usuario--------------------- 

    lea dx, buffer2+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    imprimir_pantallas nuevalinea
    call mostrar_numeros             ; Mostrar numeros del 1 al 10
    jmp seleccion_jugador2           ; Saltar a la seleccion del jugador 2

;----------------muestra los numeros del 1-10---------------------

mostrar_numeros proc
    lea dx, pantalla_numeros
    mov ah, 09h
    int 21h
    lea si, tabla_numeros
    
    mov cx, 10                     ; Inicializar contador
mostrar_loop:
    lodsb
    mov dl, al
    mov ah, 02h
    int 21h
    cmp cx, 10
    jne no_space
    mov dl, ' '
    mov ah, 02h
    int 21h
no_space:
    loop mostrar_loop
    ret
mostrar_numeros endp

;----------------------Jugador 2 elige un numero------------------

seleccion_jugador2:
    imprimir_pantallas nuevalinea
    lea dx, seleccion2
    mov ah, 09h
    int 21h
    call leer_numero2
    ret

;---------Leer una cadena de entrada desde el teclado-----------

leer_numero2 proc
    lea dx, buffer4
    mov ah, 0Ah                       ; funcion para leer entrada de cadena
    int 21h
    call validar_numero2              ; Llama a validar_numero2 despues de leer la entrada
    ret
leer_numero2 endp

;---------Convertir cadena de entrada a numero binario----------

validar_numero2 proc
    lea si, buffer4+2                 ; Saltar longitud y primer byte de buffer
    xor bx, bx                        ; Limpiar BX para acumular el valor
    xor dx, dx                        ; Limpiar DX para multiplicación

    convertir_loop2:
        mov al, [si]
        cmp al, 0Dh                   ; Comprobar si es el terminador de linea (Enter)
        je check_range2
        sub al, '0'                   ; Convertir de ASCII a binario
        mov ah, 0
        mov cx, 10
        mul cx                        ; Multiplicar BX por 10
        add bx, ax                    ; Acumular el valor
        cmp bx, numero_jugador1
        inc si
        jmp convertir_loop2
    
    check_range2:
        cmp bx, numero_jugador1       ; Comprobar si el numero es igual al seleccionado por el jugador 1
        je numero_correcto
        jmp numero_incorrecto
        ret
         
validar_numero2 endp

;----------------------numero correcto o incorrecto---------------

numero_correcto:
    limpiar_pantalla
    imprimir_pantallas pantalla_gana_jugador2 
    call esperar_3_segundos
    jmp menu_principal
    ret

numero_incorrecto:
    limpiar_pantalla
    lea dx, incorrecto_msg
    mov ah, 09h
    int 21h
    call esperar_3_segundos
    jmp salir 
    ret

    
;-----------------------el usuario elije un numero----------------

numero2: 

    limpiar_pantalla
    lea dx, num2
    mov ah, 09h
    int 21h
    call leer_numero                  ; lee el numero ingresado
    jmp input_name_jugador1           ; si el numero es valido, continua

;----------------------mensaje de error---------------------------

invalidar_numero_3:

    limpiar_pantalla
    lea dx, error_msg
    mov ah, 09h
    int 21h
    call esperar_3_segundos           ; espera 3 segundos
    jmp numero2                       ; Saltar al inicio para volver a pedir el numero

;---------Leer una cadena de entrada desde el teclado-----------

leer_numero_3 proc
    
    lea dx, buffer5
    mov ah, 0Ah                       ; funcion para leer entrada de cadena
    int 21h
    je validar_numero_3
    ret   
    
leer_numero_3 endp

;---------Convertir cadena de entrada a numero binario----------

validar_numero_3 proc
    
    lea si, buffer5+2                 ; Saltar longitud y primer byte de buffer
    xor bx, bx                        ; Limpiar BX para acumular el valor
    xor dx, dx                        ; Limpiar DX para multiplicacion

    convertir_loop_3:
        mov al, [si]
        cmp al, 0Dh                   ; Comprobar si es el terminador de linea (Enter)
        je check_range_3
        sub al, '0'                   ; Convertir de ASCII a binario
        mov ah, 0
        mov cx, 10
        mul cx                        ; Multiplicar BX por 10
        add bx, ax                        ; Acumular el valor
        cmp bx, 1
        jb invalidar_numero_3           ; Si el numero es menor que 1, ir a invalidar_numero
        cmp bx, 10
        ja invalidar_numero_3           ; Si el numero es mayor que 10, ir a invalidar_numero
        jmp juego_jugador1
        inc si
        jmp convertir_loop_3

    check_range_3:
        cmp bx, 1
        jb invalidar_numero_3           ; Si el numero es menor que 1, ir a invalidar_numero
        cmp bx, 10
        ja invalidar_numero_3           ; Si el numero es mayor que 10, ir a invalidar_numero
        jmp juego_jugador1
        ret 
         
validar_numero_3 endp


juego_jugador1:

;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_jugador
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
        
;---------------muestra el nickname del usuario-------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp numero1  

     
    
;-----------------------------INTENTOS-----------------------------
 
intentos:
    intentos_proceso   
input_name_jugador1_2:
    lea dx, msg1
    mov ah, 9
    int 21h    
    
;---------------lee el nombre del usuario1------------------------ 

    lea dx, buffer1
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer1[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error3                    ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error3                    ; si es mayor que 10, mostrar error
    
;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_jugador
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
    
;---------------muestra el nickname del usuario--------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp input_name_jugador2_1  

;---------------------------JUGADOR 2-----------------------------
   
input_name_jugador2_1:

    limpiar_pantalla
    lea dx, nuevalinea
    mov ah, 9
    int 21h
    
;-------muestra el mensaje para el nickname del jugador 2---------

    lea dx, msg2
    mov ah, 9
    int 21h
    
;---------------lee el nombre del usuario2------------------------ 

    lea dx, buffer2
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer2[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error4                   ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error4                   ; si es mayor que 10, mostrar error 

;---------------muestra el mensaje de "Jugador2:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_jugador
    lea dx, jugador2_msj
    mov ah, 9
    int 21h
    
;---------------muestra el nombre del usuario--------------------- 

    lea dx, buffer2+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp salir  




   
;-----------------------JUGADOR VS MAQUINA------------------------

jvsm:

;--------------------opcion tiempo o intentos---------------------

opcion_tiempo_intentos2:

    limpiar_pantalla
    imprimir_pantallas pantalla_tiempo_intentos
    mov ah,08h
    int 21h                         ; Espera a que el usuario presione una tecla
    cmp al, '1'                     ; Compara con el valor ASCII del caracter '1' (49)
    je tiempo_2
    cmp al, '2'                     ; Compara con el valor ASCII del caracter '2' (50)
    je intento_2
    
;-----------------------------TIEMPO------------------------------

tiempo_2: 

;-------muestra el mensaje para el nickname del jugador 1---------

limpiar_pantalla   
input_name_jugador1_3:
    lea dx, msg1
    mov ah, 9
    int 21h    
    
;---------------lee el nombre del usuario1------------------------ 

    lea dx, buffer1
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer1[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error5                    ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error5                    ; si es mayor que 10, mostrar error  
    
    
    
    
    
;---------JUGADOR VS MAQUINA (SELECTOR DE DIFICULTAD):"-----------
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_maquina
    call esperar_3_segundos
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_maquina_dificultad 
    mov ah,08h
    int 21h                         ;Espera a que el usuario presione una tecla
    cmp al, '1'                     ;Si el jugador eligio la opcion 1, sera dirigido a dificultad facil 
    je facil
    cmp al, '2'                     ;Si el jugador eligio la opcion 2, sera dirigido a dificultad medio
    je medio
    cmp al, '3'                     ;Si el jugador eligio la opcion 3, sera dirigido a dificultad dificl
    je dificil
    cmp al, '4'                     ;En caso contrario sera dirigido al menu_principal
    je menu_principal
    jmp error_dificultad            ;En caso de seleccionar una opcion incorrecta, se salta hacia error dificultad
    ;lea dx, jugador1_msj
    ;mov ah, 9
    ;int 21h   
;-------------------------dificultad (FACIL)----------------------
facil:   
mov dificultad,4
jmp juego_jvsm 
     
   
;-------------------------dificultad (MEDIO)----------------------
medio:          
mov dificultad,8
jmp juego_jvsm

;------------------------dificultad (DIFICIL)---------------------  
dificil:        
mov dificultad,10
jmp juego_jvsm

;--------------------JUEGO (JUGADOR VS MAQUINA)-------------------
juego_jvsm:
     limpiar_pantalla
     imprimir_pantallas juego_jugador_vs_maquina   ;Lore
     print "Mmm... Que interesante visita..."
     imprimir_pantallas nuevalinea
     print "No pensaba que quedaban de tu tipo..."
     imprimir_pantallas nuevalinea
     print "Humano, juguemos un juego... Veamos que tan lejos llegas..." 
     ;CICLO DEL JUEGO A PARTIR DE AQUI
ciclo_bonito:                              
     limpiar_pantalla
     imprimir_pantallas juego_jugador_vs_maquina 
     print "Pienso, pienso... en un numero entre "  
     call aleatorizador   ;El aleatorizador devuelve el segundo justo para usarlo como numero al azar
     xor dh,dh
     numeros_entre dificultad  ;Macro que devuelve un "conjunto" numeros en el que estara el numero a adivinar
     ;call esperar_3_segundos  
     limpiar_pantalla
     imprimir_pantallas salir_rendirse_reiniciar_menu
     
     imprimir_pantallas nuevalinea
     cmp tiempo_o_intentos,1
     je tiempos_c
     cmp tiempo_o_intentos,2
     je intentos_c
     tiempos_c:           ;FALTA ESTO
         ;Nada
         jmp continuar
     intentos_c:
         print "Vidas: "
         xor ax,ax
         mov al,intentos_v
         call print_num
         jmp continuar_c
     continuar_c:
         print "    Puntuacion: "
         xor ax,ax
         mov al,puntaje
         call print_num 
         imprimir_pantallas nuevalinea 
         print "Introduce el numero: "
         call SCAN_NUM
         cmp cl,numero_a_adivinar   ;Comparamos el numero colocado en la terminal por el usuario con el numero a adivinar.
         je si_es 
         jmp no_es 
     
;----------------------Si es o no es numero-----------------------      
si_es:
    ;Comprobamos rapidamente si el usuario eligio el modo de tiempo o vidas
    cmp tiempo_o_intentos,1
    je tiempos_a
    cmp tiempo_o_intentos,2
    je intentos_a
    
    tiempos_a:                ;Si eligio el modo de tiempo
        ;Falta codigo XDDDDDDDDDD            
        jmp ciclo_bonito
        
    intentos_a:               ;Si eligio el modo de intentos
        limpiar_pantalla
        imprimir_pantallas juego_jugador_vs_maquina
        xor ax,ax
        mov al,puntaje
        add al,1
        mov puntaje,al
        xor ax,ax  
        print "Muy bien, adivinaste... tienes un punto (+1)."
        imprimir_pantallas nuevalinea  
        print "Continuemos..."  
        jmp ciclo_bonito 

no_es:
    ;Comprobamos rapidamente si el usuario eligio el modo de tiempo o vidas
    cmp tiempo_o_intentos,1
    je tiempo_b
    cmp tiempo_o_intentos,2
    je intentos_b 
    
    tiempo_b: 
        ;Falta codigo XDDDDDDDDDD
        jmp continuar
        
    intentos_b:
        xor ax,ax
        mov al,intentos_v
        sub al,1
        mov intentos_v,al
        xor ax,ax
        cmp intentos_v,0
        je game_over_jvsm 
        jmp continuar
         
    continuar:
        limpiar_pantalla
        imprimir_pantallas juego_jugador_vs_maquina
        print "Fallaste, mas suerte a la proxima..."  
        jmp ciclo_bonito                                                               
                                                                 
;------------------------GAME_OVER_JVSM---------------------------
game_over_jvsm:
    limpiar_pantalla
    imprimir_pantallas juego_jugador_vs_maquina
    print "Una pena. Pense que podias llegar mas lejos..." 
    imprimir_pantallas nuevalinea 
    print "FIN DE JUEGO, humano."
    limpiar_pantalla
    imprimir_pantallas GAME_OVER_1
    print "{                       "
    mov al,puntaje
    call print_num 
    xor ax,ax
    print "                        }"
    imprimir_pantallas GAME_OVER_2
    call esperar_3_segundos
    ;FALTAN COSAS AQUI
     
        
      
     
     
;------------------------error_dificultad-------------------------
error_dificultad:
    limpiar_pantalla
    imprimir_pantallas err_msg_dificultad
    call esperar_3_segundos
    jmp menu_principal              ;Vuelve al menu 
   
    
    
    
        
;---------------muestra el nickname del usuario--------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp salir 
    
;-----------------------------INTENTOS-----------------------------
 
intento_2:   
intentos_proceso   
input_name_jugador1_4:
    lea dx, msg1
    mov ah, 9
    int 21h    
    
;---------------lee el nombre del usuario1------------------------ 

    lea dx, buffer1
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer1[1]                ; longitud del nombre ingresado
    cmp al, 3
    jb show_error6                    ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error6                    ; si es mayor que 10, mostrar error
    

;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    jmp juego_jvsm

    
;---------------muestra el nickname del usuario--------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp input_name_jugador2_1  
    jmp salir

;--------------------------JUEGO RAPIDO---------------------------
    
juego_rapido:

;-------muestra el mensaje para el nickname del jugador 1---------

limpiar_pantalla   
input_name_jugador1_5:
    lea dx, msg1
    mov ah, 9
    int 21h    
    
;---------------lee el nombre del usuario1------------------------ 

    lea dx, buffer1
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer1[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error7                    ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error7                    ; si es mayor que 10, mostrar error
    
;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_juego_rapido
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
        
;---------------muestra el nickname del usuario--------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp salir    
    
;-----------------------------------------------------------------






;-------------------------show error 1-----------------------------

show_error:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    
;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador1
             
;---------------------------show error 2----------------------------

show_error2:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos        

;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador2          ;vuelve a pedir el nombre
    
;-------------------------show error 3-----------------------------

show_error3:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    
;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador1_2
             
;---------------------------show error 4----------------------------

show_error4:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos

;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador2_1 
    
;---------------------------show error 5----------------------------

show_error5:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos        

;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador1_3          ;vuelve a pedir el nombre 

;---------------------------show error 6----------------------------

show_error6:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos        

;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador1_4          ;vuelve a pedir el nombre                  

;---------------------------show error 7----------------------------

show_error7:
    limpiar_pantalla 
    lea dx, err_msg
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos        

;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name_jugador1_5          ;vuelve a pedir el nombre  





;-------------------------esperar 3 segundos----------------------

end_program:
    mov ah, 4Ch
    int 21h

esperar_3_segundos proc
    mov cx, 200       ; Establece un temporizador de aproximadamente 3 segundos
    mov dx, 40h       ; DX apunta al temporizador del sistema
esperar_loop:
    in al, dx         ; Lee el temporizador del sistema
    test al, 01h      ; Comprueba si el temporizador ha cambiado
    jnz esperar_loop     ; Espera hasta que el temporizador haya cambiado
    loop esperar_loop    ; Espera hasta que se alcance el nÃºmero de ciclos especificado
    ret
esperar_3_segundos endp 
;--------------------Aleatorizador de numeros---------------------
aleatorizador:
    Mov ah,2Ch      ;De aleatorizador esto no tiene nada, lo unico que hace es agarrar el tiempo actual de la computadora para simular numeros aleatorios
    Int 21h 
    mov numero_a_adivinar,dh 
    xor dx,dx
    xor ax,ax  
    xor cx,cx
    ret
    
rendirse:
          
          
reiniciar:
          
          
salir:
.exit      
