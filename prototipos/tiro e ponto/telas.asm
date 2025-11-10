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
    mov CX, 29
LACO_LINHA:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_LINHA
    mov ax, 320
    sub ax, 29
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
laco_fantasma2:
    mov CX, 19
LACO_LINHA2:
    mov AL, [BX]
    stosb
    inc BX
    loop LACO_LINHA2
    mov ax, 320
    sub ax, 19
    add DI, ax
    dec DX
    jnz laco_fantasma2

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_vida endp


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

    mov ax, direcao_atual
    add nave_aliada_x, ax
    neg ax
    add meteoro_x, ax
    
    mov ax, direcao_atual2
    add nave_alien_x, ax

    ; mov al, direcao_aliada_y
    ; cbw
    ;add nave_aliada_y, ax

    cmp nave_alien_x, 290
    jge .inverter_alien
    cmp nave_alien_x, 0
    jle .inverter_alien

    ;cmp nave_aliada_y, 81
    ;  jle .inverter_aliada_y
    ;cmp nave_aliada_y, 95
    ;jge .inverter_aliada_y

    jmp .desenhar_local

.inverter_alien:
    mov ax, direcao_atual2
    neg ax
    mov direcao_atual2, ax
    jmp .desenhar_local

    ;.inverter_aliada_y:
    ; mov al, direcao_aliada_y
    ;neg al
    ; mov direcao_aliada_y, al

.desenhar_local:
    mov ax, meteoro_y
    mov dx, meteoro_x
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

carrega_hud proc
   mov AL, 13H
    mov AH, 0
    int 10H

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
    mov bl,15 ; Cor Branca (15 ou 0Fh)
    mov cx,TAM_MSG5
    mov dh,0
    mov dl,6
    int 10h

    mov bp,OFFSET campo4
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15 ; Cor Branca (15 ou 0Fh)
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
    
    call atualiza_score_hud ; <-- CHAMA A ROTINA DE ATUALIZAR PLACAR

    ret
carrega_hud endp

;-----------------------------------------------------------
; word_to_string: Converte valor em AX para string de 5 digitos em [DI]
; Entrada: AX = valor, DI = offset da string (campo3)
;-----------------------------------------------------------
word_to_string proc
    push ax
    push bx
    push cx
    push dx
    push di             ; Salva DI
    
    mov bx, 10          ; Divisor
    mov cx, 5           ; N?mero de d?gitos
    add di, 4           ; Aponta para o fim da string ('0000[fim]')
    
.convert_loop:
    xor dx, dx          ; Limpa DX para a divis?o (DX:AX)
    div bx              ; AX = quociente, DX = resto
    add dl, 30h         ; Converte resto para ASCII
    mov [di], dl        ; Salva o d?gito
    dec di              ; Move para a posi??o anterior
    loop .convert_loop
    
    pop di              ; Restaura DI
    pop dx
    pop cx
    pop bx
    pop ax
    ret
word_to_string endp

;-----------------------------------------------------------
; atualiza_score_hud: Atualiza o valor do placar na tela
;-----------------------------------------------------------
atualiza_score_hud proc
    push ax
    push bx
    push cx
    push dx
    push di
    push bp
    push es
    push ds
    
    mov ax, @data
    mov ds, ax
    mov es, ax ; Necess?rio para int 10h, ah=13h

    ; 1. Converte o valor num?rico para string
    mov ax, [score]
    mov di, OFFSET campo3 ; DI ? um offset em DS
    call word_to_string

    ; 2. Imprime a string na tela
    mov bp, OFFSET campo3 ; BP ? um offset em ES
    mov ah, 13h
    mov al, 0h
    xor bh, bh
    mov bl, 15          ; Cor Branca (0Fh)
    mov cx, TAM_MSG5    ; Tamanho (5)
    mov dh, 0           ; Linha 0
    mov dl, 6           ; Coluna 6
    int 10h

    pop ds
    pop es
    pop bp
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    ret
atualiza_score_hud endp

;-----------------------------------------------------------
; checa_colisao: Verifica colis?o AABB (caixa delimitadora)
; ENTRADA:
;   (via STACK, 8 words = 16 bytes)
;   push x1, push y1, push w1, push h1
;   push x2, push y2, push w2, push h2
; SA?DA:
;   AX: 1 se colidiu, 0 se n?o colidiu
;-----------------------------------------------------------
checa_colisao proc
    push bp
    mov bp, sp
    
    ; Salva registradores que vamos usar
    ; push ax ; <-- REMOVIDO, AX ? o valor de retorno
    push bx
    push cx
    push dx
    push si
    push di

    ; --- CORRE??O DE L?GICA E OFFSET ---
    ; Argumentos na stack:
    ; [bp+0] = BP (antigo)
    ; [bp+2] = BX (salvo)
    ; [bp+4] = CX (salvo)
    ; [bp+6] = DX (salvo)
    ; [bp+8] = SI (salvo)
    ; [bp+10] = DI (salvo)
    ; [bp+12] = IP (retorno)
    ; [bp+14] = h2  (push 8)
    ; [bp+16] = w2  (push 7)
    ; [bp+18] = y2  (push 6)
    ; [bp+20] = x2 (push 5)
    ; [bp+22] = h1 (push 4)
    ; [bp+24] = w1 (push 3)
    ; [bp+26] = y1 (push 2)
    ; [bp+28] = x1 (push 1)

    ; Carrega A (obj 1)
    mov ax, [bp+28] ; ax = x1
    mov bx, [bp+26] ; bx = y1
    mov cx, [bp+24] ; cx = w1
    mov dx, [bp+22] ; dx = h1
    
    ; Carrega B (obj 2)
    mov si, [bp+20] ; si = x2
    mov di, [bp+18] ; di = y2

    ; 1. Checa A.X + A.W < B.X (A est? totalmente ? esquerda de B)
    ;    (x1 + w1) < x2 ?
    push ax         ; salva x1 
    add ax, cx      ; ax = x1 + w1
    cmp ax, si      ; (x1 + w1) vs x2
    pop ax          ; restaura x1
    jl .no_colisao  ; Pula se A est? ? esquerda de B

    ; 2. Checa A.X > B.X + B.W (A est? ? direita de B)
    ;    x1 > (x2 + w2) ?
    push si         ; salva x2
    add si, [bp+16] ; si = x2 + w2
    cmp ax, si      ; x1 vs (x2 + w2)
    pop si          ; restaura x2
    jg .no_colisao  ; Pula se A est? ? direita de B

    ; 3. Checa A.Y + A.H < B.Y (A est? acima de B)
    ;    (y1 + h1) < y2 ?
    push bx         ; salva y1
    add bx, dx      ; bx = y1 + h1
    cmp bx, di      ; (y1 + h1) vs y2
    pop bx          ; restaura y1
    jl .no_colisao  ; Pula se A est? acima de B
    
    ; 4. Checa A.Y > B.Y + B.H (A est? abaixo de B)
    ;    y1 > (y2 + h2) ?
    push di         ; salva y2
    add di, [bp+14] ; di = y2 + h2
    cmp bx, di      ; y1 vs (y2 + h2)
    pop di          ; restaura y2
    jg .no_colisao  ; Pula se A est? abaixo de B
    
    ; Se chegou aqui, colidiu!
    mov ax, 1
    jmp .fim_colisao
    
.no_colisao:
    xor ax, ax       ; AX = 0

.fim_colisao:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    ; pop ax ; <-- REMOVIDO (Este era o bug)
    pop bp
    ret 16 ; Limpa 8 words (16 bytes) da stack
checa_colisao endp