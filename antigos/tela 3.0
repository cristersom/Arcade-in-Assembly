.model small
.stack 100h

.data

    CR equ 13
    NL equ 10                       
     
    msg      db "                            __   __   " , CR, NL
             db "    ___ ___________ ___ _  / /  / /__ " , CR, NL
             db "   (_-</ __/ __/ _ `/  ' \/ _ \/ / -_)", CR, NL
             db "  /___/\__/_/  \_,_/_/_/_/_.__/_/\__/ " 
                                                                                                                      
    TAM_MSG equ $-msg 

    nomes    db 'Cristersom Simionato, Wellinton Sartori', CR, NL
    TAM_NOMES equ $-nomes 

    ; Strings separadas para o menu (com alinhamento corrigido)
    menu_jogar_des db '                Jogar  '
    TAM_JOGAR_DES  equ $-menu_jogar_des
    menu_jogar_sel db '              [ Jogar ]'
    TAM_JOGAR_SEL  equ $-menu_jogar_sel
    
    menu_sair_des  db '                Sair   '
    TAM_SAIR_DES   equ $-menu_sair_des
    menu_sair_sel db '              [ Sair ] '
    TAM_SAIR_SEL   equ $-menu_sair_sel

    menu_selecionado db 0 ; 0 = Jogar, 1 = Sair

    campo3     db '000'
    TAM_MSG5 equ $-campo3 

    campo4     db '60'
    TAM_MSG6 equ $-campo4 

    campo1     db 'SCORE: '
    TAM_MSG3 equ $-campo1 

    campo2     db 'TEMPO: '
    TAM_MSG4 equ $-campo2 

    sprite_vazio db (13*17) dup(0) ; Sprite preto 17x13 para apagar

    ; Coordenadas para a animacao do menu
    nave_aliada_x dw 100 
    nave_aliada_y dw 60  
    nave_alien_x dw 120 
    nave_alien_y dw 60  
    meteoro_x dw 140    
    meteoro_y dw 60     
    nave3_x dw 160      
    nave3_y dw 60       
    direcao_atual dw 1  

    ; Variaveis para o delay (50ms)
    delay_cx dw 0
    delay_dx dw 50000 

; (Sprites ... mantidos)
nave_cacador db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 12,12,12,12,12,12,0,0,0,0,0,0,0,0,0,0,0
             db 15,15,15,15,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,15,15,15,0,0,0,0,0,0,15,15,15,15,0,0
             db 0,0,0,0,15,15,15,0,0,0,15,15,0,0,0,15,0
             db 0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,15
             db 14,0,14,0,14,15,15,15,15,15,15,15,15,15,15,15,15
             db 0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,0
             db 0,0,0,0,15,15,15,0,0,0,0,15,15,15,15,0,0
             db 0,0,15,15,15,0,0,0,0,0,0,0,0,0,0,0,0
             db 15,15,15,15,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 12,12,12,12,12,12,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
nave1 db 0,0,0,0,0,0,0,14,14,14,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,14,14,14,0,0,0,0,0,0,0
      db 0,0,0,0,0,14,14,14,14,14,14,14,0,0,0,0,0
      db 0,0,0,0,0,14,14,14,14,14,14,14,0,0,0,0,0
      db 0,0,0,2,2,0,0,2,2,2,0,0,2,2,0,0,0
      db 0,0,0,2,2,0,0,2,2,2,0,0,2,2,0,0,0
      db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
      db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
      db 0,0,0,0,0,13,13,0,14,0,13,13,0,0,0,0,0
      db 0,0,0,0,0,13,13,0,0,0,13,13,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
nave2 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,6,6,6,0,0,6,6,6,0,0,0,0
      db 0,0,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0
      db 0,6,6,5,0,0,0,5,5,5,6,0,0,0,0,0,0
      db 6,6,5,5,0,0,0,5,5,5,5,5,0,5,6,0,0
      db 5,5,5,5,5,5,5,5,0,0,0,5,5,0,0,0,0
      db 5,5,5,5,5,5,5,5,0,0,0,5,5,5,5,5,5
      db 6,5,5,0,0,0,5,5,5,5,5,6,0,0,0,0,0
      db 0,6,5,0,0,0,5,5,6,6,6,6,6,6,0,0,0
      db 0,0,0,6,6,6,6,6,6,6,0,0,0,0,0,0,0
      db 0,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
nave3 db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,7,7,7,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,0,0,0,4,4,4,0,0,0,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
nave4 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.code 

desenha_fantasma proc
  push es         
  mov AX, 0A000H
  mov ES, AX
  mov DX, 13      
laco_fantasma:
  mov CX, 17     
LACO_LINHA:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_LINHA
    add DI, 303    
    dec DX
    jnz laco_fantasma
  pop es          
  ret
endp 

atualiza_menu proc
    cmp menu_selecionado, 0
    je .desenha_jogar_selecionado
.desenha_sair_selecionado:
    mov bp, OFFSET menu_jogar_des
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Fh         
    mov cx, TAM_JOGAR_DES
    mov dh, 11          
    mov dl, 0           
    int 10h
    mov bp, OFFSET menu_sair_sel
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Ch         
    mov cx, TAM_SAIR_SEL
    mov dh, 12          
    mov dl, 0
    int 10h
    jmp .fim
.desenha_jogar_selecionado:
    mov bp, OFFSET menu_jogar_sel
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Ch         
    mov cx, TAM_JOGAR_SEL
    mov dh, 11          
    mov dl, 0
    int 10h
    mov bp, OFFSET menu_sair_des
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Fh         
    mov cx, TAM_SAIR_DES
    mov dh, 12          
    mov dl, 0
    int 10h
.fim:
    ret
atualiza_menu endp

calcula_posicao proc
    ; Entrada: AX = Y, DX = X
    ; Saida: DI = Endereco na memoria de video (A000:DI)
    push dx         
    push cx
    mov cx, 320     
    mul cx          
    pop cx
    pop dx          
    add ax, dx      
    mov di, ax      
    ret
calcula_posicao endp

main:  
    mov ax, @data 
    mov ds, ax  
    mov Es, ax  

    mov AL, 13H
    mov AH, 0
    int 10H

    mov bp,OFFSET msg   
    mov ah,13h      
    mov al,0h       
    xor bh,bh       
    mov bl, 0Ah     
    mov cx,TAM_MSG  
    mov dh,0        
    mov dl,0        
    int 10h         

    mov bp,OFFSET nomes   
    mov ah,13h      
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_NOMES 
    mov dh,10 
    mov dl,0
    int 10h

    call atualiza_menu 

LOOP_MENU_ANIMADO:

    ; 1. Checar teclado
    mov ah, 01h       
    int 16h
    jz .pular_teclado 
    
    mov ah, 00h
    int 16h
    
    cmp AL, 0
    jne .checar_enter
    jmp TECLAESPECIAL 
.checar_enter:
    cmp AL, CR
    jne .pular_teclado 
    jmp PRESSENTER     
    
.pular_teclado:

    ; 2. Animação
    ; --- APAGAR SPRITES ANTIGOS ---
    mov ax, meteoro_y
    mov dx, meteoro_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma

    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma

    mov ax, nave_alien_y
    mov dx, nave_alien_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma
    
    mov ax, nave3_y
    mov dx, nave3_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma
    
    ; --- ATUALIZAR COORDENADAS (Movimento Unificado) ---
    mov ax, direcao_atual
    
    add nave_aliada_x, ax
    add nave_alien_x, ax
    add meteoro_x, ax
    add nave3_x, ax 
    
    ; --- VERIFICAR BORDAS E INVERTER DIRECAO ---
    cmp nave_aliada_x, 0
    jle .inverter
    cmp nave_alien_x, 0
    jle .inverter
    cmp meteoro_x, 0
    jle .inverter
    cmp nave3_x, 0  
    jle .inverter
    
    cmp nave_aliada_x, 303
    jge .inverter
    cmp nave_alien_x, 303
    jge .inverter
    cmp meteoro_x, 303
    jge .inverter
    cmp nave3_x, 303 
    jge .inverter
    
    jmp .desenhar 

.inverter:
    mov ax, direcao_atual
    neg ax 
    mov direcao_atual, ax

.desenhar:    
    ; --- DESENHAR SPRITES NOVOS ---
    mov ax, meteoro_y
    mov dx, meteoro_x
    call calcula_posicao
    mov bx, offset nave2 
    call desenha_fantasma

    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, offset nave_cacador
    call desenha_fantasma

    mov ax, nave_alien_y
    mov dx, nave_alien_x
    call calcula_posicao
    mov bx, offset nave1
    call desenha_fantasma

    mov ax, nave3_y
    mov dx, nave3_x
    call calcula_posicao
    mov bx, offset nave3
    call desenha_fantasma

    ; --- DELAY ---
    mov ah, 86h
    mov cx, delay_cx
    mov dx, delay_dx
    int 15h
    
    jmp LOOP_MENU_ANIMADO 

PRESSENTER:  
    cmp menu_selecionado, 1
    je SAIR_DO_JOGO

    ; Limpa a tela para o jogo
    mov AL, 13H
    mov AH, 0
    int 10H

    mov ax, @data 
    mov ds, ax  
    mov Es, ax   

    ; Desenha HUD do Jogo
    mov bp,OFFSET campo1
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG3
    mov dh,0
    mov dl,0
    int 10h

    mov bp,OFFSET campo2
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG4
    mov dh,0
    mov dl,72
    int 10h

    mov bp,OFFSET campo3
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,TAM_MSG5
    mov dh,0
    mov dl,6
    int 10h

    mov bp,OFFSET campo4
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,TAM_MSG6
    mov dh,0
    mov dl,78
    int 10h

    jmp JOGO

SAIR_DO_JOGO:
    mov AH, 0
    mov AL, 3  ; Modo texto
    int 10H
    mov ah, 4ch 
    int 21h

TECLAESPECIAL:
    cmp AH, 48H 
    je MOVECIMA
    cmp AH, 50H 
    je MOVEBAIXO
    jmp LOOP_MENU_ANIMADO 
MOVECIMA:
    cmp menu_selecionado, 0  
    jne .pula_movecima       
    jmp LOOP_MENU_ANIMADO    
.pula_movecima:
    dec menu_selecionado     
    call atualiza_menu       
    jmp LOOP_MENU_ANIMADO
MOVEBAIXO:
    cmp menu_selecionado, 1  
    jne .pula_movebaixo      
    jmp LOOP_MENU_ANIMADO    
.pula_movebaixo:
    inc menu_selecionado     
    call atualiza_menu       
    jmp LOOP_MENU_ANIMADO

    mov ax, @data 
    mov ds, ax  

JOGO:
    ; --- INICIO DA CORREÇÃO (Posicionamento) ---
    ; Desenhando as naves estáticas da tela de JOGO
    ; usando (X, Y) e a 'calcula_posicao'
    
    ; Nave Aliada (embaixo, no centro)
    mov ax, 185  ; Y
    mov dx, 150  ; X
    call calcula_posicao
    mov bx, offset nave_cacador
    call desenha_fantasma

    ; Nave Inimiga 1 (Cima, Esquerda)
    mov ax, 65   ; Y
    mov dx, 30   ; X (Valor seguro, longe da borda 0)
    call calcula_posicao
    mov bx, offset nave1
    call desenha_fantasma

    ; Nave Inimiga 2 (Meio, Centro)
    mov ax, 100  ; Y
    mov dx, 150  ; X
    call calcula_posicao
    mov bx, offset nave2
    call desenha_fantasma

    ; Nave Inimiga 3 (Cima, Direita)
    mov ax, 65   ; Y
    mov dx, 270  ; X (Valor seguro, longe da borda 319)
    call calcula_posicao
    mov bx, offset nave3
    call desenha_fantasma

    ; Nave Inimiga 4 (Invisivel, mas posicionada)
    mov ax, 100  ; Y
    mov dx, 30   ; X
    call calcula_posicao
    mov bx, offset nave4
    call desenha_fantasma
    ; --- FIM DA CORREÇÃO ---
 
    ; Espera uma tecla antes de sair
    mov ah, 1
    int 21h  

    mov ah, 4ch
    int 21h

end main