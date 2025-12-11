; telas.asm
.code

;-------------------MENU-------------------

; -------------------------------------------------------------------
; Funcao: Atualiza visualmente a selecao do menu (Jogar/Sair).
; Parametros de entrada: Variavel global menu_selecionado.
; Parametros de saida: Escreve strings coloridas na tela via INT 10h.
; -------------------------------------------------------------------
atualiza_menu proc

    cmp menu_selecionado, 0        ; Compara para saber qual esta selecionado
    je .desenha_jogar_selecionado

; menu_selecionado = 1 [Sair]
.desenha_sair_selecionado:
    mov bp, OFFSET menu_jogar_des
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Fh
    mov cx, TAM_JOGAR_DES
    mov dh, 20
    mov dl, 0
    int 10h
    mov bp, OFFSET menu_sair_sel
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Ch
    mov cx, TAM_SAIR_SEL
    mov dh, 21
    mov dl, 0
    int 10h
    jmp .fim
    
; menu_selecionado = 0 [Jogar]
.desenha_jogar_selecionado:
    mov bp, OFFSET menu_jogar_sel
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Ch
    mov cx, TAM_JOGAR_SEL
    mov dh, 20
    mov dl, 0
    int 10h
    mov bp, OFFSET menu_sair_des
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 0Fh
    mov cx, TAM_SAIR_DES
    mov dh, 21
    mov dl, 0
    int 10h
.fim:
    ret
atualiza_menu endp

; -------------------------------------------------------------------
; Funcao: Exibe e gerencia o menu principal do jogo.
; Parametros de entrada: Entrada do teclado (INT 16h).
; Parametros de saida: Retorna AL = 1 para Jogar, AL = 0 para Sair.
; -------------------------------------------------------------------
menu_principal proc
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push es

    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Desenha o nome do jogo no menu 
    mov bp, OFFSET msg
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl, 0Ah
    mov cx, TAM_MSG
    mov dh,1
    mov dl,0
    int 10h

    ; Desenha o nome dos autores
    mov bp, OFFSET nomes
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx, TAM_NOMES
    mov dh,18
    mov dl,0
    int 10h

    call atualiza_menu
    
; Verifica se a tecla pressionada corresponde com enter ou direcionais (cima e baixo)    
MenuLoop:
    mov ah, 01h
    int 16h
    jz .pular_teclado

    mov ah, 00h
    int 16h

    cmp al, 0
    jne .checar_enter
    jmp .tecla_especial_menu
    
; Checa qual opcao o player escolheu  
.checar_enter:
    cmp ah, 1Ch
    jne .pular_teclado

    cmp menu_selecionado, 1
    je .ret_sair

    cmp menu_selecionado, 0
    je .ret_jogar

    jmp .pular_teclado

; Retorna AL com o valor da opcao selecinada: 0 - Sair, 1 - Jogar   
.ret_sair:
    mov al, 0
    jmp .retorna_menu

    .ret_jogar:
    mov al, 1

; Recupera os valores de cada registrador    
.retorna_menu:
    pop es
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    ret

; Mantem a animacao do menu    
.pular_teclado:

    ; Apaga o rastro da esquerda da nave
    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, OFFSET sprite_coluna_vazia
    call desenha_coluna

    ; Comeca desenhando a nave alien indo para a direita
    mov ax, nave_alien_y
    mov dx, nave_alien_x
    cmp direcao_atual2,1
    je .continua_sprite
    add dx, 28
    
.continua_sprite:
    ; Se a nave alien esta indo para a direita apaga o rastro da esquerda
    call calcula_posicao
    mov bx, OFFSET sprite_coluna_vazia
    call desenha_coluna
    
    ; Atribui a direcao para as spritesa para a direita por padrao 
    mov ax, direcao_atual
    add nave_aliada_x, ax 
    neg ax                 ; Inverte a direcao para o meteoro
    add meteoro_x, ax
    
    ; Usa outra variavel para a nave alien para nao afetar a aliada
    mov ax, direcao_atual2
    add nave_alien_x, ax

    ; Compara o limite da tela para inverter a nave alien 
    cmp nave_alien_x, 290
    jge .inverter_alien
    cmp nave_alien_x, 0
    jle .inverter_alien

    jmp .desenhar_local

; Inverte toda vez que chegar no limite da tela
.inverter_alien:
    mov ax, direcao_atual2
    neg ax
    mov direcao_atual2, ax
    jmp .desenhar_local
    
; Desenha todos os sprites em suas devidas localizacoes em X e Y    
.desenhar_local:
    mov ax, meteoro_y
    mov dx, meteoro_x
    call calcula_posicao
    mov bx, OFFSET nave2
    call desenha_13x29

    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_13x29

    mov ax, nave_alien_y
    mov dx, nave_alien_x
    call calcula_posicao
    mov bx, OFFSET nave1
    call desenha_13x29

    mov ah, 86h
    mov cx, delay_cx
    mov dx, delay_dx
    int 15h

    jmp MenuLoop
    
; Compara a tecla escolhida para fazer o movimento do menu
.tecla_especial_menu:
    cmp ah, 48h
    je .move_cima_local
    cmp ah, 50h
    je .move_baixo_local
    jmp MenuLoop

; Move menu para cima     
.move_cima_local:
    cmp menu_selecionado, 0
    jne .pula_move_cima_local
    jmp MenuLoop    
.pula_move_cima_local:
    dec menu_selecionado
    call atualiza_menu
    jmp MenuLoop

; Move menu para baixo    
.move_baixo_local:
    cmp menu_selecionado, 1
    jne .pula_move_baixo_local
    jmp MenuLoop
.pula_move_baixo_local:
    inc menu_selecionado
    call atualiza_menu
    jmp MenuLoop
    
menu_principal endp

;----------FASES----------

; -------------------------------------------------------------------
; Funcao: Prepara e exibe a tela de inicio de fase, Game Over ou Vitoria.
; Parametros de entrada: Estado global (fase_atual, player_morto, player_venceu).
; Parametros de saida: Exibe texto na tela e aguarda delay.
; -------------------------------------------------------------------
fase_inicio proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    push bp
    push es

    ; Comeca apagando tudo que tem na tela (tela preta)
    mov ax, 0A000h
    mov es, ax
    xor di, di
    mov al, 0
    mov cx, 320*200
    rep stosb

    ; Imprime o texto conforme a fase
    mov ax, @data
    mov ds, ax
    cmp player_morto, 1
    je .troca_texto_fim
    cmp fase_atual, 2
    je .troca_texto_fase2
    cmp fase_atual, 3
    je .troca_texto_fase3
    cmp player_venceu, 1
    je .troca_texto_venceu
    mov si, OFFSET msg_fase1
    jmp .continua_texto_fase
    
; Troca o texto conforme o contador    
.troca_texto_fim:
    mov si, OFFSET msg_game_over
    jmp .continua_texto_fase
.troca_texto_fase2:
    mov si, OFFSET msg_fase2
    jmp .continua_texto_fase
.troca_texto_fase3:
    mov si, OFFSET msg_fase3
    jmp .continua_texto_fase
.troca_texto_venceu:
    mov si, OFFSET msg_vencedor
    jmp .continua_texto_fase
    
.continua_texto_fase:
    mov dh, 9          ; Linha inicial da tela (vertical)
    
.PrintLine:
    push si            ; Salvar posicao atual da string
    xor cx, cx         ; Contador de caracteres da linha

; Conta os caracteres     
.CountChars:
    lodsb
    cmp al, CR
    je .GotLineLength
    cmp al, 0
    je .DonePrint
    inc cx
    jmp .CountChars

.GotLineLength:

    ; Calcular coluna inicial para centralizar
    mov bx, 40         ; Largura da tela em caracteres
    sub bx, cx
    shr bx, 1          ; Bx = coluna inicial

    ; Reposicionar cursor
    mov ah, 02h
    mov bh, 0
    mov dh, dh         ; Linha vertical
    mov dl, bl         ; Coluna horizontal
    int 10h

    pop si             ; Restaurar posicao da linha

; Imprime os caracteres da sprite 
.PrintChars:
    lodsb
    cmp al, CR
    je .NextLine
    mov ah, 0Eh
    mov bh, 0
    
    ; Escolhe a cor do texto conforme a fase
    cmp player_morto, 1
    je .troca_cor_fim
    cmp fase_atual, 2
    je .troca_cor_texto_fase2
    cmp fase_atual, 3
    je .troca_cor_texto_fase3
    mov bl, A                    ; Cor padrao (verde claro)
    jmp .continua_cor_texto

.troca_cor_fim:
    mov bl, 4                    ; Cor vermelha(morte)
    jmp .continua_cor_texto
.troca_cor_texto_fase2:
    mov bl, 6                    ; Cor laranja
    jmp .continua_cor_texto
.troca_cor_texto_fase3:
    mov bl, 7                    ; Cor cinza
    jmp .continua_cor_texto      
    
.continua_cor_texto:
    int 10h
    jmp .PrintChars

.NextLine:
    inc dh             ; Proxima linha vertical
    lodsb              ; Pular LF
    jmp .PrintLine

.DonePrint:
    cmp player_venceu, 1
    jne .continua_para_delay
    call carrega_score_final      ; Mostra o score do jogador
    
    
; Aplica o delay 4 segundos
.continua_para_delay:    
    mov ax, 0040h
    mov es, ax
    mov bx, es:[006Ch]
    add bx, 73          ; Aproximadamente 4 segundos
    
.WaitLoop:
    cmp es:[006Ch], bx
    jl .WaitLoop        ; Loop se es < bx

    ; Apaga novamente tudo que tinha na teal 
    mov ax, 0A000h
    mov es, ax
    xor di, di
    mov al, 0
    mov cx, 320*200
    rep stosb
    
    cmp player_morto, 1   ; Se o player morreu acaba o jogo 
    je .fim_fase
    cmp player_venceu, 1  ; Se o player venceu acaba o jogo
    je .fim_fase
    call fases            ; Se o player estiver vivo e nao acabou o jogo, continua normalmente 
        
; Volta para o menu quando acabar a fase
.fim_fase:
    jmp MainLoop
    
fase_inicio endp
    
; -------------------------------------------------------------------
; Funcao: Marca o jogador como vencedor e chama a tela de vitoria.
; Parametros de entrada: Nenhum.
; Parametros de saida: Atualiza player_venceu=1.
; -------------------------------------------------------------------
vencedor:
    mov player_venceu, 1
    call fase_inicio
