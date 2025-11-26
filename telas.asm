; telas.asm
.code
;----------MENU----------
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

; menu_principal: retorna AL = 1 para Jogar, AL = 0 para Sair
menu_principal proc
    ;push ax
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

    ; desenha cabe?alho
    mov bp, OFFSET msg
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl, 0Ah
    mov cx, TAM_MSG
    mov dh,1
    mov dl,0
    int 10h

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

MenuLoop:
    mov ah, 01h
    int 16h
    jz .pular_teclado

    mov ah, 00h
    int 16h

    cmp al, 0
    jne .checar_enter
    jmp .tecla_especial_menu

.checar_enter:
    cmp ah, 1Ch
    jne .pular_teclado

    cmp menu_selecionado, 1
    je .ret_jogar

    cmp menu_selecionado, 0
    je .ret_sair

    jmp .pular_teclado

.ret_jogar:
    mov al, 0
    jmp .retorna_menu

.ret_sair:
    mov al, 1

.retorna_menu:
    pop es
    pop bp
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    ;pop ax
    ret

.pular_teclado:

    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, OFFSET sprite_coluna_vazia
    call desenha_coluna

    mov ax, nave_alien_y
    mov dx, nave_alien_x
    cmp direcao_atual2,1
    je .continua_sprite
    add dx, 28
.continua_sprite:  
    call calcula_posicao
    mov bx, OFFSET sprite_coluna_vazia
    call desenha_coluna

    mov ax, direcao_atual
    add nave_aliada_x, ax
    neg ax
    add meteoro_x, ax
    
    mov ax, direcao_atual2
    add nave_alien_x, ax

    cmp nave_alien_x, 290
    jge .inverter_alien
    cmp nave_alien_x, 0
    jle .inverter_alien

    jmp .desenhar_local

.inverter_alien:
    mov ax, direcao_atual2
    neg ax
    mov direcao_atual2, ax
    jmp .desenhar_local
    
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

.tecla_especial_menu:
    cmp ah, 48h
    je .move_cima_local
    cmp ah, 50h
    je .move_baixo_local
    jmp MenuLoop

.move_cima_local:
    cmp menu_selecionado, 0
    jne .pula_move_cima_local
    jmp MenuLoop
.pula_move_cima_local:
    dec menu_selecionado
    call atualiza_menu
    jmp MenuLoop

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

fase_inicio proc
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
    cmp fase_atual, 2
    je .troca_texto_fase2
    cmp fase_atual, 3
    je .troca_texto_fase3
    mov si, OFFSET msg_fase1
    
.continua_texto_fase:
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
    cmp fase_atual, 2
    je .troca_cor_texto_fase2
    cmp fase_atual, 3
    je .troca_cor_texto_fase3
    mov bl, A         ; cor
.continua_cor_texto:
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
    call fase1
fase_inicio endp

.troca_texto_fase2:
    mov si, OFFSET msg_fase2
    jmp .continua_texto_fase
.troca_texto_fase3:
    mov si, OFFSET msg_fase3
    jmp .continua_texto_fase
.troca_cor_texto_fase2:
    mov bl, 6
    jmp .continua_cor_texto
.troca_cor_texto_fase3:
    mov bl, 7
    jmp .continua_cor_texto
    
    
