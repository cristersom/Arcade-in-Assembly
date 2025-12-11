; colisao.asm
.code

; -------------------------------------------------------------------
; Funcao: Verifica a colisao da nave do jogador com inimigos e com o solo.
; Parametros de entrada: Variaveis globais (player_x, player_y, enemyX_x, enemyX_y)
; Parametros de saida: Altera qtd_vidas, chama reseta_nave_aliada e perde_vida se colidir.
; -------------------------------------------------------------------
verifica_colisao_player proc

checa_enemy1:
    ; Player_x < enemy1_x + 29 (largura da sprite)
    mov ax, player_x
    mov bx, enemy1_x
    add bx, 29
    cmp ax, bx
    jge sem1

    ; Player_x + 29 > enemy1_x
    mov ax, player_x
    add ax, 29
    cmp ax, enemy1_x
    jle sem1

    ; Player_y < enemy1_y + 13 (altura da sprite)
    mov ax, player_y
    mov bx, enemy1_y
    add bx, 13
    cmp ax, bx
    jge sem1

    ; Player_y + 13 > enemy1_y
    mov ax, player_y
    add ax, 13
    cmp ax, enemy1_y
    jle sem1

    ; Se a colisao for detectada, diminui uma vida e reposiciona a nave aliada
    dec qtd_vidas
    call reseta_nave_aliada 
    call perde_vida
    

sem1:

; Checa a colisao com o inimigo 2 usando a mesma estrategia 
checa_enemy2:
    mov ax, player_x
    mov bx, enemy2_x
    add bx, 29
    cmp ax, bx
    jge sem2

    mov ax, player_x
    add ax, 29
    cmp ax, enemy2_x
    jle sem2

    mov ax, player_y
    mov bx, enemy2_y
    add bx, 13
    cmp ax, bx
    jge sem2

    mov ax, player_y
    add ax, 13
    cmp ax, enemy2_y
    jle sem2

    dec qtd_vidas  
    call reseta_nave_aliada 
    call perde_vida

sem2:

; Checa a colisao com o inimigo 3 usando a mesma estrategia     
checa_enemy3:
    mov ax, player_x
    mov bx, enemy3_x
    add bx, 29
    cmp ax, bx
    jge sem3

    mov ax, player_x
    add ax, 29
    cmp ax, enemy3_x
    jle sem3

    mov ax, player_y
    mov bx, enemy3_y
    add bx, 13
    cmp ax, bx
    jge sem3

    mov ax, player_y
    add ax, 13
    cmp ax, enemy3_y
    jle sem3

    dec qtd_vidas
    call reseta_nave_aliada
    call perde_vida

sem3:
    
; Checa a colisao com o solo
checa_solo:
    ; Verifica se esta na Fase 3 (Predios)
    cmp fase_atual, 3
    je checa_solo_f3

    ; --- Logica Fase 1 e 2 (Solo Plano) ---
    mov ax, player_y     ; Topo do player
    add ax, 13           ; Base do player (player_y + altura)
    cmp ax, 119          ; Compara com Y do solo fixo
    jl sem4              
    jmp colisao_solo_detectada

checa_solo_f3:
    ; --- Logica Fase 3 (Predios Irregulares) ---
    ; Verifica a altura permitida no lado ESQUERDO da nave
    mov ax, player_x
    call obtem_altura_predio
    mov cx, ax           ; CX = Altura do solo na esquerda

    ; Verifica a altura permitida no lado DIREITO da nave
    mov ax, player_x
    add ax, 29
    call obtem_altura_predio
    mov bx, ax           ; BX = Altura do solo na direita

    ; Hitbox precisa considerar o predio MAIS ALTO (menor Y) onde a nave esta sobreposta.
    ; Se a nave estiver metade num predio baixo e metade num alto, ela bate no alto.
    cmp bx, cx
    jge usa_altura_cx    ; Se BX >= CX (BX mais baixo na tela), usa CX (mais alto/perigoso)
    mov cx, bx           ; Senao, usa BX

usa_altura_cx:
    ; CX agora contem o limite Y maximo permitido (topo do predio)
    mov ax, player_y
    add ax, 13           ; Base da nave
    cmp ax, cx           ; Compara base da nave com o topo do predio
    jl sem4              ; Se base < predio, esta voando (seguro)

    ; Caso a nave colidir com o solo
colisao_solo_detectada:
    dec qtd_vidas
    call reseta_nave_aliada
    call perde_vida
 
sem4:
    ret      ; Apos verificar todas as colisoes ele retorna

verifica_colisao_player endp

; -------------------------------------------------------------------
; Funcao Auxiliar: Retorna a altura do solo (Y) para um dado X na Fase 3
; Baseado nos dados de 'desenha_superficie_fase3' e 'dados.asm'
; Entrada: AX = Coordenada X
; Saida: AX = Coordenada Y do topo do predio
; -------------------------------------------------------------------
obtem_altura_predio proc
    cmp ax, 72
    jl zona1
    cmp ax, 144
    jl zona2
    cmp ax, 216
    jl zona3
    cmp ax, 288
    jl zona4
    jmp zona5

zona1:
    mov ax, 76   ; Altura inicial
    ret
zona2:
    mov ax, 108  ; 76 + 32
    ret
zona3:
    mov ax, 140  ; 108 + 32
    ret
zona4:
    mov ax, 108  ; 140 - 32
    ret
zona5:
    mov ax, 92   ; 108 - 16
    ret
obtem_altura_predio endp

; -------------------------------------------------------------------
; Funcao: Gerencia a perda de vida, atualiza a HUD e checa Game Over.
; Parametros de entrada: Variavel global qtd_vidas.
; Parametros de saida: Atualiza visual das vidas na tela, define player_morto=1 se vidas=0.
; -------------------------------------------------------------------
perde_vida proc

    ; Apaga todas as vidas sempre que tiver uma colisao  
    mov ax, 0
    mov dx, 181
    call calcula_posicao
    mov bx, OFFSET sprite_vida_vazia
    call desenha_vida
    
    mov ax, 0
    mov dx, 151
    call calcula_posicao
    mov bx, OFFSET sprite_vida_vazia
    call desenha_vida
   
    mov ax, 0
    mov dx, 121
    call calcula_posicao
    mov bx, OFFSET sprite_vida_vazia
    call desenha_vida


    ; Reescreve as sprites conforme a quantidade que o player ainda possuir de vidas 
    cmp qtd_vidas, 2        ; Parte sempre de duas vidas, pois obrigatoriamente ele perdeu a terceira
    je verifica2
    cmp qtd_vidas, 1
    je verifica1
    cmp qtd_vidas, 0
    je verifica0
    jmp fim_perde_vida
    
; Se ele tiver 2 vidas, escreve a primeira e a segunda da esquerda para direita 
verifica2:   
    mov ax, 0
    mov dx, 151
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    
; Se ele tiver uma vida escreve somente a vida da esquerda      
verifica1:
    mov ax, 0
    mov dx, 121
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    jmp fim_perde_vida

; Se ele tiver 0 vidas, ele vai para a tela de Game Over
verifica0:
    cmp qtd_vidas, 0
    mov player_morto, 1
    call fase_inicio

fim_perde_vida:
    ret

perde_vida endp

; -------------------------------------------------------------------
; Funcao: Reseta a posicao da nave aliada apos uma colisao.
; Parametros de entrada: Variaveis globais player_x, player_y.
; Parametros de saida: Define player_x=10, player_y=90 e apaga a sprite na posicao antiga.
; -------------------------------------------------------------------
reseta_nave_aliada proc
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio    ; Apaga a nave da coordenada anterior 
    call desenha_13x29
    cmp fase_atual, 3
    je .troca_reseta   
    mov player_x, 10  
    mov player_y, 90
.volta_troca_reseta:
    ret
    
.troca_reseta:
    mov player_x, 10  
    mov player_y, 50 
    jmp .volta_troca_reseta
    
reseta_nave_aliada endp

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
    ; Inimigo 1
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