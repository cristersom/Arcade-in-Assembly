.model small

.stack 100h

.data
  
cacador db 0,0,0,14,14,14,14,14,14,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         db 0,0,0,0,0,0,0,0,0,0,0,0
         
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
    
    mov DI, 19260
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
    
      mov ax, @data 
         mov ds, ax  
    
         ;continua
      
      mov ah, 4ch
      int 21h
    
    end main