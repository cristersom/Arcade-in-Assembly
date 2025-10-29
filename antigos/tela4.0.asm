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

    ; --- VARIAVEIS DA FASE 1 ---
    player_x dw 10  
    player_y dw 91  
    
    enemy1_x dw 340 
    enemy1_y dw 65
    enemy2_x dw 380 
    enemy2_y dw 100
    enemy3_x dw 420 
    enemy3_y dw 130
    
    ; Variaveis do Tiro
    tiro_ativo db 0 
    tiro_x dw 0
    tiro_y dw 0
    
    ; Delay menor para o jogo
    game_delay_cx dw 0
    game_delay_dx dw 15000 
    
    tempo_restante  db 60
    timer_counter   db 67 
    
    ; --- Constantes de Limite da Tela ---
    MIN_X dw 0
    MAX_X dw 302 
    MIN_Y dw 15  
    MAX_Y dw 167 


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

atualiza_tempo_hud proc
    push ax
    push bp
    push cx
    push dx
    push si
    
    mov bp,OFFSET campo4
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2 ; Cor verde
    mov cx,TAM_MSG6
    mov dh,0
    mov dl,78
    int 10h
    
    pop si
    pop dx
    pop cx
    pop bp
    pop ax
    ret
atualiza_tempo_hud endp

desenha_superficie_fase1 proc
    push ax
    push cx
    push di
    push es

    mov ax, 0A000h
    mov es, ax
    
    mov ax, 180 
    mov dx, 0   
    call calcula_posicao 
    
    mov cx, 6400 
    mov al, 1    ; Cor Azul
    rep stosb    
    
    pop es
    pop di
    pop cx
    pop ax
    ret
desenha_superficie_fase1 endp

desenha_pixel proc
    ; Entrada: AX = Y, DX = X, CL = Cor
    push di
    push es
    push cx 
    push dx ; <-- SALVA O X ORIGINAL

    mov cx, 320 ; Multiplica Y por 320
    mul cx      ; Resultado em DX:AX (DX = high, AX = low)

    pop dx      ; <-- RECUPERA O X ORIGINAL
    add ax, dx  ; Adiciona X ao resultado baixo da multiplicacao
    mov di, ax  ; DI = Endereco do pixel
    
    mov ax, 0A000h ; Segmento da memoria de video
    mov es, ax
    
    pop cx ; Recupera CL original (cor)
    mov es:[di], cl ; Desenha o pixel
    
    pop es
    pop di
    ret
desenha_pixel endp


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
    jmp TECLAESPECIAL_MENU 
.checar_enter:
    cmp AL, CR
    jne .pular_teclado 
    jmp PRESSENTER     
    
.pular_teclado:

    ; 2. Animação
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
    
    mov ax, direcao_atual
    add nave_aliada_x, ax
    add nave_alien_x, ax
    add meteoro_x, ax
    add nave3_x, ax 
    
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

    mov ah, 86h
    mov cx, delay_cx
    mov dx, delay_dx
    int 15h
    
    jmp LOOP_MENU_ANIMADO 

PRESSENTER:  
    cmp menu_selecionado, 1
    je SAIR_DO_JOGO

    mov AL, 13H
    mov AH, 0
    int 10H

    mov ax, @data 
    mov ds, ax  
    mov Es, ax   

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

TECLAESPECIAL_MENU: 
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

; #################################################
; # INICIO DA SECAO DO JOGO
; #################################################
JOGO:
    call desenha_superficie_fase1

    ; Desenha o jogador na posicao inicial
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, offset nave_cacador
    call desenha_fantasma
    
; --- LOOP PRINCIPAL DO JOGO ---
JOGO_LOOP:
    ; 1. Apaga o jogador da posicao antiga
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma

    ; 1a. Apaga Inimigos (Apenas se estiverem na tela: 0 <= X <= 319)
    mov ax, enemy1_x
    cmp ax, 0
    jl .enemy1_erase_skip 
    cmp ax, 319
    jg .enemy1_erase_skip 
    mov ax, enemy1_y
    mov dx, enemy1_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma
.enemy1_erase_skip:
    
    mov ax, enemy2_x
    cmp ax, 0
    jl .enemy2_erase_skip
    cmp ax, 319
    jg .enemy2_erase_skip
    mov ax, enemy2_y
    mov dx, enemy2_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma
.enemy2_erase_skip:
    
    mov ax, enemy3_x
    cmp ax, 0
    jl .enemy3_erase_skip
    cmp ax, 319
    jg .enemy3_erase_skip
    mov ax, enemy3_y
    mov dx, enemy3_x
    call calcula_posicao
    mov bx, offset sprite_vazio
    call desenha_fantasma
.enemy3_erase_skip:

    ; 1b. Apaga o Tiro (Se ativo)
    cmp tiro_ativo, 1
    jne .tiro_erase_skip
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0 ; Cor preta
    call desenha_pixel
.tiro_erase_skip:

    ; 2. Le o teclado
    mov ah, 01h       
    int 16h
    jnz .processa_teclado 
    jmp .continua_loop    

.processa_teclado: 
    mov ah, 00h       
    int 16h
    
    cmp al, 0         
    jne .checar_tecla_disparo 
    
    ; Processa teclas especiais (Setas)
    cmp ah, 48H       
    je .move_cima
    cmp ah, 50H       
    je .move_baixo
    cmp ah, 4BH       
    je .move_esquerda
    cmp ah, 4DH       
    je .move_direita
    jmp .continua_loop    

.checar_tecla_disparo:
    cmp al, ' ' 
    jne .continua_loop 
    
    cmp tiro_ativo, 0
    jne .continua_loop 
    
    mov tiro_ativo, 1
    mov ax, player_y
    add ax, 6       
    mov tiro_y, ax
    mov ax, player_x
    add ax, 17      
    mov tiro_x, ax
    jmp .continua_loop 

.move_cima:
    mov ax, player_y
    cmp ax, MIN_Y   
    jle .continua_loop  
    dec player_y 
    jmp .continua_loop
.move_baixo:
    mov ax, player_y
    cmp ax, MAX_Y   
    jge .continua_loop  
    inc player_y 
    jmp .continua_loop
.move_esquerda:
    mov ax, player_x
    cmp ax, MIN_X   
    jle .continua_loop  
    dec player_x 
    jmp .continua_loop
.move_direita:
    mov ax, player_x
    cmp ax, MAX_X   
    jge .continua_loop  
    inc player_x 
    jmp .continua_loop

.continua_loop: 
    
    ; 2a. Atualiza Coordenadas dos Inimigos
    dec enemy1_x
    dec enemy2_x
    dec enemy3_x

    ; 2b. Checa Limite (Apenas no 'leader', enemy3)
    mov ax, enemy3_x
    cmp ax, -17
    jg .enemy_reset_skip
    
    mov enemy1_x, 340 
    mov enemy2_x, 380 
    mov enemy3_x, 420 
.enemy_reset_skip:

    ; 2c. Atualiza Timer
    dec timer_counter
    cmp timer_counter, 0
    jne .pula_timer_update

    mov timer_counter, 67 
    mov al, tempo_restante
    cmp al, 0
    je .pula_timer_update 
    dec tempo_restante
    mov al, tempo_restante
    xor ah, ah
    mov bl, 10
    div bl      
    add al, 30h 
    add ah, 30h 
    mov [campo4], al
    mov [campo4+1], ah
    call atualiza_tempo_hud
.pula_timer_update:

    ; 2d. Atualiza Tiro (Se ativo)
    cmp tiro_ativo, 1
    jne .tiro_update_skip
    add tiro_x, 2 
    
    cmp tiro_x, 319
    jle .tiro_update_skip
    mov tiro_ativo, 0 
.tiro_update_skip:

    ; 3. Desenha o jogador na nova posicao
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, offset nave_cacador
    call desenha_fantasma
    
    ; 3a. Desenha Inimigos (Apenas se estiverem na tela: 0 <= X <= 319)
    mov ax, enemy1_x
    cmp ax, 0
    jl .enemy1_draw_skip
    cmp ax, 319
    jg .enemy1_draw_skip
    mov ax, enemy1_y
    mov dx, enemy1_x
    call calcula_posicao
    mov bx, offset nave1
    call desenha_fantasma
.enemy1_draw_skip:
    
    mov ax, enemy2_x
    cmp ax, 0
    jl .enemy2_draw_skip
    cmp ax, 319
    jg .enemy2_draw_skip
    mov ax, enemy2_y
    mov dx, enemy2_x
    call calcula_posicao
    mov bx, offset nave2
    call desenha_fantasma
.enemy2_draw_skip:

    mov ax, enemy3_x
    cmp ax, 0
    jl .enemy3_draw_skip
    cmp ax, 319
    jg .enemy3_draw_skip
    mov ax, enemy3_y
    mov dx, enemy3_x
    call calcula_posicao
    mov bx, offset nave3
    call desenha_fantasma
.enemy3_draw_skip:

    ; 3b. Desenha o Tiro (Se ativo)
    cmp tiro_ativo, 1
    jne .tiro_draw_skip
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0Fh ; Cor Branca
    call desenha_pixel
.tiro_draw_skip:
    
    ; 4. Delay
    mov ah, 86h
    mov cx, game_delay_cx
    mov dx, game_delay_dx
    int 15h

    ; 5. Checa se o tempo acabou (APOS desenhar)
    mov al, tempo_restante
    cmp al, 0
    je .fim_de_jogo_timer 

    ; 6. Repete
    jmp JOGO_LOOP
; --- FIM DO LOOP PRINCIPAL DO JOGO ---

.fim_de_jogo_timer:
    ; O jogo congela aqui, com o ultimo frame na tela.
    ; Espera qualquer tecla
    mov ah, 00h
    int 16h     
    jmp SAIR_DO_JOGO 

    mov ah, 4ch
    int 21h

end main
