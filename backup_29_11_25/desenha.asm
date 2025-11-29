.code
;Converte coordenadas (X = AX, Y = DX) em um endereço linear na tela 320×200, retornando a posição em DI.
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

; Desenha um sprite de 13 linhas por 29 colunas na tela, usando BX como ponteiro do sprite e DI como posição inicial no vídeo.
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

;Desenha um ícone de vida formado por um sprite de 7 linhas por 19 colunas, também usando BX como sprite e DI como posição inicial.
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

; Desenha um sprite de 13 linhas por 1 coluna para apagar o rastro dos objetos.
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

; Desenha um sprite de 1 linha por 29 colunas para apagar o rastro dos objetos.
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

; Desenha um único pixel na tela.
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

; Escreve textos na parte superior da tela usando int 10h e desenha os ícones de vida nos lugares corretos do HUD.
carrega_hud proc

    mov ax, @data 
    mov ds, ax  
    mov Es, ax   

    mov bp,OFFSET campo1
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG3
    mov dh,0
    mov dl,0
    int 10h

    mov bp,OFFSET campo2
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG4
    mov dh,0
    mov dl,72
    int 10h

    mov bp,OFFSET campo3
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,TAM_MSG5
    mov dh,0
    mov dl,6
    int 10h

    mov bp,OFFSET campo4
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,TAM_MSG6
    mov dh,0
    mov dl,78
    int 10h 
  
    mov ax, 0
    mov dx, 151
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    
    mov ax, 0
    mov dx, 121
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    
    mov ax, 0
    mov dx, 181
    call calcula_posicao
    mov bx, OFFSET vidas
    call desenha_vida
    
    ret
carrega_hud endp
