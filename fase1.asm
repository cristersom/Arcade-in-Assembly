; fase1.asm
.code

fase1 proc
    ; ====== INICIO DA FASE ======
    call carrega_hud_fase1
    call desenha_superficie_fase

    ; Desenha Player Inicial
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29

JOGO_LOOP:
    
    call desenha_superficie_fase
    
    ; --- 1. APAGAR OBJETOS ---
    mov ax, enemy1_y
    mov dx, enemy1_x
    cmp dx, 0
    jl .apaga_e2
    cmp dx, 290
    jg .apaga_e2
    add dx, 28
    call sprite_coluna
.apaga_e2:    
    mov ax, enemy2_y
    mov dx, enemy2_x
    cmp dx, 0
    jl .apaga_e3
    cmp dx, 290
    jg .apaga_e3
    add dx, 28
    call sprite_coluna
.apaga_e3:    
    mov ax, enemy3_y
    mov dx, enemy3_x
    cmp dx, 0
    jl .apaga_tiro
    cmp dx, 290
    jg .apaga_tiro
    add dx, 28
    call sprite_coluna

.apaga_tiro:
    cmp tiro_ativo, 1
    jne .input_check
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0
    call desenha_pixel

.input_check:
    ; --- 2. TECLADO ---
    mov ah, 01h
    int 16h
    jnz .processa_key
    jmp .logica_jogo

.processa_key:
    mov ah, 00h
    int 16h
    
    cmp al, ' '         
    je .atira
    cmp al, 27          
    je .sai_fase
    
    cmp ah, 48H ; Cima
    je .cima
    cmp ah, 50H ; Baixo
    je .baixo
    cmp ah, 4BH ; Esq
    je .esq
    cmp ah, 4DH ; Dir
    je .dir
    jmp .logica_jogo

.atira:
    cmp tiro_ativo, 0
    jne .logica_jogo
    mov tiro_ativo, 1
    mov ax, player_y
    add ax, 6
    mov tiro_y, ax
    mov ax, player_x
    add ax, 17
    mov tiro_x, ax
    jmp .logica_jogo

.sai_fase:
    mov qtd_vidas, 0
    ret

.cima:
    mov ax, player_y
    cmp ax, MIN_Y
    jle .logica_jogo
    dec player_y
    mov rastro, 1
    jmp .logica_jogo
.baixo:
    mov ax, player_y
    cmp ax, MAX_Y
    jge .logica_jogo
    inc player_y
    mov rastro, 2
    jmp .logica_jogo
.esq:
    mov ax, player_x
    cmp ax, MIN_X
    jle .logica_jogo
    dec player_x
    mov rastro, 0
    jmp .logica_jogo
.dir:
    mov ax, player_x
    cmp ax, MAX_X
    jge .logica_jogo
    inc player_x
    mov rastro, 0
    jmp .logica_jogo

.logica_jogo:

    ; --- 3. MOVER INIMIGOS ---
    dec enemy1_x
    cmp enemy1_x, -29
    jg .e2_mv
    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy1_y, dx
    add enemy1_y, 10
    mov enemy1_x, 310
.e2_mv:
    dec enemy2_x
    cmp enemy2_x, -29
    jg .e3_mv
    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy2_y, dx
    add enemy2_y, 40
    mov enemy2_x, 330
.e3_mv:
    dec enemy3_x
    cmp enemy3_x, -29
    jg .colisao
    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy3_y, dx
    add enemy3_y, 70
    mov enemy3_x, 350

.colisao:
    ; --- 4. COLISOES ---
    mov ax, enemy1_y
    mov dx, enemy1_x
    call verifica_colisao_box
    jnc .col_2
    dec qtd_vidas
    mov enemy1_x, 310
    call carrega_hud_fase1
.col_2:
    mov ax, enemy2_y
    mov dx, enemy2_x
    call verifica_colisao_box
    jnc .col_3
    dec qtd_vidas
    mov enemy2_x, 330
    call carrega_hud_fase1
.col_3:
    mov ax, enemy3_y
    mov dx, enemy3_x
    call verifica_colisao_box
    jnc .check_die
    dec qtd_vidas
    mov enemy3_x, 350
    call carrega_hud_fase1

.check_die:
    ; --- CORRE??O DO ERRO DE SALTO ---
    cmp qtd_vidas, 0
    jne .continua_vivo
    jmp .sai_fase_ret  ; Salto longo
.continua_vivo:

    ; --- 5. TIMER E PONTOS (+10 PTS) ---
    dec timer_counter
    cmp timer_counter, 0
    jne .tiro_upd
    
    mov timer_counter, 38
    
    call aumenta_score_10 
    
    mov al, tempo_restante
    cmp al, 0
    je .tiro_upd
    dec tempo_restante
    call atualiza_tempo_seguro

.tiro_upd:
    ; --- 6. TIRO ---
    cmp tiro_ativo, 1
    jne .desenha
    add tiro_x, 3
    cmp tiro_x, 319
    jle .desenha
    mov tiro_ativo, 0

.desenha:
    ; --- 7. DESENHAR TUDO ---
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29
    
    mov ax, player_y
    mov dx, player_x
    cmp rastro, 0
    je .r0
    cmp rastro, 1
    je .r1
    call sprite_linha
    jmp .load_spr
.r0:
    dec dx
    call sprite_coluna
    jmp .load_spr
.r1:
    add ax, 13
    call sprite_linha

.load_spr:
    mov si, offset nave1
    cmp fase_atual, 2
    jne .copy
    mov si, offset nave2
.copy:
    mov di, offset nave_atual
    mov cx, TAM_SPRITE  
    rep movsb

    mov ax, enemy1_x
    cmp ax, 0
    jl .de2
    cmp ax, 320
    jg .de2
    mov ax, enemy1_y
    mov dx, enemy1_x
    call calcula_posicao
    mov bx, OFFSET nave_atual
    call desenha_13x29
.de2:
    mov ax, enemy2_x
    cmp ax, 0
    jl .de3
    cmp ax, 320
    jg .de3
    mov ax, enemy2_y
    mov dx, enemy2_x
    call calcula_posicao
    mov bx, OFFSET nave_atual
    call desenha_13x29
.de3:
    mov ax, enemy3_x
    cmp ax, 0
    jl .dtr
    cmp ax, 320
    jg .dtr
    mov ax, enemy3_y
    mov dx, enemy3_x
    call calcula_posicao
    mov bx, OFFSET nave_atual
    call desenha_13x29

.dtr:
    cmp tiro_ativo, 1
    jne .delay
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0Fh
    call desenha_pixel

.delay:
    mov ah, 86h
    mov cx, game_delay_cx
    mov dx, game_delay_dx
    int 15h

    mov al, tempo_restante
    cmp al, 0
    je .sai_fase_ret
    
    jmp JOGO_LOOP

.sai_fase_ret:
    ret

; ============ ROTINAS LOCAIS ============

; SOMA 10 PONTOS (Incrementa a DEZENA - Indice 3)
aumenta_score_10 proc
    push ax
    push si
    
    mov si, OFFSET campo3
    add si, 3           ; Aponta para casa das DEZENAS
    
    mov al, [si]
    inc al              ; Soma 1 na dezena (+10 no total)
    cmp al, '9'
    jg .vai_um_centena
    mov [si], al
    jmp .fim_score

.vai_um_centena:
    mov byte ptr [si], '0' ; Zera a dezena
    dec si                 ; Recua para Centena (Indice 2)
    mov al, [si]
    inc al
    cmp al, '9'
    jg .vai_um_milhar
    mov [si], al
    jmp .fim_score

.vai_um_milhar:
    mov byte ptr [si], '0' ; Zera a centena
    dec si                 ; Recua para Milhar (Indice 1)
    mov al, [si]
    inc al
    cmp al, '9'
    jg .trava_99990
    mov [si], al
    jmp .fim_score

.trava_99990:
    mov byte ptr [si], '9' ; Trava se estourar

.fim_score:
    call atualiza_score_seguro
    pop si
    pop ax
    ret
aumenta_score_10 endp

atualiza_score_seguro proc
    push ax
    push bx
    push dx
    push si
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0 
    mov dl, 7 
    int 10h
    
    mov si, OFFSET campo3
    mov bl, 2 ; Verde
    call print_str_hud
    
    pop si
    pop dx
    pop bx
    pop ax
    ret
atualiza_score_seguro endp

atualiza_tempo_seguro proc
    push ax
    push bx
    push dx
    push si
    
    mov al, tempo_restante
    xor ah, ah
    mov bl, 10
    div bl
    add al, '0'
    add ah, '0'
    mov [campo4], al
    mov [campo4+1], ah
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 36
    int 10h
    
    mov si, OFFSET campo4
    mov bl, 2
    call print_str_hud
    
    pop si
    pop dx
    pop bx
    pop ax
    ret
atualiza_tempo_seguro endp

print_str_hud proc
.lp:
    mov al, [si]
    cmp al, 0
    je .end
    mov ah, 0Eh
    xor bh, bh
    int 10h
    inc si
    jmp .lp
.end:
    ret
print_str_hud endp

verifica_colisao_box proc
    push bx
    push cx
    mov bx, player_x
    add bx, 25
    cmp bx, dx
    jl .no_c
    mov bx, player_x
    add bx, 5
    mov cx, dx
    add cx, 29
    cmp bx, cx
    jg .no_c
    mov bx, player_y
    add bx, 10
    cmp bx, ax
    jl .no_c
    mov bx, player_y
    add bx, 3
    mov cx, ax
    add cx, 13
    cmp bx, cx
    jg .no_c
    stc
    pop cx
    pop bx
    ret
.no_c:
    clc
    pop cx
    pop bx
    ret
verifica_colisao_box endp

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
    je .cor_f2
    mov al, 1
    jmp .cor_ok
.cor_f2:
    mov al, 6
.cor_ok:
    rep stosb
    cmp fase_atual, 2
    je .surf_f2
    mov si, OFFSET superficie_fase1
    jmp .surf_go
.surf_f2:
    mov si, OFFSET superficie_fase2
.surf_go:
    mov ax, 0A000h
    mov es, ax
    mov ax, 119
    mov dx, 0
    call calcula_posicao
    mov bx, 490
    mov cx, 20
    mov ax, desloc_superficie
    mov bp, ax
.l_lp:
    push cx
    push si
    push di
    mov cx, 320
    mov dx, bp
    add si, dx
.c_lp:
    lodsb
    stosb
    inc dx
    cmp dx, bx
    jb .sk_rst
    sub dx, bx
    sub si, bx
.sk_rst:
    loop .c_lp
    pop di
    add di, 320
    pop si
    add si, 490
    pop cx
    loop .l_lp
    mov ax, desloc_superficie
    inc ax
    cmp ax, 490
    jb .ok_scr
    xor ax, ax
.ok_scr:
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

random proc
    mov ax, random_seed
    mov dx, 25173
    mul dx
    add ax, 13849
    mov random_seed, ax
    ret
random endp

carrega_hud_fase1 proc
    mov ax, @data 
    mov ds, ax  
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    mov si, OFFSET campo1
    mov bl, 0Fh
    call print_str_hud
    
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 30
    int 10h
    mov si, OFFSET campo2
    mov bl, 0Fh
    call print_str_hud

    call atualiza_score_seguro
    call atualiza_tempo_seguro
  
    cmp qtd_vidas, 1
    jl .sk1
    mov ax, 0
    mov dx, 121
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
.sk1:
    cmp qtd_vidas, 2
    jl .sk2
    mov ax, 0
    mov dx, 151
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
.sk2:
    cmp qtd_vidas, 3
    jl .sk3
    mov ax, 0
    mov dx, 181
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
.sk3:
    ret
carrega_hud_fase1 endp

fase1 endp