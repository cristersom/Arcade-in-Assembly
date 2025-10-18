.model small

.stack 100h

.data
    
    CR equ 13
    NL equ 10                       
                 
     msg      db '     _           _      _           _   '
              db ' ___| |_ ___ ___| |_   | |_ _ _ ___| |_ '
              db '| . |   | . |_ -|  _|  |   | | |   |  _|'
              db '|_  |_|_|___|___|_|    |_|_|___|_|_|_|  '
              db '|___|                                   '  
                                                                                                                                                                                                                                                                                                                                                         
    TAM_MSG equ $-msg 
      
   nomes     db '     Cristersom Leonardo Simionato     ', CR, NL
             db '              [ Jogar ]', CR, NL
             db '                Sair' 
              

             
TAM_MSG2 equ $-nomes 

   campo3     db '000'
   
   TAM_MSG5 equ $-campo3 
  
   campo4     db '60'
   
   TAM_MSG6 equ $-campo4 
   
      campo1     db 'SCORE: '
   
   TAM_MSG3 equ $-campo1 
  
   campo2     db 'TEMPO: '
   
   TAM_MSG4 equ $-campo2 
   
   
.code 

   ; ESC_STR proc 
   ;  push AX  
   
   ;   mov AH, 9
   ;    int 21H
        
   ;    pop AX
   ;    ret  
   ;  endp  
    
    main:  
    
    
    mov ax, @data 
    mov ds, ax  
    mov Es, ax  
    
    mov AL, 13H
    mov AH, 0
    int 10H
          
 ;   mov ah,09h
;   mov bl, 2    ; cor
;   mov cx, 780
;   int 10h
    
;   xor dx,dx
;   mov dx, offset msg
;    call ESC_STR    
        
mov bp,OFFSET msg   ; ES:BP aponta para a mensagem
mov ah,13h      ; fun??o 13 - escrever string
mov al,0h      ; atributo em bl,move cursor
xor bh,bh       ; p?gina de v?deo 0
mov bl,2        ; cor
mov cx,TAM_MSG       ; comprimento da string
mov dh,0        ; linha para colocar a string
mov dl,0        ; coluna para colocar a string
int 10h         ; chamada de servi?o bios


mov bp,OFFSET nomes   ; ES:BP aponta para a mensagem
mov ah,13h      ; fun??o 13 - escrever string
mov al,0h      ; atributo em bl,move cursor
xor bh,bh       ; p?gina de v?deo 0
mov bl,15       ; cor
mov cx,TAM_MSG2       ; comprimento da string
mov dh,10      ; linha para colocar a string
mov dl,0        ; coluna para colocar a string
int 10h         ; chamada de servi?o bios
    ;xor dx,dx
    ;mov dx, offset nomes 
    ;call ESC_STR  
    ; mov ah, 09h 
 
    
    
  ;DESENHANDO PIXELS -----------------------------------------------------------------------------------------------------  
    
  ;PACMAN --------------------------------------------------------------------------
 ;primeira linha ----------------------------------------------
mov cx, 53  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 53  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 52  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 52  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 51  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 51  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 50  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 49  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 48  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 47  ; column
mov dx, 58  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

;segunda linha -----------------------------------------------------------
mov cx, 54  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 54  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 53  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 53  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 52  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 52  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 51  ; column
 mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 51  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 50  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 49  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 48  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 47  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 57  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 46  ; column
mov dx, 59  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

;terceira linha -----------------------------------------------------------


mov cx, 53  ; column
mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 53  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 52  ; column
mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 52  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 51  ; column
mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 51  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 50  ; column
 mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 49  ; column
mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h    

mov cx, 46  ; column
mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 60  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 


; qurta linha  -----------------------------------------------------------------------------------


mov cx, 50  ; column
mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 49  ; column
 mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 48  ; column
mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 47  ; column
mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 46  ; column
mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 44  ; column
mov dx, 61  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 44  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 


; quinta linha  --------------------------------------------------------------------------------------------------------

mov cx, 48  ; column
mov dx, 62  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 47  ; column
mov dx, 62  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 46  ; column
mov dx, 62  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 62  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 44  ; column
mov dx, 62  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 44  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h

; quinta linha  -------------------------------------------------------------------------

mov cx, 48  ; column
mov dx, 63  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 47  ; column
mov dx, 63  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 46  ; column
mov dx, 63  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 63  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 44  ; column
mov dx, 63  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 44  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
 

; sexta linha  --------------------------------------------------------------------------------

mov cx, 48  ; column
mov dx, 64  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 47  ; column
mov dx, 64  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 46  ; column
mov dx, 64  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 64  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 44  ; column
mov dx, 64  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 44  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 


; s?tima linha  --------------------------------------------------------------------------------

mov cx, 50  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 49  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 48  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 47  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 46  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 44  ; column
mov dx, 65  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 44  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

; oitava linha  --------------------------------------------------------------------------------

mov cx, 52  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 52  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 51  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 51  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 50  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 49  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 48  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 47  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 46  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 45  ; column
mov dx, 66  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 45  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

; nona linha  --------------------------------------------------------------------------------

mov cx, 54  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 54  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 53  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 53  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 52  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 52  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 51  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 51  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 50  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 49  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 48  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 47  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 46  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 46  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

; nona linha  --------------------------------------------------------------------------------



mov cx, 53  ; column
mov dx, 68  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 53  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 52  ; column
mov dx, 68  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 52  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 51  ; column
mov dx, 68  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 51  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 50  ; column
mov dx, 68  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 50  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 49  ; column
mov dx, 68  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 49  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 48  ; column
mov dx, 68  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 48  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 47  ; column
mov dx, 67  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 47  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 


  ;FANTASMA 1 --------------------------------------------------------------------------
  
 ;primeira linha ----------------------------------------------
 mov cx, 93  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 92  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 58  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 87  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;segunda linha ----------------------------------------------
  mov cx, 94  ; column
  mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 94  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 93  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 92  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 87  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 86  ; column
mov dx, 59  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 86  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 




 ;terceira linha ----------------------------------------------
 
   mov cx, 95  ; column
  mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

  mov cx, 94  ; column
  mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 94  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 93  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 92  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 87  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 86  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 86  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 85  ; column
mov dx, 60  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;quarta linha ----------------------------------------------
 
    mov cx, 97  ; column
  mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 92  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 85  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 61  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;quinta linha ----------------------------------------------
 
    mov cx, 97  ; column
    mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 92  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 85  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 62  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;sexta linha ----------------------------------------------
 
    mov cx, 97  ; column
    mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 94  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 94  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 93  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 92  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 857  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 86  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 86  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 85  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;setima linha ----------------------------------------------
 
    mov cx, 97  ; column
    mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 94  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 94  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 93  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 92  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 857  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 86  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 86  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 85  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 64  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Oitava linha ----------------------------------------------
 
    mov cx, 97  ; column
    mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 94  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 94  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 93  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 92  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 87  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 86  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 86  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 85  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 65  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; ona linha ----------------------------------------------
 
    mov cx, 97  ; column
    mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 94  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 94  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 93  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 92  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 87  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 86  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 86  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 85  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 66  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
 ; D?cima linha ----------------------------------------------
 
mov cx, 97  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 97  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 96  ; column
  mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 95  ; column
  mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 95  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 93  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 93  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 92  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 92  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 91  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 88  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 88  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 87  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 87  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 



mov cx, 85  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 85  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 84  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 83  ; column
mov dx, 67  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 83  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


 ; D?cima primeira linha ----------------------------------------------
 

 
    mov cx, 96  ; column
  mov dx, 68  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 96  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 



  
 mov cx, 91  ; column
mov dx, 68  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 91  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 90  ; column
mov dx, 68  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 90  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 89  ; column
mov dx, 68  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 89  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h   



mov cx, 84  ; column
mov dx, 68  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 84  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 





  ;FANTASMA 2 --------------------------------------------------------------------------
  
 ;primeira linha ----------------------------------------------
 mov cx, 133  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 132  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 58  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;segunda linha ----------------------------------------------
 mov cx, 134  ; column
  mov dx, 59  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 133  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 132  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1232  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 126  ; column
mov dx, 59  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 




 ;terceira linha ----------------------------------------------
 
 mov cx, 135  ; column
  mov dx, 60  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

  mov cx, 134  ; column
  mov dx, 60  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 133  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 132  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 126  ; column
mov dx, 60  ; row
mov al, 3 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 125  ; column
mov dx, 60  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;quarta linha ----------------------------------------------
 
 mov cx, 137  ; column
  mov dx, 61  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 61  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 61  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 132  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 125  ; column
mov dx, 61  ; row
mov al,  3 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 61  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;quinta linha ----------------------------------------------
 
 mov cx, 137  ; column
    mov dx, 62  ; row
    mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 62  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 62  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 132  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 125  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 62  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;sexta linha ----------------------------------------------
 
 mov cx, 137  ; column
    mov dx, 63  ; row
    mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 63  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 63  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 133  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 132  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 63  ; row
mov al,  3 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 126  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 125  ; column
mov dx, 63  ; row
mov al, 2  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 63  ; row
mov al,  3 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 63  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;setima linha ----------------------------------------------
 
 mov cx, 137  ; column
    mov dx, 64  ; row
    mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 64  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 64  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 133  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 132  ; column
mov dx, 64  ; row
mov al,  3 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 126  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 125  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 64  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Oitava linha ----------------------------------------------
 
 mov cx, 137  ; column
    mov dx, 65  ; row
    mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 65  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 65  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 133  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 132  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 126  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 125  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 65  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Nona linha ----------------------------------------------
 
 mov cx, 137  ; column
    mov dx, 66  ; row
    mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 66  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 66  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 133  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 132  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 126  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 125  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 66  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
 ; D?cima linha ----------------------------------------------
 
 mov cx, 137  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 136  ; column
  mov dx, 67  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 135  ; column
  mov dx, 67  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 133  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 133  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 132  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 132  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 131  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 128  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 128  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 127  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 127  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 



mov cx, 125  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 125  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 124  ; column
mov dx, 67  ; row
mov al,  3 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 123  ; column
mov dx, 67  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 123  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


 ; D?cima primeira linha ----------------------------------------------
 

 
 mov cx, 136  ; column
  mov dx, 68  ; row
  mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 


  
 mov cx, 131  ; column
mov dx, 68  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 131  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 130  ; column
mov dx, 68  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 130  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 129  ; column
mov dx, 68  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 129  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h   


mov cx, 124  ; column
mov dx, 68  ; row
mov al, 3  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 124  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 



  ;FANTASMA 3 --------------------------------------------------------------------------
  
 ;primeira linha ----------------------------------------------
 mov cx, 173  ; column
mov dx, 58  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 172  ; column
mov dx, 58  ; row
mov al,  4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 58  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 58  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 58  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 58  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 58  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;segunda linha ----------------------------------------------
 mov cx, 174  ; column
  mov dx, 59  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 174  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 173  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 172  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 166  ; column
mov dx, 59  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 166  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;terceira linha ----------------------------------------------
 
 mov cx, 175  ; column
  mov dx, 60  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

  mov cx, 174  ; column
  mov dx, 60  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 174  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 173  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 172  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 166  ; column
mov dx, 60  ; row
mov al, 4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 126  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 165  ; column
mov dx, 60  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;quarta linha ----------------------------------------------
 
 mov cx, 177  ; column
  mov dx, 61  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 61  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 61  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 172  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 165  ; column
mov dx, 61  ; row
mov al,  4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 61  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;quinta linha ----------------------------------------------
 
 mov cx, 177  ; column
    mov dx, 62  ; row
    mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 62  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 62  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 172  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 165  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 62  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;sexta linha ----------------------------------------------
 
 mov cx, 177  ; column
    mov dx, 63  ; row
    mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 63  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 63  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 174  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 174  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 173  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 172  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 63  ; row
mov al,  4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 166  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 166  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 165  ; column
mov dx, 63  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 63  ; row
mov al,  4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 63  ; row
mov al,4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;setima linha ----------------------------------------------
 
 mov cx, 177  ; column
    mov dx, 64  ; row
    mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 64  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 64  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 174  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 174  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 173  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 172  ; column
mov dx, 64  ; row
mov al,  4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 166  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 166  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 165  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 64  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Oitava linha ----------------------------------------------
 
 mov cx, 177  ; column
    mov dx, 65  ; row
    mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 65  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 65  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 174  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 174  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 173  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 172  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 166  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 166  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 165  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 65  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Nona linha ----------------------------------------------
 
 mov cx, 177  ; column
    mov dx, 66  ; row
    mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 66  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 66  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 174  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 174  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 173  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 172  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 166  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 166  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 165  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 66  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
 ; D?cima linha ----------------------------------------------
 
 mov cx, 177  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 177  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 176  ; column
  mov dx, 67  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 175  ; column
  mov dx, 67  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 175  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 173  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 173  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 172  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 172  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 171  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 168  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 168  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 167  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 167  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 



mov cx, 165  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 165  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 164  ; column
mov dx, 67  ; row
mov al,  4 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 163  ; column
mov dx, 67  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 163  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


 ; D?cima primeira linha ----------------------------------------------
 

 
 mov cx, 176  ; column
  mov dx, 68  ; row
  mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 176  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

  
 mov cx, 171  ; column
mov dx, 68  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 171  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 170  ; column
mov dx, 68  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 170  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 169  ; column
mov dx, 68  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 169  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h   


mov cx, 164  ; column
mov dx, 68  ; row
mov al, 4  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 


  ;FANTASMA 4 --------------------------------------------------------------------------
  
 ;primeira linha ----------------------------------------------
 mov cx, 213  ; column
mov dx, 58  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 212  ; column
mov dx, 58  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 58  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 58  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 58  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 58  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 58  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;segunda linha ----------------------------------------------
 mov cx, 214  ; column
  mov dx, 59  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 214  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 213  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 212  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 206  ; column
mov dx, 59  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1206  ; column
mov dx, 59  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;terceira linha ----------------------------------------------
 
 mov cx, 215  ; column
  mov dx, 60  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

  mov cx, 214  ; column
  mov dx, 60  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 214  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 213  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 212  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 206  ; column
mov dx, 60  ; row
mov al, 5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 206  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 205  ; column
mov dx, 60  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 60  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;quarta linha ----------------------------------------------
 
 mov cx, 217  ; column
  mov dx, 61  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 61  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 61  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 212  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 205  ; column
mov dx, 61  ; row
mov al, 5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 61  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;quinta linha ----------------------------------------------
 
 mov cx, 217  ; column
    mov dx, 62  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 62  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 62  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 
mov cx, 212  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 205  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 62  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 62  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;sexta linha ----------------------------------------------
 
 mov cx, 217  ; column
    mov dx, 63  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 63  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 63  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 214  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 214  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 213  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 212  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 63  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 206  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 206  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 205  ; column
mov dx, 63  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 63  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 63  ; row
mov al,5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h

 ;setima linha ----------------------------------------------
 
 mov cx, 217  ; column
    mov dx, 64  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 64  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 64  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 214  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 214  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 213  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 212  ; column
mov dx, 64  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 63  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 206  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 206  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 205  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 64  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 64  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Oitava linha ----------------------------------------------
 
 mov cx, 217  ; column
    mov dx, 65  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 65  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 65  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 214  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 214  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 213  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 212  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 206  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 206  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 205  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 65  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Nona linha ----------------------------------------------
 
 mov cx, 217  ; column
    mov dx, 66  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 66  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 66  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 214  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 214  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 213  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 65  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 212  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 206  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 206  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 205  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 66  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 66  ; row
mov ah, 0dh ; get pixel
int 10h 
 ; D?cima linha ----------------------------------------------
 
 mov cx, 217  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 217  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 216  ; column
  mov dx, 67  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 215  ; column
  mov dx, 67  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 215  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 213  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 213  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 212  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 212  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 211  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 208  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 208  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 207  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 207  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 205  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 205  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 204  ; column
mov dx, 67  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 204  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 203  ; column
mov dx, 67  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 203  ; column
mov dx, 67  ; row
mov ah, 0dh ; get pixel
int 10h 


 ; D?cima primeira linha ----------------------------------------------
 

 
 mov cx, 216  ; column
  mov dx, 68  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 216  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

  
 mov cx, 211  ; column
mov dx, 68  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 211  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 210  ; column
mov dx, 68  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 210  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 209  ; column
mov dx, 68  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 209  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h   


mov cx, 204  ; column
mov dx, 68  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 164  ; column
mov dx, 68  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;FIM DESENHANDO PIXELS --------------------------------------------------------------------------

   LACO_: 
    
    mov AH, 01
    int 16h        
 
    cmp Al, CR              ; verifica se eh ENTER
    jz PRESSENTER       ; jz == je  
    
    jz LACO_
    
    mov ah, 00h ; get the keystroke
    int 16h  
    
    cmp AL, 0
    je TECLAESPECIAL
       
    mov DL, AL
    mov AH, 02
    int 21h        
            
    jmp LACO_ 
  
      PRESSENTER:  
    
    mov AL, 13H
    mov AH, 0
    int 10H
    
    mov bp,OFFSET campo1   ; ES:BP aponta para a mensagem
mov ah,13h      ; fun??o 13 - escrever string
mov al,0h      ; atributo em bl,move cursor
xor bh,bh       ; p?gina de v?deo 0
mov bl,15       ; cor
mov cx,TAM_MSG3       ; comprimento da string
mov dh,0      ; linha para colocar a string
mov dl,0        ; coluna para colocar a string
int 10h         ; chamada de servi?o bios
  
    mov bp,OFFSET campo2   ; ES:BP aponta para a mensagem
mov ah,13h      ; fun??o 13 - escrever string
mov al,0h      ; atributo em bl,move cursor
xor bh,bh       ; p?gina de v?deo 0
mov bl,15       ; cor
mov cx,TAM_MSG4       ; comprimento da string
mov dh,0      ; linha para colocar a string
mov dl,72        ; coluna para colocar a string
int 10h         ; chamada de servi?o bios
    
    mov bp,OFFSET campo3   ; ES:BP aponta para a mensagem
mov ah,13h      ; fun??o 13 - escrever string
mov al,0h      ; atributo em bl,move cursor
xor bh,bh       ; p?gina de v?deo 0
mov bl,2       ; cor
mov cx,TAM_MSG5       ; comprimento da string
mov dh,0      ; linha para colocar a string
mov dl,6        ; coluna para colocar a string
int 10h         ; chamada de servi?o bios
  
    mov bp,OFFSET campo4   ; ES:BP aponta para a mensagem
mov ah,13h      ; fun??o 13 - escrever string
mov al,0h      ; atributo em bl,move cursor
xor bh,bh       ; p?gina de v?deo 0
mov bl,2       ; cor
mov cx,TAM_MSG6       ; comprimento da string
mov dh,0      ; linha para colocar a string
mov dl,78        ; coluna para colocar a string
int 10h         ; chamada de servi?o bios

jmp JOGO

    TECLAESPECIAL:
 
    cmp AH, 48H ; Tecla para cima
    je MOVECIMA
    
    cmp AH, 50H
    je MOVEBAIXO
    
    jmp LACO_
    
 MOVECIMA:        
 
     xor BH, BH
    mov DH, 12
    mov DL, 14
    mov AH, 2
    int 10H

    mov DL, ' '    
    mov AH, 02
    int 21h        
      
   xor BH, BH
    mov DH, 12
    mov DL, 22
    mov AH, 2
    int 10H

    mov DL, ' '    
    mov AH, 02
    int 21h     
 
    xor BH, BH
    mov DH, 11
    mov DL, 14
    mov AH, 2
    int 10H
    
     
    mov DL, '['    
    mov AH, 02
    int 21h        
                
                
    xor BH, BH
    mov DH, 11
    mov DL, 22
    mov AH, 2
    int 10H
    
     
    mov DL, ']'    
    mov AH, 02
    int 21h  
    
    jmp LACO_ 
    
 MOVEBAIXO:
   xor BH, BH
    mov DH, 11
    mov DL, 14
    mov AH, 2
    int 10H
     
    mov DL, ' '    
    mov AH, 02
    int 21h                 
                
    xor BH, BH
    mov DH, 11
    mov DL, 22
    mov AH, 2
    int 10H
     
    mov DL, ' '    
    mov AH, 02
    int 21h  
    
    xor BH, BH
    mov DH, 12
    mov DL, 14
    mov AH, 2
    int 10H

    mov DL, '['    
    mov AH, 02
    int 21h        
      
   xor BH, BH
    mov DH, 12
    mov DL, 22
    mov AH, 2
    int 10H

    mov DL, ']'    
    mov AH, 02
    int 21h         
            
    jmp LACO_ 

    JOGO:

   
  ;PACMAN --------------------------------------------------------------------------
 ;primeira linha ----------------------------------------------
 mov cx, 140  ; column
 mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 142  ; column
mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 142  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 141  ; column
mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 140  ; column
mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 139  ; column
mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 138  ; column
mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 137  ; column
mov dx, 180  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 180  ; row
mov ah, 0dh ; get pixel
int 10h 

;segunda linha -----------------------------------------------------------
mov cx, 144  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 144  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 143  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 143  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 142  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 142  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 141  ; column
 mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 141  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 140  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 139  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 138  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 137  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 136  ; column
mov dx, 181  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 181  ; row
mov ah, 0dh ; get pixel
int 10h 

;terceira linha -----------------------------------------------------------


mov cx, 143  ; column
mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 143  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 142  ; column
mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 142  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 141  ; column
mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 141  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 140  ; column
 mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 139  ; column
mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h    

mov cx, 136  ; column
mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 182  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 182  ; row
mov ah, 0dh ; get pixel
int 10h 


; qurta linha  -----------------------------------------------------------------------------------


mov cx, 140  ; column
mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 139  ; column
 mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 138  ; column
mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 137  ; column
mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 136  ; column
mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 183  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 183  ; row
mov ah, 0dh ; get pixel
int 10h 


; quinta linha  --------------------------------------------------------------------------------------------------------

mov cx, 138  ; column
mov dx, 184  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 184  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 137  ; column
mov dx, 184  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 184  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 136  ; column
mov dx, 184  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 184  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 184  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 184  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 184  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 184  ; row
mov ah, 0dh ; get pixel
int 10h

; quinta linha  -------------------------------------------------------------------------

mov cx, 138  ; column
mov dx, 185  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 185  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 137  ; column
mov dx, 185  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 185  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 136  ; column
mov dx, 185  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 185  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 185  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 185  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 185  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 185  ; row
mov ah, 0dh ; get pixel
int 10h 
 

; sexta linha  --------------------------------------------------------------------------------

mov cx, 138  ; column
mov dx, 186  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 186  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 137  ; column
mov dx, 186  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 186  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 136  ; column
mov dx, 186  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 186  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 186  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 186  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 186  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 186  ; row
mov ah, 0dh ; get pixel
int 10h 


; s?tima linha  --------------------------------------------------------------------------------

mov cx, 140  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 139  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 138  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 137  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 136  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 134  ; column
mov dx, 187  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 134  ; column
mov dx, 187  ; row
mov ah, 0dh ; get pixel
int 10h 

; oitava linha  --------------------------------------------------------------------------------

mov cx, 142  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 142  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 141  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 141  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 140  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 139  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 138  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 137  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 136  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 135  ; column
mov dx, 188  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 135  ; column
mov dx, 188  ; row
mov ah, 0dh ; get pixel
int 10h 

; nona linha  --------------------------------------------------------------------------------

mov cx, 144  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 144  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 143  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 143  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 142  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 142  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 141  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 141  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 140  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 139  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 138  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 137  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 136  ; column
mov dx, 189  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 136  ; column
mov dx, 189  ; row
mov ah, 0dh ; get pixel
int 10h 

; nona linha  --------------------------------------------------------------------------------



mov cx, 143  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 143  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 142  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 142  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 141  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 141  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 140  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 140  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 139  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 139  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 138  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 138  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 137  ; column
mov dx, 190  ; row
mov al, 14  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 137  ; column
mov dx, 190  ; row
mov ah, 0dh ; get pixel
int 10h 


  ;FANTASMA 4 --------------------------------------------------------------------------
  
 ;primeira linha ----------------------------------------------
 mov cx, 11  ; column
 mov dx, 20  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 11  ; column
mov dx, 20  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 10  ; column
mov dx, 20  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 20  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 9  ; column
mov dx, 20  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 20  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 8  ; column
mov dx, 20  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 58  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 7  ; column
mov dx, 20  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 20  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 6  ; column
mov dx, 20  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 20  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 5  ; column
mov dx, 20  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 20  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;segunda linha ----------------------------------------------
 mov cx, 12  ; column
 mov dx, 21  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 11  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 11  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 10  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 9  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 8  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 7  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 6  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 5  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 4  ; column
mov dx, 21  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; column
mov dx, 21  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;terceira linha ----------------------------------------------
 
 mov cx, 13  ; column
 mov dx, 22  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 

  mov cx, 12  ; column
  mov dx, 22  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 11  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 11  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 10  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 9  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 8  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 7  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 6  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 5  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 4  ; column
mov dx, 22  ; row
mov al, 5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 22  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 22  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;quarta linha ----------------------------------------------
 
 
  mov cx, 15  ; column
 mov dx, 23  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 

 mov cx, 14  ; column
 mov dx, 23  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 13  ; column
  mov dx, 23  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 12  ; column
  mov dx, 23  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 



mov cx, 9  ; column
mov dx, 23  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 8  ; column
mov dx, 23  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 61  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 7  ; column
mov dx, 23  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 4  ; column
mov dx, 23  ; row
mov al, 5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 23  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 23  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 23  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 23  ; row
mov ah, 0dh ; get pixel
int 10h 
 ;quinta linha ----------------------------------------------
  mov cx, 15  ; column
 mov dx, 24  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 
 
 mov cx, 14  ; column
 mov dx, 24  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 13  ; column
    mov dx, 24  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 12  ; column
   mov dx, 24  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 



mov cx, 9  ; column
mov dx, 24  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 8  ; column
mov dx, 24  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 7  ; column
mov dx, 24  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 4  ; column
mov dx, 24  ; row
mov al, 5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 24  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 24  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 24  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 24  ; row
mov ah, 0dh ; get pixel
int 10h 


 ;sexta linha ----------------------------------------------
 
  mov cx, 15  ; column
 mov dx, 25  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

 
 mov cx, 14  ; column
 mov dx, 25  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 13  ; column
    mov dx, 25  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 12  ; column
   mov dx, 25  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 11  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 11  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 10  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 9  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 8  ; column
 mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 7  ; column
mov dx, 25  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 6  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 5  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 4  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 25  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 25  ; row
mov ah, 0dh ; get pixel
int 10h 

 ;setima linha ----------------------------------------------
  mov cx, 15  ; column
 mov dx, 26  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

 mov cx, 14  ; column
 mov dx, 26  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 13  ; column
    mov dx, 26  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 12  ; column
   mov dx, 26  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 11  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 11  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 10  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 9  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 8  ; column
 mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 7  ; column
mov dx, 26  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 6  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 5  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 4  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 26  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 26  ; row
mov ah, 0dh ; get pixel
int 10h 

 ; Oitava linha ----------------------------------------------
 
  mov cx, 15  ; column
 mov dx, 27  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

 mov cx, 14  ; column
 mov dx, 27  ; row
    mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 13  ; column
    mov dx, 27  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 12  ; column
   mov dx, 27  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 11  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 11  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 10  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 
 
mov cx, 9  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 8  ; column
 mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 7  ; column
mov dx, 27  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 6  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 5  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 4  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 4  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 27  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 27  ; row
mov ah, 0dh ; get pixel
int 10h 
 ; Nona linha ----------------------------------------------
 
 mov cx, 15  ; column
 mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 14  ; column
  mov dx, 28  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 13  ; column
  mov dx, 28  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h


 
mov cx, 12  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 12  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 
  
 mov cx, 10  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 10  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 9  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 8  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 7  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 6  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 5  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 5  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 28  ; row
mov al,  5 ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 28  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 28  ; row
mov ah, 0dh ; get pixel
int 10h 


 ; D?cima linha ----------------------------------------------
 
 mov cx, 15  ; column
 mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 15  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 

 
    mov cx, 14  ; column
  mov dx, 29  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 

 
   mov cx, 13  ; column
  mov dx, 29  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 13  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h

mov cx, 9  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 9  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 8  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h   

mov cx, 7  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 6  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 6  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 3  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 3  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 2  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 

mov cx, 1  ; column
mov dx, 29  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 1  ; column
mov dx, 29  ; row
mov ah, 0dh ; get pixel
int 10h 
 ; D?cima primeira linha ----------------------------------------------
 

 
 mov cx, 14  ; column
 mov dx, 30  ; row
  mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 14  ; column
mov dx, 30  ; row
mov ah, 0dh ; get pixel
int 10h 


mov cx, 8  ; column
mov dx, 30  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 8  ; column
mov dx, 30  ; row
mov ah, 0dh ; get pixel
int 10h    
    
mov cx, 7  ; column
mov dx, 30  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 7  ; column
mov dx, 30  ; row
mov ah, 0dh ; get pixel
int 10h   


mov cx, 2  ; column
mov dx, 30  ; row
mov al, 5  ; white
mov ah, 0ch ; put pixel
int 10h

xor al, al  ; al = 0

mov cx, 2  ; column
mov dx, 30  ; row
mov ah, 0dh ; get pixel
int 10h 


















end main 