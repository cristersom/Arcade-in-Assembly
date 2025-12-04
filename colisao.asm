; colisao.asm
.code
; VERIFICA COLIS?O PLAYER x INIMIGOS
verifica_colisao_player proc
; X = player_x
; Y = player_y
; W = 29
; H = 13

checa_enemy1:
    ; player_x < enemy1_x + 29
    mov ax, player_x
    mov bx, enemy1_x
    add bx, 29
    cmp ax, bx
    jge sem1

    ; player_x + 29 > enemy1_x
    mov ax, player_x
    add ax, 29
    cmp ax, enemy1_x
    jle sem1

    ; player_y < enemy1_y + 13
    mov ax, player_y
    mov bx, enemy1_y
    add bx, 13
    cmp ax, bx
    jge sem1

    ; player_y + 13 > enemy1_y
    mov ax, player_y
    add ax, 13
    cmp ax, enemy1_y
    jle sem1

    ; >>> COLIS?O DETECTADA <<<
    dec qtd_vidas
    call reseta_nave_aliada 
    call perde_vida
    

sem1:
; =======================================================
; CHECA COLIS?O COM INIMIGO 2
; =======================================================
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
; =======================================================
; CHECA COLIS?O COM INIMIGO 3
; =======================================================
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
    
checa_solo:

    mov ax, player_y     ; topo do player
    add ax, 13           ; base do player (player_y + altura)

    cmp ax, 119          ; compara com Y do solo
    jl sem4              

    ; === COLIDIU COM O SOLO ===
    dec qtd_vidas
    call reseta_nave_aliada
    call perde_vida

sem4:
    ret

verifica_colisao_player endp

perde_vida proc

    ; Sempre apaga a vida de cima (posi??o base)
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


    ; ---------- Se qtd_vidas == 2 ----------
    cmp qtd_vidas, 2
    je verifica2
    cmp qtd_vidas, 1
    je verifica1
    cmp qtd_vidas, 0
    je verifica0
    jmp fim_perde_vida
    
verifica2:   
    mov ax, 0
    mov dx, 151
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    

verifica1:
    ; ---------- Se qtd_vidas == 1 ----------
    mov ax, 0
    mov dx, 121
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    jmp fim_perde_vida


verifica0:
    ; ---------- Se qtd_vidas == 0 ----------
    cmp qtd_vidas, 0
    mov player_morto, 1
    jmp game_over

fim_perde_vida:
    ret

perde_vida endp

reseta_nave_aliada proc
    mov ax, player_y
    mov dx, player_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_13x29
    mov player_x, 10  
    mov player_y, 90
    ret
reseta_nave_aliada endp
