; colisao.asm
.code

; Funcao: Verifica colisoes entre o jogador e inimigos ou solo
; Parametros de entrada: Coordenadas globais do player e inimigos
; Parametros de saida: Decrementa 'qtd_vidas' se houver colisao
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

; Checa a colisao com o inimigo 2 usando a mesma estrategia     
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

    mov ax, player_y     ; Topo do player
    add ax, 13           ; Base do player (player_y + altura)

    cmp ax, 119          ; Compara com Y do solo
    jl sem4              

    ; Caso a nave colidir com o solo perde uma vida
    dec qtd_vidas
    call reseta_nave_aliada
    call perde_vida
 
sem4:
    ret      ; Apos verificar todas as colisoes ele retorna

verifica_colisao_player endp

; Funcao: Gerencia a perda de vidas e atualiza a HUD
; Parametros de entrada: Variavel 'qtd_vidas'
; Parametros de saida: Atualiza 'player_morto' se vidas chegarem a 0
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

; Funcao: Reposiciona a nave na coordenada inicial apos morte
; Parametros de entrada: Coordenadas atuais da nave
; Parametros de saida: Reseta 'player_x' e 'player_y'
reseta_nave_aliada proc
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio    ; Apaga a nave da coordenada anterior 
    call desenha_13x29
    mov player_x, 10  
    mov player_y, 90
    ret
reseta_nave_aliada endp