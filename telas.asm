; telas.asm
.code

; desenha_fantasma: BX = offset sprite, AX=Y, DX=X
desenha_fantasma proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h
    mov ES, AX
    mov DX, 13
laco_fantasma:
    mov CX, 17
LACO_LINHA:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_LINHA
    mov ax, 320
    sub ax, 17
    add DI, ax
    dec DX
    jnz laco_fantasma

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_fantasma endp

calcula_posicao proc
    push dx
    push cx
    mov cx, 320
    mul cx
    pop cx
    pop dx
    add ax, dx
    mov di, ax
    ret
calcula_posicao endp

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

desenha_pixel proc
    push di
    push es
    push cx
    push dx

    mov cx, 320
    mul cx

    pop dx
    add ax, dx
    mov di, ax

    mov ax, 0A000h
    mov es, ax

    pop cx
    mov es:[di], cl

    pop es
    pop di
    ret
desenha_pixel endp

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
    ; anima??o (igual estava)
    mov ax, meteoro_y
    mov dx, meteoro_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, meteoro2_y
    mov dx, meteoro2_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, nave_alien_y
    mov dx, nave_alien_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, nave_alien2_y
    mov dx, nave_alien2_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, nave3_y
    mov dx, nave3_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, nave4_y
    mov dx, nave4_x
    call calcula_posicao
    mov bx, OFFSET sprite_vazio
    call desenha_fantasma

    mov ax, direcao_atual
    add nave_aliada_x, ax
    neg ax
    add meteoro_x, ax
    add meteoro2_x, ax

    mov ax, direcao_atual2
    add nave_alien_x, ax
    neg ax
    add nave_alien2_x, ax

    mov al, direcao_aliada_y
    cbw
    add nave_aliada_y, ax

    cmp nave_alien_x, 303
    jge .inverter_alien
    cmp nave_alien_x, 0
    jle .inverter_alien
    cmp nave_alien2_x, 303
    jge .inverter_alien
    cmp nave_alien2_x, 0
    jle .inverter_alien

    cmp nave_aliada_y, 81
    jle .inverter_aliada_y
    cmp nave_aliada_y, 95
    jge .inverter_aliada_y

    jmp .desenhar_local

.inverter_alien:
    mov ax, direcao_atual2
    neg ax
    mov direcao_atual2, ax
    jmp .desenhar_local

.inverter_aliada_y:
    mov al, direcao_aliada_y
    neg al
    mov direcao_aliada_y, al

.desenhar_local:
    mov ax, meteoro_y
    mov dx, meteoro_x
    call calcula_posicao
    mov bx, OFFSET nave2
    call desenha_fantasma

    mov ax, meteoro2_y
    mov dx, meteoro2_x
    call calcula_posicao
    mov bx, OFFSET nave2
    call desenha_fantasma

    mov ax, nave_aliada_y
    mov dx, nave_aliada_x
    call calcula_posicao
    mov bx, OFFSET nave_cacador
    call desenha_fantasma

    mov ax, nave_alien_y
    mov dx, nave_alien_x
    call calcula_posicao
    mov bx, OFFSET nave1
    call desenha_fantasma

    mov ax, nave_alien2_y
    mov dx, nave_alien2_x
    call calcula_posicao
    mov bx, OFFSET nave1
    call desenha_fantasma

    mov ax, nave3_y
    mov dx, nave3_x
    call calcula_posicao
    mov bx, OFFSET nave3
    call desenha_fantasma

    mov ax, nave4_y
    mov dx, nave4_x
    call calcula_posicao
    mov bx, OFFSET nave3
    call desenha_fantasma

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

