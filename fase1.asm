; fase1.asm
.code

; fase1_inicio: executa o loop principal do jogo
fase1_inicio proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push es

    ; ====== TELA PRETA ======
    mov ax, 0A000h
    mov es, ax
    xor di, di
    mov al, 0
    mov cx, 320*200
    rep stosb

    ; ====== IMPRIMIR TEXTO ======
    mov ax, @data
    mov ds, ax

    mov si, OFFSET msg_fase1
    mov dh, 9          ; linha inicial da tela (vertical)
    
.PrintLine:
    push si            ; salvar posi??o atual da string
    xor cx, cx         ; contador de caracteres da linha

.CountChars:
    lodsb
    cmp al, CR
    je .GotLineLength
    cmp al, 0
    je .DonePrint
    inc cx
    jmp .CountChars

.GotLineLength:
    ; calcular coluna inicial para centralizar
    mov bx, 40         ; largura da tela em caracteres (aprox 80/2)
    sub bx, cx
    shr bx, 1          ; bx = coluna inicial

    ; reposicionar cursor
    mov ah, 02h
    mov bh, 0
    mov dh, dh         ; linha vertical
    mov dl, bl         ; coluna horizontal
    int 10h

    ; imprimir a linha
    pop si             ; restaurar posi??o da linha
.PrintChars:
    lodsb
    cmp al, CR
    je .NextLine
    mov ah, 0Eh
    mov bh, 0
    mov bl, 4          ; cor
    int 10h
    jmp .PrintChars

.NextLine:
    inc dh             ; pr?xima linha vertical
    lodsb              ; pular LF
    jmp .PrintLine

.DonePrint:

    ; ====== DELAY 4 SEGUNDOS ======
    mov ax, 0040h
    mov es, ax
    mov bx, es:[006Ch]
    add bx, 73   ; ? 4 segundos

.WaitLoop:
    cmp es:[006Ch], bx
    jl .WaitLoop

    ; ====== APAGAR O TEXTO ======
    mov ax, 0A000h
    mov es, ax
    xor di, di
    mov al, 0
    mov cx, 320*200
    rep stosb

    ; ====== CONTINUA JOGO ======
    call carrega_hud
    call desenha_superficie_fase1


    ; Desenha o jogador na posicao inicial
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_fantasma

JOGO_LOOP:
    
    call desenha_superficie_fase1
    ; 1. Apaga o jogador da posicao antiga
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
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
    mov bx, OFFSET sprite_vazio
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
    mov bx, OFFSET sprite_vazio
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
    mov bx, OFFSET sprite_vazio
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
    mov bx, OFFSET nave_cacador
    call desenha_fantasma

    ; 3a. Desenha Inimigos (Apenas se estiverem na tela: 0 <= X <= 319)
    mov ax, enemy1_x
    cmp ax, 0
    jl .enemy1_draw_skip
    cmp ax, 291
    jg .enemy1_draw_skip
    mov ax, enemy1_y
    mov dx, enemy1_x
    call calcula_posicao
    mov bx, OFFSET nave1
    call desenha_fantasma
.enemy1_draw_skip:

    mov ax, enemy2_x
    cmp ax, 0
    jl .enemy2_draw_skip
    cmp ax, 291
    jg .enemy2_draw_skip
    mov ax, enemy2_y
    mov dx, enemy2_x
    call calcula_posicao
    mov bx, OFFSET nave1
    call desenha_fantasma
.enemy2_draw_skip:

    mov ax, enemy3_x
    cmp ax, 0
    jl .enemy3_draw_skip
    cmp ax, 291
    jg .enemy3_draw_skip
    mov ax, enemy3_y
    mov dx, enemy3_x
    call calcula_posicao
    mov bx, OFFSET nave1
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

.fim_de_jogo_timer:
    ; O jogo congela aqui, com o ultimo frame na tela.
    ; Espera qualquer tecla
    mov ah, 00h
    int 16h
    ; ao terminar, volta ao chamador (main), que reabre o menu
    ; podemos redefinir valores iniciais se quiser (opcional)
    pop es
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

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

desenha_superficie_fase1 proc
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
    mov al, 1
    rep stosb

    mov si, OFFSET superficie_fase1      ; início da sprite
    mov ax, 0A000h
    mov es, ax

    mov ax, 119                         ; Y inicial
    mov dx, 0                           ; X inicial
    call calcula_posicao                ; DI = Y*320 + X

    mov bx, 490                         ; largura total da sprite
    mov cx, 20                          ; altura da sprite (linhas)
    mov ax, desloc_superficie
    mov bp, ax                          ; BP = deslocamento global (backup estável)

linha_loop:
    push cx                             ; salva contador de linhas
    push si
    push di

    mov cx, 320                         ; pixels visíveis por linha
    mov dx, bp                          ; deslocamento inicial dentro da linha
    mov ax, dx
    add si, ax                          ; SI = sprite + deslocamento

coluna_loop:
    lodsb                               ; lê pixel
    stosb                               ; escreve na VRAM
    inc dx                              ; avança deslocamento
    cmp dx, bx
    jb skip_reset
    sub dx, bx                          ; wrap horizontal
    sub si, bx
skip_reset:
    loop coluna_loop

    pop di
    add di, 320                         ; próxima linha da tela

    pop si
    add si, 490                         ; próxima linha da sprite
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
desenha_superficie_fase1 endp

; fim fase1.asm
