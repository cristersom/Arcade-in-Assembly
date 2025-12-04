;desenha.asm
.code
;Converte coordenadas
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

; Desenha sprite 13x29
desenha_13x29 proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h
    mov ES, AX
    mov DX, 13
laco_13x29:
    mov CX, 29
LACO_13x29:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_13x29
    mov ax, 320
    sub ax, 29
    add DI, ax
    dec DX
    jnz laco_13x29

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_13x29 endp

;Desenha vida
desenha_vida proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h
    mov ES, AX
    mov DX, 7
laco_7x19:
    mov CX, 19
LACO_7x19:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_7x19
    mov ax, 320
    sub ax, 19
    add DI, ax
    dec DX
    jnz laco_7x19

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_vida endp

; Desenha coluna
desenha_coluna proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h
    mov ES, AX
    mov DX, 13
    
laco_13x1:
    mov CX, 1
LACO_13x1:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_13x1
    mov ax, 320
    sub ax, 1
    add DI, ax
    dec DX
    jnz laco_13x1

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_coluna endp

; Desenha linha
desenha_linha proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h
    mov ES, AX
    mov DX, 1
    
laco_1x29:
    mov CX, 29
LACO_1x29:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_1x29
    mov ax, 320
    sub ax, 29
    add DI, ax
    dec DX
    jnz laco_1x29

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_linha endp

; Desenha pixel
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
    je .mudar_cor_superficie
    mov al, 1
.continuar_mudar_cor_superficie:
    rep stosb
    
    cmp fase_atual, 2
    je .mudar_superficie

    mov si, OFFSET superficie_fase1
.continua_mudar_superficie:
    mov ax, 0A000h
    mov es, ax

    mov ax, 119
    mov dx, 0
    call calcula_posicao

    mov bx, 490
    mov cx, 20
    mov ax, desloc_superficie
    mov bp, ax

linha_loop:
    push cx
    push si
    push di
    mov cx, 320
    mov dx, bp
    mov ax, dx
    add si, ax
coluna_loop:
    lodsb
    stosb
    inc dx
    cmp dx, bx
    jb skip_reset
    sub dx, bx
    sub si, bx
skip_reset:
    loop coluna_loop

    pop di
    add di, 320
    pop si
    add si, 490
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
desenha_superficie_fase endp

.mudar_superficie:
    mov si, OFFSET superficie_fase2 
    jmp .continua_mudar_superficie
.mudar_cor_superficie:
    mov al, 6
    jmp .continuar_mudar_cor_superficie

; Carrega HUD (ATUALIZADO PARA 5 DIGITOS)
carrega_hud proc

    mov ax, @data 
    mov ds, ax  
    mov Es, ax   

    ; Texto SCORE:
    mov bp,OFFSET campo1
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG3
    mov dh,0
    mov dl,0
    int 10h

    ; Texto TEMPO:
    mov bp,OFFSET campo2
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG4
    mov dh,0
    mov dl,32
    int 10h

    ; Valor SCORE (5 Digitos)
    mov bp,OFFSET campo3
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,5  ; AGORA 5
    mov dh,0
    mov dl,6  ; Ajustado
    int 10h

    ; Valor TEMPO
    mov bp,OFFSET campo4
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,2
    mov dh,0
    mov dl,38 ; Ajustado para o fim da tela
    int 10h 
    
    cmp qtd_vidas, 2
    je .qtd2
    cmp qtd_vidas, 1
    je .qtd1
    cmp qtd_vidas, 0
    ;jmp gameover
    
    mov ax, 0
    mov dx, 181
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
.qtd2:  
    mov ax, 0
    mov dx, 151
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    
.qtd1:    
    mov ax, 0
    mov dx, 121
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    
    ret
carrega_hud endp
