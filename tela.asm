.model small

.stack 100h

.data
    
    CR equ 13
    NL equ 10                       
                   
     msg      db '      ___                        __    ' , CR, NL
              db '     /   |  ______________ _____/ /__  ' , CR, NL
              db '    / /| | / ___/ ___/ __ `/ __  / _ \ ' , CR, NL
              db '   / ___ |/ /  / /__/ /_/ / /_/ /  __/ ' , CR, NL
              db '  /_/  |_/_/   \___/\__,_/\__,_/\___/  ' 
              
    TAM_MSG equ $-msg 
      
    nomes    db 'Cristersom Simionato, Wellinton Sartori', CR, NL
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
   
   cacador db 0,0,0,14,14,14,14,14,14,0,0,0
         db 0,0,14,14,14,14,14,14,14,14,0,0
         db 0,14,14,0,0,14,14,14,14,0,0,0
         db 14,14,14,14,14,14,14,0,0,0,0,0
         db 14,14,14,14,14,0,0,0,0,0,0,0
         db 14,14,14,14,14,0,0,0,0,0,0,0
         db 14,14,14,14,14,14,0,0,0,0,0,0
         db 0,14,14,14,14,14,14,14,0,0,0,0
         db 0,0,14,14,14,14,14,14,14,14,0,0
         db 0,0,0,14,14,14,14,14,14,0,0,0
         
fantasma db 0,0,0,2,2,2,2,2,0,0,0,0
         db 0,0,2,2,2,2,2,2,2,0,0,0
         db 0,2,2,0,0,2,0,0,2,2,0,0
         db 0,2,2,0,0,2,0,0,2,2,0,0
         db 2,2,2,2,2,2,2,2,2,2,2,0
         db 2,2,2,2,2,2,2,2,2,2,2,0
         db 2,2,2,2,2,2,2,2,2,2,2,0
         db 2,2,2,2,2,2,2,2,2,2,2,0
         db 2,2,2,2,2,2,2,2,2,2,2,0
         db 0,2,2,0,2,2,0,2,2,0,0,0
         
fantasma2 db 0,0,0,3,3,3,3,3,0,0,0,0
         db 0,0,3,3,3,3,3,3,3,0,0,0
         db 0,3,3,0,0,3,0,0,3,3,0,0
         db 0,3,3,0,0,3,0,0,3,3,0,0
         db 3,3,3,3,3,3,3,3,3,3,3,0
         db 3,3,3,3,3,3,3,3,3,3,3,0
         db 3,3,3,3,3,3,3,3,3,3,3,0
         db 3,3,3,3,3,3,3,3,3,3,3,0
         db 3,3,3,3,3,3,3,3,3,3,3,0
         db 0,3,3,0,3,3,0,3,3,0,0,0
         
fantasma3 db 0,0,0,4,4,4,4,4,0,0,0,0
         db 0,0,4,4,4,4,4,4,4,0,0,0
         db 0,4,4,0,0,4,0,0,4,4,0,0
         db 0,4,4,0,0,4,0,0,4,4,0,0
         db 4,4,4,4,4,4,4,4,4,4,4,0
         db 4,4,4,4,4,4,4,4,4,4,4,0
         db 4,4,4,4,4,4,4,4,4,4,4,0
         db 4,4,4,4,4,4,4,4,4,4,4,0
         db 4,4,4,4,4,4,4,4,4,4,4,0
         db 0,4,4,0,4,4,0,4,4,0,0,0
         
 fantasma4 db 0,0,0,5,5,5,5,5,0,0,0,0
         db 0,0,5,5,5,5,5,5,5,0,0,0
         db 0,5,5,0,0,5,0,0,5,5,0,0
         db 0,5,5,0,0,5,0,0,5,5,0,0
         db 5,5,5,5,5,5,5,5,5,5,5,0
         db 5,5,5,5,5,5,5,5,5,5,5,0
         db 5,5,5,5,5,5,5,5,5,5,5,0
         db 5,5,5,5,5,5,5,5,5,5,5,0
         db 5,5,5,5,5,5,5,5,5,5,5,0
         db 0,5,5,0,5,5,0,5,5,0,0,0 
   
.code 

desenha_fantasma proc

  mov AX, 0A000H
  mov ES, AX
  mov DX, 10
  
  laco_fantasma:
      mov CX, 12
      LACO_LINHA:
      mov AL, [BX]
      
      stosb
      inc BX
       
      loop LACO_LINHA
      
      add DI, 308
      dec DX
      jnz laco_fantasma    
         
  ret
endp 
    
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
 
     mov DI, 19270
    mov BX, offset cacador
    call desenha_fantasma   
        mov DI, 19310 
    mov BX, offset fantasma
    call desenha_fantasma
    mov DI, 19350
    mov BX, offset fantasma2
    call desenha_fantasma
    mov DI, 19390
    mov BX, offset fantasma3
    call desenha_fantasma
    mov DI, 19430
    mov BX, offset fantasma4
    call desenha_fantasma

    mov ah, 1
    int 21h 
    
    mov AX, 0A000H
    mov ES, AX
    mov DS, AX
    mov DI, 19279
    mov SI, 19280

    mov CX,3200
    cld
    rep movsb

    MOV  CX, 0FH
    MOV  DX, 4240H
    MOV  AH, 86H
    INT  15H  
      
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
    
    mov ax, @data 
    mov ds, ax  
    mov Es, ax   
         
         
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


      mov ax, @data 
         mov ds, ax  
    
    JOGO:

    mov DI, 60635
    mov BX, offset cacador
    call desenha_fantasma   

    mov DI, 20801 
    mov BX, offset fantasma
    call desenha_fantasma 
    mov DI, 20955 
    mov BX, offset fantasma
    call desenha_fantasma 
    mov DI, 21109 
    mov BX, offset fantasma
    call desenha_fantasma 

    mov DI, 14721
    mov BX, offset fantasma2
    call desenha_fantasma 
    mov DI, 14875
    mov BX, offset fantasma3
    call desenha_fantasma
    mov DI, 15029
    mov BX, offset fantasma2
    call desenha_fantasma  
    
    mov DI, 08641
    mov BX, offset fantasma4
    call desenha_fantasma   
    mov DI, 08949
    mov BX, offset fantasma4
    call desenha_fantasma
    
        mov ah, 1
    int 21h 
    
      mov ah, 4ch
      int 21h


end main 