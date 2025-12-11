; fases.asm
.code

; -------------------------------------------------------------------
; Funcao: Executa o loop principal de jogabilidade (Fase 1, 2 e 3).
; Parametros de entrada: Variaveis globais de estado do jogo (fase_atual, player_x, etc.).
; Parametros de saida: Gerencia todo o fluxo do jogo, movimentacao e desenho.
; -------------------------------------------------------------------
fases proc
    ; Coordenadas inicias para a nave do jogador em determinada fase
    cmp fase_atual, 3
    je .nova_posicao_spawn               ; Na fase 3 o spawn tem que ser mais para cima
    mov player_x, 10  
    mov player_y, 90  
.volta_nova_posicao_spawn:
    mov tempo_restante, 60               ; Tempo padrao de 60 segundos
    call carrega_hud                     ; Carrega a HUD  

    ; Desenha o jogador na posicao inicial
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29
    jmp JOGO_LOOP
    
.nova_posicao_spawn:
    mov player_x, 10  
    mov player_y, 50 
    call desenha_superficie_fase3        ; Carrega o solo estatico da fase 3
    jmp .volta_nova_posicao_spawn
    
; Responsavel por tudo que vai acontecer em loop dentro do jogo
JOGO_LOOP:
    
    cmp fase_atual, 3
    je .pula_desenha_fase
    call desenha_superficie_fase
    
.pula_desenha_fase:
    
    call verifica_colisao_player         ; Verifica se aconteceu alguma colisao

    ; Apaga Inimigos da posicao anterior
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
 
; -------------------------------------------------------------------
; Funcao: Apaga o rastro vertical (coluna) da sprite para evitar sujeira na tela.
; Parametros de entrada: Coordenadas calculadas previamente em AX/DX.
; Parametros de saida: Desenha pixels pretos na memoria de video.
; -------------------------------------------------------------------
sprite_coluna proc
    call calcula_posicao
    mov bx, OFFSET sprite_coluna_vazia
    call desenha_coluna
    ret
sprite_coluna endp

; -------------------------------------------------------------------
; Funcao: Apaga o rastro horizontal (linha) da sprite.
; Parametros de entrada: Coordenadas calculadas previamente em AX/DX.
; Parametros de saida: Desenha pixels pretos na memoria de video.
; -------------------------------------------------------------------
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
    
    ; Apaga o tiro
    cmp tiro_ativo, 1
    jne .tiro_erase_skip
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0 
    call desenha_pixel
    
.tiro_erase_skip:

    ; Le o teclado
    mov ah, 01h
    int 16h
    jnz .processa_teclado
    jmp .continua_loop

; Checa qual tecla o player pressionou     
.processa_teclado:
    mov ah, 00h
    int 16h
    
    ; Garante que nao tem outro disparo na tela
    cmp al, 0
    jne .checar_tecla_disparo
    
    ; Compara para saber se a tecla pressionada é uma de movimento
    cmp ah, 48H
    je .move_cima
    cmp ah, 50H
    je .move_baixo
    cmp ah, 4BH
    je .move_esquerda
    cmp ah, 4DH
    je .move_direita
    jmp .continua_loop
    
; Checa se o player pressionou a tecla de disparo  
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

; Executa os movimentos    
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

    ; Verifica colisao do tiro
    call verifica_colisao_tiro

    ; Quando os inimos chegarem em -29 eles sao spawnados novamente 
    dec enemy1_x
    cmp enemy1_x, -29
    jg skip_enemy1
    call respawn_enemy1
    
skip_enemy1:
    dec enemy2_x
    cmp enemy2_x, -29
    jg skip_enemy2
    call respawn_enemy2
    
skip_enemy2:
    cmp fase_atual, 3
    je skip_enemy3
    dec enemy3_x
    cmp enemy3_x, -29
    jg skip_enemy3
    call respawn_enemy3
skip_enemy3:

.enemy_reset_skip:

    ; Atualiza o timer conforme a fase
    dec timer_counter
    cmp timer_counter, 0
    jne .pula_timer_update

    cmp fase_atual, 3
    je .troca_timer_counter
    mov timer_counter, 39          ; Considera que 39 execuções equivalem a 1 unidade de tempo para a fase 1 e 2
    jmp .pula_troca_timer_counter
.troca_timer_counter:    
    mov timer_counter, 57       ; Considera que 60 execuções equivalem a 1 unidade de tempo para a fase 3
.pula_troca_timer_counter:

    ; Chama pontuacao por tempo
    call atualiza_score_fase

    ; Mostra o valor do timer atualizado
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
    
    ; Atualiza Tiro
    cmp tiro_ativo, 1
    jne .tiro_update_skip
    add tiro_x, 2

    ; Verifica se o tiro chegou ao limite da tela
    cmp tiro_x, 319
    jle .tiro_update_skip
    mov tiro_ativo, 0
.tiro_update_skip:

    ; Desenha o jogador
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29
    
    ; Verifica qual tipo de rastro o movimento do jogador vai deixar
    mov ax, player_y
    mov dx, player_x
    cmp rastro, 0
    je .rastro0
    cmp rastro, 1
    je .rastro1
    cmp rastro, 2
    je .rastro2
    call sprite_linha
    
; Apaga a coluna da esquerda 
.rastro0:
    dec dx
    call sprite_coluna
    jmp .continua_rastro
    
; Apga a linha do rastro de baixo da nave    
.rastro1:
    add ax,13
    call sprite_linha
    jmp .continua_rastro
; Apaga a linha de cima da nave
.rastro2: 
    dec ax
    call sprite_linha
    jmp .continua_rastro
    
.continua_rastro:
    ; Muda os inimigos da fase
    cmp fase_atual, 2
    jne .nao_mudar_inimigo     
    jmp .mudar_inimigo 
    
; Fase 1 e 3 não muda o inimigo    
.nao_mudar_inimigo:
    mov si, offset nave1
    mov di, offset nave_atual
    mov cx, TAM_SPRITE  
    jmp .repete_mudar
.continuar_mudar_inimigo:

    ; Desenha os inimigos
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

    cmp fase_atual, 3
    je .enemy3_draw_skip

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

    ; Desenha o tiro
    cmp tiro_ativo, 1
    jne .tiro_draw_skip
    mov ax, tiro_y
    mov dx, tiro_x
    mov cl, 0Fh 
    call desenha_pixel
.tiro_draw_skip:
    
    ; Seleciona a velocidade da fase
    cmp fase_atual, 3
    je velocidade_fase3
.volta_nova_velocidade:    
    mov ah, 86h
    mov cx, game_delay_cx
    mov dx, game_delay_dx
    int 15h
    
    
    ; Verifica se o tempo acabou
    mov al, tempo_restante
    cmp al, 0
    je .fim_de_jogo_timer

jmp JOGO_LOOP

velocidade_fase3:
    mov game_delay_dx, 15000
    jmp .volta_nova_velocidade  
; Reescreve a sprite inteira da nave da fase para a sprite da nave atual
.mudar_inimigo:  
    mov si, offset nave2
    mov di, offset nave_atual
    mov cx, TAM_SPRITE
    
; Fica em loop ate escrever toda sprite    
.repete_mudar:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop .repete_mudar
    jmp .continuar_mudar_inimigo
   
; Direciona para a proxima fase    
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
    cmp fase_atual, 3
    je .muda_limite1
    mov cx, 95                  ; Limita em y = 104, sendo - 10 + 1 = 95  
.volta_muda_limite1:    
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
    cmp fase_atual, 3
    je .muda_limite2
    mov cx, 95
.volta_muda_limite2:    
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
    cmp fase_atual, 3
    je .pula_inimigo
respawn_enemy3 proc
    call random
    xor dx, dx
    mov cx, 95                 
    div cx
    mov enemy3_y, dx
    add enemy3_y, 10
    mov enemy3_x, 291
.pula_inimigo:
    ret
respawn_enemy3 endp

; Muda o limite de onde os inimigos podem spawnar na fase 3
.muda_limite1:
    mov cx, 51              ; Limita em y = 60, sendo - 10 + 1 = 51   
    jmp .volta_muda_limite1
.muda_limite2:
    mov cx, 51              ; Limita em y = 60, sendo - 10 + 1 = 51   
    jmp .volta_muda_limite2    
    
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

; -------------------------------------------------------------------
; Funcao: Adiciona 5 unidades ao score (para pontos quebrados).
; Parametros de entrada: Variavel global campo3 (offset 4).
; Parametros de saida: Atualiza campo3 e propaga carry se necessario.
; -------------------------------------------------------------------
adiciona_unidade_5:
    mov bx, 4           
    add byte ptr [campo3 + bx], 5
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_u
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_dezena
.fim_soma_u:
    ret

; -------------------------------------------------------------------
; Funcao: Adiciona 1 dezena ao score.
; Parametros de entrada: Variavel global campo3 (offset 3).
; Parametros de saida: Atualiza campo3 e propaga carry se necessario.
; -------------------------------------------------------------------
adiciona_dezena_1:
    mov bx, 3           
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_d
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_centena
.fim_soma_d:
    ret

; -------------------------------------------------------------------
; Funcao: Adiciona 5 dezenas (50 pontos) ao score.
; Parametros de entrada: Variavel global campo3 (offset 3).
; Parametros de saida: Atualiza campo3 e propaga carry se necessario.
; -------------------------------------------------------------------
adiciona_dezena_5:
    mov bx, 3
    add byte ptr [campo3 + bx], 5
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_d5
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_centena
.fim_soma_d5:
    ret

; -------------------------------------------------------------------
; Funcao: Adiciona 1 centena (100 pontos) ao score.
; Parametros de entrada: Variavel global campo3 (offset 2).
; Parametros de saida: Atualiza campo3 e propaga carry se necessario.
; -------------------------------------------------------------------
adiciona_centena_1:
    mov bx, 2           
    inc byte ptr [campo3 + bx]
    cmp byte ptr [campo3 + bx], '9'
    jle .fim_soma_c
    sub byte ptr [campo3 + bx], 10
    call propaga_carry_milhar
.fim_soma_c:
    ret

; -------------------------------------------------------------------
; Funcao: Propaga o carry (vai um) para as dezenas, centenas e milhares.
; Parametros de entrada: Variavel global campo3.
; Parametros de saida: Atualiza os digitos superiores do score.
; -------------------------------------------------------------------
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

fases endp