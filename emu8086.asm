.model large
.stack
.data

    msg1 db 'Jugador 1. Ingrese su nickname(3-10 letras): $'
    msg2 db 'Jugador 2. Ingrese su nickname(3-10 letras): $'
    err_msg db 'Error: el nickname debe tener entre 3 y 10 letras. Intente nuevamente.$'
    buffer1 db 20, ?, 20 dup('$')                ; Espacio para el nickname del usuario 1
    buffer2 db 20, ?, 20 dup('$')                ; Espacio para el nickname del usuario 2
    jugador1_msj db 'Jugador 1: ',10,13,"$"
    jugador2_msj db 'Jugador 2: ',10,13,"$"
    num1 db "Jugador 1 ingresa un numero: ",10,13
    num2 db "Jugador 2 ingresa un numero: ",10,13
    nuevalinea db 10, 13, '$'

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
    dw "$"10,13
    

pantalla_tiempo_intentos dw " ",10,13
    dw "                                                                            ",10,13
    dw "                        Jugar por tiempo o intentos                         ",10,13
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




pantalla_jugador_vs_jugador dw " ",10,13
    dw "                                  ____    _  _  ___     ____                ",0ah,0dh
    dw "                                 (_  _)  ( \/ )/ __)   (_  _)               ",0ah,0dh
    dw "                                .-_)(     \  / \__ \  .-_)(                 ",0ah,0dh
    dw " ---------------------          \____)     \/  (___/  \____)                ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
    dw "{                     }                                                     ",0ah,0dh
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

pantalla_jugador_vs_maquina dw " ",10,13
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
    dw "                                                                            ",0ah,0dh
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
    
;------------------------------TIEMPO-----------------------------
    
tiempo:
    
;-------muestra el mensaje para el nickname del jugador 1---------

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
        
;---------------muestra el nickname del usuario--------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp input_name_jugador2  

;---------------------------JUGADOR 2-----------------------------
   
input_name_jugador2:
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
    call esperar_3_segundos          ;espera 3 segundos
    jmp salir
    
;-----------------------------INTENTOS-----------------------------
 
intentos:
    
limpiar_pantalla   
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
    
;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_maquina
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
        
;---------------muestra el nickname del usuario--------------------- 

    lea dx, buffer1+2                ; muestra el nickname ingresado
    mov ah, 9
    int 21h
    call esperar_3_segundos          ;espera 3 segundos
    jmp salir 
    
;-----------------------------INTENTOS-----------------------------
 
intento_2:
    
limpiar_pantalla   
input_name_jugador1_4:
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
    jb show_error6                    ; si es menor que 3, mostrar error
    cmp al, 10
    ja show_error6                    ; si es mayor que 10, mostrar error
    
;---------------muestra el mensaje de "Jugador1:"----------------- 
    
    limpiar_pantalla
    imprimir_pantallas pantalla_jugador_vs_maquina
    lea dx, jugador1_msj
    mov ah, 9
    int 21h
    
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
    loop esperar_loop    ; Espera hasta que se alcance el número de ciclos especificado
    ret
esperar_3_segundos endp
    
rendirse:
          
          
reiniciar:
          
          
salir:
.exit      




    
            
