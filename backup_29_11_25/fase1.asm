; fase1.asm
.code

; fase1_inicio: executa o loop principal do jogo
fase1 proc
    ; ====== CONTINUA JOGO ======
    call carrega_hud
    call desenha_superficie_fase


    ; Desenha o jogador na posicao inicial
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29

JOGO_LOOP:
    
    call desenha_superficie_fase
    ; 1. Apaga o jogador da posicao antiga
   
    ; 1a. Apaga Inimigos (Apenas se estiverem na tela: 0 <= X <= 319)
    mov ax, enemy1_y
    mov dx, enemy1_x
    cmp dx, 0
    je .sprite_full
    add dx, 28
    call sprite_coluna

.enemy2:    
    mov ax, enemy2_y
    mov dx, enemy2_x
    cmp dx, 0
    je .sprite_full
    add dx, 28
    call sprite_coluna

.enemy3:    
    mov ax, enemy3_y
    mov dx, enemy3_x
    cmp dx, 0
    je .sprite_full
    add dx, 28
    call sprite_coluna
    jmp .skip
 
sprite_coluna proc
   
    call calcula_posicao
    mov bx, OFFSET sprite_coluna_vazia
    call desenha_coluna
    ret
sprite_coluna endp

sprite_linha proc
   
    call calcula_posicao
    mov bx, OFFSET sprite_linha_vazia
    call desenha_linha
    ret
    sprite_linha endp

.sprite_full:    
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_13x29
    cmp enemy1_x, 0
    je .enemy2
    cmp enemy2_x, 0
    je .enemy3
.skip:
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
    mov rastro, 1
    jmp .continua_loop
.move_baixo:
    mov ax, player_y
    cmp ax, MAX_Y
    jge .continua_loop
    inc player_y
    mov rastro, 2
    jmp .continua_loop
.move_esquerda:
    mov ax, player_x
    cmp ax, MIN_X
    jle .continua_loop
    dec player_x
    mov rastro, 0
    jmp .continua_loop
.move_direita:
    mov ax, player_x
    cmp ax, MAX_X
    jge .continua_loop
    inc player_x
    mov rastro, 0
    jmp .continua_loop

.continua_loop:
;=========================
; enemy 1
;=========================
dec enemy1_x
cmp enemy1_x, -29
jg skip_enemy1

    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy1_y, dx
    add enemy1_y, 10

    mov enemy1_x, 291

skip_enemy1:
;=========================
; enemy 2
;=========================
dec enemy2_x
cmp enemy2_x, -29
jg skip_enemy2

    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy2_y, dx
    add enemy2_y, 10

    mov enemy2_x, 291

skip_enemy2:

;=========================
; enemy 3
;=========================
dec enemy3_x
cmp enemy3_x, -29
jg skip_enemy3

    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy3_y, dx
    add enemy3_y, 10

    mov enemy3_x, 291

skip_enemy3:

.enemy_reset_skip:

    ; 2c. Atualiza Timer
    dec timer_counter
    cmp timer_counter, 0
    jne .pula_timer_update

    mov timer_counter, 38
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
    mov bx, OFFSET nave_cacador
    call desenha_13x29
    
     mov ax, player_y
    mov dx, player_x
    cmp rastro, 0
    je .rastro0
    cmp rastro, 1
    je .rastro1
    cmp rastro, 2
    je .rastro2
    call sprite_linha

.rastro0:
    dec dx
    call sprite_coluna
    jmp .continua_rastro
.rastro1:
    add ax,13
    call sprite_linha
    jmp .continua_rastro
.rastro2: 
    dec ax
    call sprite_linha
    jmp .continua_rastro
    
.continua_rastro:
    ;muda os inimigos da fase
    cmp fase_atual, 2
    jne .nao_mudar_inimigo     
    jmp .mudar_inimigo 
.nao_mudar_inimigo:
    mov si, offset nave1
    mov di, offset nave_atual
    mov cx, TAM_SPRITE  
    jmp .repete_mudar
.continuar_mudar_inimigo:

    ; 3a. Desenha Inimigos (Apenas se estiverem na tela: 0 <= X <= 319)
    mov ax, enemy1_x
    cmp ax, 0
    jl .enemy1_draw_skip
    cmp ax, 320
    jg .enemy1_draw_skip
    mov ax, enemy1_y
    mov dx, enemy1_x
    call calcula_posicao
    mov bx, OFFSET nave_atual
    call desenha_13x29
.enemy1_draw_skip:

    mov ax, enemy2_x
    cmp ax, 0
    jl .enemy2_draw_skip
    cmp ax, 320
    jg .enemy2_draw_skip
    mov ax, enemy2_y
    mov dx, enemy2_x
    call calcula_posicao
    mov bx, OFFSET nave_atual
    call desenha_13x29
.enemy2_draw_skip:

    mov ax, enemy3_x
    cmp ax, 0
    jl .enemy3_draw_skip
    cmp ax, 320
    jg .enemy3_draw_skip
    mov ax, enemy3_y
    mov dx, enemy3_x
    call calcula_posicao
    mov bx, OFFSET nave_atual
    call desenha_13x29
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

.mudar_inimigo:  
    mov si, offset nave2
    mov di, offset nave_atual
    mov cx, TAM_SPRITE
.repete_mudar:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop .repete_mudar

    jmp .continuar_mudar_inimigo
   
.fim_de_jogo_timer:
    ; O jogo congela aqui, com o ultimo frame na tela.    
    jmp .Fase2
    
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
    mov bl,2
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

desenha_superficie_fase proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push ds
    push es

    mov ax, @data
    mov ds, ax
    
    mov ax, 0A000h
    mov es, ax

    mov ax, 139
    mov dx, 0
    call calcula_posicao

    mov cx, 21000
    cmp fase_atual, 2
    je .mudar_cor_superficie
    mov al, 1
.continuar_mudar_cor_superficie:
    rep stosb
    
    cmp fase_atual, 2
    je .mudar_superficie

    mov si, OFFSET superficie_fase1      ; in?cio da sprite
.continua_mudar_superficie:
    mov ax, 0A000h
    mov es, ax

    mov ax, 119                         ; Y inicial
    mov dx, 0                           ; X inicial
    call calcula_posicao                ; DI = Y*320 + X

    mov bx, 490                         ; largura total da sprite
    mov cx, 20                          ; altura da sprite (linhas)
    mov ax, desloc_superficie
    mov bp, ax                          ; BP = deslocamento global (backup est?vel)

linha_loop:
    push cx                             ; salva contador de linhas
    push si
    push di

    mov cx, 320                         ; pixels vis?veis por linha
    mov dx, bp                          ; deslocamento inicial dentro da linha
    mov ax, dx
    add si, ax                          ; SI = sprite + deslocamento

coluna_loop:
    lodsb                               ; l? pixel
    stosb                               ; escreve na VRAM
    inc dx                              ; avan?a deslocamento
    cmp dx, bx
    jb skip_reset
    sub dx, bx                          ; wrap horizontal
    sub si, bx
skip_reset:
    loop coluna_loop

    pop di
    add di, 320                         ; pr?xima linha da tela

    pop si
    add si, 490                         ; pr?xima linha da sprite
    pop cx
    loop linha_loop

    mov ax, desloc_superficie
    inc ax
    cmp ax, 490
    jb ok_scroll
    xor ax, ax
ok_scroll:
    mov desloc_superficie, ax

    pop es
    pop ds
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
desenha_superficie_fase endp

.mudar_superficie:
    mov si, OFFSET superficie_fase2 
    jmp .continua_mudar_superficie
.mudar_cor_superficie:
    mov al, 6
    jmp .continuar_mudar_cor_superficie

; ===== RANDOM =====
; devolve AX com n?mero pseudo-aleat?rio
random proc

    mov ax, random_seed

    mov dx, 25173
    mul dx           ; DX:AX = AX * 25173
    add ax, 13849    ; incremento

    mov random_seed, ax   ; salva novo estado

    ret
random endp

fase1 endp
; fim fase1.asm
