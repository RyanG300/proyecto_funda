.model large
.stack
.data

    msg db 'Ingrese su nickname(3-10 letras): $'
    err_msg db 'Error: el nickname debe tener entre 3 y 10 letras. Intente nuevamente.$'
    buffer db 20, ?, 20 dup('$')                ; Espacio para el nickname del usuario
    jugador1_msj db 'Jugador 1: ',10,13,"$"

pantalla_principal dw " ",10,13
    dw " ",10,13
    dw " ",10,13
    dw " ",10,13
    dw " ",10,13
    dw " ",10,13 
    dw " ",10,13
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
 
pantalla_modo_juego dw " ",10,13 
    dw " ",10,13
    dw " ",10,13
    dw "                            Elije un modo de juego                          ",10,13
    dw " ",10,13  
    dw " ",10,13
    dw " ",10,13
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
    dw "$"10,13
    


pantalla_juego_rapido dw " ",10,13
    dw "   Adivina el numero ",10,13
    dw " ",10,13
    dw " _____________________ ",0ah,0dh
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




pantalla_jugador_vs_jugador dw " ",10,13
    dw "Jugador 1 ingresa un numero: ",10,13
    dw "Jugador 2 ingresa un numero: ",10,13
    dw " ",10,13
    dw " ---------------------                                                      ",0ah,0dh
    dw "{                     }   ____    _  _  ___     ____                        ",0ah,0dh
    dw "{                     }  (_  _)  ( \/ )/ __)   (_  _)                       ",0ah,0dh
    dw "{                     } .-_)(     \  / \__ \  .-_)(                         ",0ah,0dh
    dw "{                     } \____)     \/  (___/  \____)                        ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }     ___________     ___________     ___________     ",0ah,0dh
    dw "{                     }    {           }   {           }   {           }    ",0ah,0dh
    dw "{                     }    {           }   {           }   {           }    ",0ah,0dh
    dw "{                     }    { Rendirse  }   { Reiniciar }   {   Salir   }    ",0ah,0dh
    dw "{                     }    {           }   {           }   {           }    ",0ah,0dh
    dw " ---------------------     {___________}   {___________}   {___________}    ",0ah,0dh
    dw "$",0ah,0dh
 
    
.code
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

;-------------------macro para esperar 3 segundos-----------------

esperar_3_segundos macro
    mov cx, 200                     ; Establece un temporizador de aproximadamente 3 segundos
    mov dx, 40h                     ; DX apunta al temporizador del sistema 
    
esperar_loop:
    in al, dx                       ; Lee el temporizador del sistema
    test al, 01h                    ; Comprueba si el temporizador ha cambiado
    jnz esperar_loop                ; Espera hasta que el temporizador haya cambiado
    loop esperar_loop               ; Espera hasta que se alcance el numero de ciclos especificado
endm

;-----------------------------------------------------------------
    
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

jvsj:

;-------muestra el mensaje para el nickname del jugador 1---------

    limpiar_pantalla   
    input_name:
    lea dx, msg
    mov ah, 9
    int 21h    
    
;---------------lee el nombre del usuario------------------------- 

    lea dx, buffer
    mov ah, 0Ah
    int 21h

;---------------obtiene la longitud del nombre ingresado----------

    mov al, buffer[1]               ; longitud del nombre ingresado
    cmp al, 3
    jb show_error                   ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error                   ; si es mayor que 10, mostrar error
    limpiar_pantalla

;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_jugador
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
    
;---------------muestra el nombre del usuario--------------------- 

    lea dx, buffer+2                ; muestra el nicname ingresado
    mov ah, 9
    int 21h
    jmp salir  
    
;---------------muestra el mensaje de error-----------------------

show_error: 
    limpiar_pantalla
    lea dx, err_msg
    mov ah, 9
    int 21h

    esperar_3_segundos              ;espera 3 segundos

;---------------vuelve a pedir el nombre-------------------------- 

    limpiar_pantalla
    jmp input_name
    
    jmp salir
    
;-----------------------------------------------------------------
jvsm:
    limpiar_pantalla
    jmp salir

;-----------------------------------------------------------------
    
juego_rapido:
    limpiar_pantalla
    imprimir_pantallas pantalla_juego_rapido     
    
;-----------------------------------------------------------------

rendirse:
          
          
reiniciar:
          
          
salir:
.exit    




    
            
