; fase1.asm
.code

; -------------------------------------------------------------------
; Funcao: Executa o loop principal de jogabilidade (Fase 1, 2 e 3).
; Parametros de entrada: Variaveis globais de estado do jogo (fase_atual, player_x, etc.).
; Parametros de saida: Gerencia todo o fluxo do jogo, movimentacao e desenho.
; -------------------------------------------------------------------
fase1 proc
    ; ====== CONTINUA JOGO ======
    mov tempo_restante, 60
    call carrega_hud
    call desenha_superficie_fase

    ; Desenha o jogador na posicao inicial
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29

JOGO_LOOP:
    
    call verifica_colisao_player
    call desenha_superficie_fase
    
    ; 1a. Apaga Inimigos
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
 
; Rotinas internas de limpeza de sprite
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
    ; 1b. Apaga o Tiro
    cmp tiro_ativo, 1
    jne .tiro_erase_skip
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0 
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

    ; === VERIFICA COLISAO DO TIRO (ATUALIZADO) ===
    call verifica_colisao_tiro
    ; =============================================

;=========================
; enemy 1
;=========================
    dec enemy1_x
    cmp enemy1_x, -29
    jg skip_enemy1
    call respawn_enemy1
skip_enemy1:
;=========================
; enemy 2
;=========================
    dec enemy2_x
    cmp enemy2_x, -29
    jg skip_enemy2
    call respawn_enemy2
skip_enemy2:
;=========================
; enemy 3
;=========================
    dec enemy3_x
    cmp enemy3_x, -29
    jg skip_enemy3
    call respawn_enemy3
skip_enemy3:

.enemy_reset_skip:

    ; 2c. Atualiza Timer
    dec timer_counter
    cmp timer_counter, 0
    jne .pula_timer_update

    mov timer_counter, 38
    
    ; Chama pontuacao por tempo
    call atualiza_score_fase

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
    
    ; 2d. Atualiza Tiro
    cmp tiro_ativo, 1
    jne .tiro_update_skip
    add tiro_x, 2

    cmp tiro_x, 319
    jle .tiro_update_skip
    mov tiro_ativo, 0
.tiro_update_skip:

    ; 3. Desenha o jogador
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

    ; 3a. Desenha Inimigos
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

    ; 3b. Desenha o Tiro
    cmp tiro_ativo, 1
    jne .tiro_draw_skip
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0Fh 
    call desenha_pixel
.tiro_draw_skip:

    mov ah, 86h
    mov cx, game_delay_cx
    mov dx, game_delay_dx
    int 15h

    mov al, tempo_restante
    cmp al, 0
    je .fim_de_jogo_timer

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
    cmp fase_atual, 2
    je .vai_fase3
    cmp fase_atual, 3
    je .vencedor
    jmp .Fase2
.vai_fase3:
    jmp .Fase3  
.vencedor:
    inc fase_atual
    jmp vencedor

; === ROTINAS DE RESPAWN ===

; -------------------------------------------------------------------
; Funcao: Reposiciona o Inimigo 1 aleatoriamente
; Parametros de entrada: Variavel global random_seed
; Parametros de saida: Atualiza enemy1_x e enemy1_y
; -------------------------------------------------------------------
respawn_enemy1 proc
    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy1_y, dx
    add enemy1_y, 10
    mov enemy1_x, 291
    ret
respawn_enemy1 endp

; -------------------------------------------------------------------
; Funcao: Reposiciona o Inimigo 2 aleatoriamente
; Parametros de entrada: Variavel global random_seed
; Parametros de saida: Atualiza enemy2_x e enemy2_y
; -------------------------------------------------------------------
respawn_enemy2 proc
    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy2_y, dx
    add enemy2_y, 10
    mov enemy2_x, 291
    ret
respawn_enemy2 endp

; -------------------------------------------------------------------
; Funcao: Reposiciona o Inimigo 3 aleatoriamente
; Parametros de entrada: Variavel global random_seed
; Parametros de saida: Atualiza enemy3_x e enemy3_y
; -------------------------------------------------------------------
respawn_enemy3 proc
    call random
    xor dx, dx
    mov cx, 95
    div cx
    mov enemy3_y, dx
    add enemy3_y, 10
    mov enemy3_x, 291
    ret
respawn_enemy3 endp
    
; -------------------------------------------------------------------
; Funcao: Atualiza o texto do tempo restante na HUD
; Parametros de entrada: Variavel global campo4 (string do tempo)
; Parametros de saida: Escreve na memoria de video (INT 10h/13h)
; -------------------------------------------------------------------
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
    mov cx,2
    mov dh,0
    mov dl,38
    int 10h

    pop si
    pop dx
    pop cx
    pop bp
    pop ax
    ret
atualiza_tempo_hud endp

; -------------------------------------------------------------------
; Funcao: Gera um numero pseudo-aleatorio
; Parametros de entrada: Variavel global random_seed
; Parametros de saida: Retorna numero aleatorio em AX e atualiza random_seed
; -------------------------------------------------------------------
random proc
    mov ax, random_seed
    mov dx, 25173
    mul dx
    add ax, 13849
    mov random_seed, ax
    ret
random endp

; -------------------------------------------------------------------
; Funcao: Verifica se o tiro atingiu algum inimigo.
; Parametros de entrada: Variaveis tiro_x, tiro_y, enemyX_pos.
; Parametros de saida: Remove inimigo, soma pontos ou desativa tiro.
; -------------------------------------------------------------------
verifica_colisao_tiro proc
    cmp tiro_ativo, 1
    je .inicio_checa_colisao 
    jmp .fim_colisao         

.inicio_checa_colisao:
    ; --- Inimigo 1 ---
    mov ax, tiro_x
    cmp ax, enemy1_x
    jl .checa_e2
    mov bx, enemy1_x
    add bx, 29
    cmp ax, bx
    jg .checa_e2
    mov ax, tiro_y
    cmp ax, enemy1_y
    jl .checa_e2
    mov bx, enemy1_y
    add bx, 13
    cmp ax, bx
    jg .checa_e2

    ; HIT Inimigo 1 detectado
    ; Verifica Fase
    cmp fase_atual, 2
    je .hit_fase2_e1
    
    mov ax, enemy1_y
    mov dx, enemy1_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_13x29
    
    ; Fase 1 ou 3 (Destrutivel)
    call respawn_enemy1
    mov tiro_ativo, 0
    cmp fase_atual, 3
    je .pontos_fase3_e1
    
    ; Fase 1 (100 pontos)
    call soma_100_pontos
    jmp .fim_colisao

    .pontos_fase3_e1:
    call soma_150_pontos
    jmp .fim_colisao

    .hit_fase2_e1:
    ; Fase 2 (Indestrutivel)
    mov tiro_ativo, 0 ; Tiro some, meteoro fica
    jmp .fim_colisao

.checa_e2:
    ; --- Inimigo 2 ---
    mov ax, tiro_x
    cmp ax, enemy2_x
    jl .checa_e3
    mov bx, enemy2_x
    add bx, 29
    cmp ax, bx
    jg .checa_e3
    mov ax, tiro_y
    cmp ax, enemy2_y
    jl .checa_e3
    mov bx, enemy2_y
    add bx, 13
    cmp ax, bx
    jg .checa_e3

    ; HIT Inimigo 2 detectado
    cmp fase_atual, 2
    je .hit_fase2_e2
    
    mov ax, enemy2_y
    mov dx, enemy2_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_13x29
    
    call respawn_enemy2
    mov tiro_ativo, 0
    cmp fase_atual, 3
    je .pontos_fase3_e2
    call soma_100_pontos
    jmp .fim_colisao

    .pontos_fase3_e2:
    call soma_150_pontos
    jmp .fim_colisao

    .hit_fase2_e2:
    mov tiro_ativo, 0
    jmp .fim_colisao

.checa_e3:
    ; --- Inimigo 3 ---
    mov ax, tiro_x
    cmp ax, enemy3_x
    jl .fim_colisao
    mov bx, enemy3_x
    add bx, 29
    cmp ax, bx
    jg .fim_colisao
    mov ax, tiro_y
    cmp ax, enemy3_y
    jl .fim_colisao
    mov bx, enemy3_y
    add bx, 13
    cmp ax, bx
    jg .fim_colisao

    ; HIT Inimigo 3 detectado
    cmp fase_atual, 2
    je .hit_fase2_e3
    
    mov ax, enemy3_y
    mov dx, enemy3_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_13x29
    
    call respawn_enemy3
    mov tiro_ativo, 0
    cmp fase_atual, 3
    je .pontos_fase3_e3
    call soma_100_pontos
    jmp .fim_colisao

    .pontos_fase3_e3:
    call soma_150_pontos
    jmp .fim_colisao

    .hit_fase2_e3:
    mov tiro_ativo, 0
    jmp .fim_colisao

.fim_colisao:
    ret
verifica_colisao_tiro endp

; ===== PONTUACAO =====

; -------------------------------------------------------------------
; Funcao: Adiciona 100 pontos ao score.
; Parametros de entrada: Variavel global campo3.
; Parametros de saida: Atualiza string de pontuacao.
; -------------------------------------------------------------------
soma_100_pontos proc
    push bx
    call adiciona_centena_1
    call atualiza_hud_pontuacao
    pop bx
    ret
soma_100_pontos endp

; -------------------------------------------------------------------
; Funcao: Adiciona 150 pontos ao score.
; Parametros de entrada: Variavel global campo3.
; Parametros de saida: Atualiza string de pontuacao.
; -------------------------------------------------------------------
soma_150_pontos proc
    push bx
    call adiciona_centena_1 ; +100
    call adiciona_dezena_5  ; +50
    call atualiza_hud_pontuacao
    pop bx
    ret
soma_150_pontos endp

; -------------------------------------------------------------------
; Funcao: Adiciona pontuacao periodica baseada na fase atual.
; Parametros de entrada: Variavel global fase_atual.
; Parametros de saida: Incrementa pontos (10, 15 ou 20) no score.
; -------------------------------------------------------------------
atualiza_score_fase proc
    push ax
    push bx
    push cx
    push dx
    push bp
    push es
    push ds

    mov ax, @data
    mov ds, ax
    mov es, ax

    cmp fase_atual, 1
    je .soma_10
    cmp fase_atual, 2
    je .soma_15
    cmp fase_atual, 3
    je .soma_20
    jmp .atualiza_hud_label

.soma_10:
    call adiciona_dezena_1
    jmp .atualiza_hud_label
.soma_15:
    call adiciona_unidade_5
    call adiciona_dezena_1
    jmp .atualiza_hud_label
.soma_20:
    call adiciona_dezena_1
    call adiciona_dezena_1
    jmp .atualiza_hud_label

.atualiza_hud_label:
    call atualiza_hud_pontuacao
    
    pop ds
    pop es
    pop bp
    pop dx
    pop cx
    pop bx
    pop ax
    ret
atualiza_score_fase endp

; -------------------------------------------------------------------
; Funcao: Atualiza visualmente o score na tela.
; Parametros de entrada: Variavel global campo3.
; Parametros de saida: Escreve na memoria de video (INT 10h).
; -------------------------------------------------------------------
atualiza_hud_pontuacao proc
    push ax
    push bx
    push cx
    push dx
    push bp
    
    mov bp, OFFSET campo3
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 2
    mov cx, 5  
    mov dh, 0
    mov dl, 6 
    int 10h

    pop bp
    pop dx
    pop cx
    pop bx
    pop ax
    ret
atualiza_hud_pontuacao endp

; === MATEMATICA SCORE ===
; (Funcoes auxiliares de soma e carry para string de score)

adiciona_unidade_5:
    mov bx, 4           
    add byte ptr [campo3 + bx], 5
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_u
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_dezena
.fim_soma_u:
    ret

adiciona_dezena_1:
    mov bx, 3           
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_d
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_centena
.fim_soma_d:
    ret

adiciona_dezena_5:
    mov bx, 3
    add byte ptr [campo3 + bx], 5
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_d5
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_centena
.fim_soma_d5:
    ret

adiciona_centena_1:
    mov bx, 2           
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_c
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_milhar
.fim_soma_c:
    ret

propaga_carry_dezena:
    mov bx, 3
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_propaga
    sub byte ptr [campo3 + bx], 10
    ; fallthrough
propaga_carry_centena:
    mov bx, 2
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_propaga
    sub byte ptr [campo3 + bx], 10
    ; fallthrough
propaga_carry_milhar:
    mov bx, 1
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_propaga
    sub byte ptr [campo3 + bx], 10
    ; fallthrough
propaga_carry_dez_milhar:
    mov bx, 0
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_propaga
    mov byte ptr [campo3 + bx], '9' 
.fim_propaga:
    ret

fase1 endp