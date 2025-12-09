;desenha.asm
.code

; -------------------------------------------------------------------
; Funcao: Converte coordenadas X/Y para offset de memoria de video (Y*320+X).
; Parametros de entrada: AX = Y (Linha), DX = X (Coluna).
; Parametros de saida: DI = Offset calculado.
; -------------------------------------------------------------------
calcula_posicao proc
    push dx
    push cx
    mov cx, 320
    mul cx
    pop cx
    pop dx
    add ax, dx
    mov di, ax      ; DI recebe o resultado
    ret
calcula_posicao endp

; -------------------------------------------------------------------
; Funcao: Desenha uma sprite de 13x29 pixels na memoria de video.
; Parametros de entrada: BX = Offset da Sprite, DI = Posicao inicial na tela.
; Parametros de saida: Escreve pixels na memoria de video (ES:DI).
; -------------------------------------------------------------------
desenha_13x29 proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h  ; Pega o segmento de video
    mov ES, AX      ; Coloca o segmento de video em ES para desenhar pixels na tela 
    mov DX, 13      ; Numero de linhas
laco_13x29:         ; Loop para controlar as linhas
    mov CX, 29      ; Numero de colunas
LACO_13x29:         ; Loop para controlar as colunas
    mov AL, [BX]    ; Pega a cor do pixel da sprite
    stosb           ; Pinta o pixel correspondente na tela
    inc BX          ; Vai para proximo dado da sprite
    loop LACO_13x29 ; Repete ate acabar de pintar a linha 
    mov ax, 320
    sub ax, 29
    add DI, ax      ; Vai para a proxima linha na coluna inicial 
    dec DX          ; Decrementa a linha
    jnz laco_13x29  ; Repete ate acabar o numero de linhas

    pop es
    pop di
    pop cx
    pop dx
    pop bx
    pop ax
    ret
desenha_13x29 endp

; -------------------------------------------------------------------
; Funcao: Desenha a sprite de vida (7x19) na HUD.
; Parametros de entrada: BX = Offset da Sprite, DI = Posicao inicial.
; Parametros de saida: Escreve pixels na memoria de video.
; -------------------------------------------------------------------
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

; -------------------------------------------------------------------
; Funcao: Desenha uma coluna de 1 pixel de largura (13 pixels altura).
; Parametros de entrada: BX = Offset da Sprite, DI = Posicao.
; Parametros de saida: Usada para limpar rastros laterais.
; -------------------------------------------------------------------
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

; -------------------------------------------------------------------
; Funcao: Desenha uma linha de 1 pixel de altura (29 pixels largura).
; Parametros de entrada: BX = Offset da Sprite, DI = Posicao.
; Parametros de saida: Usada para limpar rastros verticais.
; -------------------------------------------------------------------
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

; -------------------------------------------------------------------
; Funcao: Desenha um unico pixel na tela (usado para o tiro).
; Parametros de entrada: Tiro_x, Tiro_y, CL = Cor.
; Parametros de saida: Escreve pixel na memoria.
; -------------------------------------------------------------------
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

; -------------------------------------------------------------------
; Funcao: Desenha e faz o scroll da superficie da fase.
; Parametros de entrada: Global fase_atual, desloc_superficie.
; Parametros de saida: Atualiza a tela e incrementa desloc_superficie.
; -------------------------------------------------------------------
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

    ; Preenche a parte do solo com pixels estaticos no qual nao participaram do scroll perdendo menos fps 
    mov cx, 21000
    cmp fase_atual, 2                  ; Seleciona a cor no qual sera preenchido conforme a fase atual
    je .mudar_cor_superficie
    mov al, 1                          ; Cor da fasae 1 (azul) 
    
.continuar_mudar_cor_superficie:
    rep stosb
    
    cmp fase_atual, 2                  ; Seleciona qual sprite ira formar a superficie 
    je .mudar_superficie

    mov si, OFFSET superficie_fase1    ; Superficie da fase 1

.continua_mudar_superficie:
    mov ax, 0A000h
    mov es, ax

    mov ax, 119                        ; Comeca a desenhar a superficie em y = 119
    mov dx, 0
    call calcula_posicao
    
    ; Dados da sprite do solo
    mov bx, 490                        ; 490 colunas 
    mov cx, 20                         ; 20 linhas
    mov ax, desloc_superficie          
    mov bp, ax

linha_loop:
    push cx                            ; Salva o contador de linhas
    push si                            ; Salva ponteiro da sprite
    push di                            ; Salva ponteiro da memoria de video
    
    mov cx, 320                        ; Numero de colunas (largura da tela)
    mov dx, bp                         ; DX recebe o deslocamento horizontal inicial
    mov ax, dx                         ; Copia deslocamento para AX
    add si, ax                         ; Aplica deslocamento inicial na sprite
    
coluna_loop:
    lodsb                              ; Le um byte da imagem (DS:SI) e incrementa SI
    stosb                              ; Escreve o byte na tela (ES:DI) e incrementa DI
    
    inc dx                             ; Avanca posicao na largura da superficie
    cmp dx, bx                         ; Verifica se ultrapassou a largura total da imagem
    jb skip_reset                      ; Se ainda estiver dentro da largura, continua
    sub dx, bx                         ; Reseta posicao horizontal (volta ao inicio)
    sub si, bx                         ; Corrige SI para inicio da linha da imagem
    
skip_reset:                 
    
    loop coluna_loop                   ; Repete para todas as 320 colunas da linha
    pop di                             ; Restaura ponteiro de video
    add di, 320                        ; Avanca para a proxima linha da tela

    pop si                             ; Restaura ponteiro da sprite
    add si, 490                        ; Avanca para a proxima linha da sprite de superficie

    pop cx                             ; Restaura contador de linhas
    loop linha_loop                    ; Repete para todas as linhas da tela

    mov ax, desloc_superficie          ; Carrega deslocamento horizontal do cenario
    inc ax                             ; Incrementa para gerar efeito de scroll
    cmp ax, 490                        ; Verifica se atingiu o final da superficie
    jb ok_scroll                       ; Se ainda nao chegou ao fim, mantem valor
    xor ax, ax                         ; Se chegou ao fim, volta para zero
ok_scroll:
    
    mov desloc_superficie, ax          ; Atualiza o deslocamento do cenario
    
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

; Muda a superficie para a fase 2
.mudar_superficie:
    mov si, OFFSET superficie_fase2 
    jmp .continua_mudar_superficie
    
; Muda a cor da superficie 2
.mudar_cor_superficie:
    mov al, 6                           ; Cor marrom
    jmp .continuar_mudar_cor_superficie

; -------------------------------------------------------------------
; Funcao: Carrega os textos e valores iniciais da HUD na tela.
; Parametros de entrada: Globais campo1, campo2, campo3, campo4, qtd_vidas.
; Parametros de saida: Escreve score, tempo e vidas na tela.
; -------------------------------------------------------------------
carrega_hud proc

    mov ax, @data 
    mov ds, ax  
    mov Es, ax   

    ; Texto "SCORE:"
    mov bp,OFFSET campo1
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG3
    mov dh,0                            ; Y = 0
    mov dl,0                            ; X = 0
    int 10h

    ; Texto "TEMPO:"
    mov bp,OFFSET campo2
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG4
    mov dh,0
    mov dl,32
    int 10h

    ; Valor do score 
    mov bp,OFFSET campo3
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,5  ; 5 digitos
    mov dh,0
    mov dl,6 
    int 10h

    ; Valor do tempo
    mov bp,OFFSET campo4
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,2
    mov cx,2
    mov dh,0
    mov dl,38
    int 10h 
    
    ; Desenha as vidas conforme a quantidade
    cmp qtd_vidas, 2
    je .qtd2
    cmp qtd_vidas, 1
    je .qtd1
    cmp qtd_vidas, 0
    
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

; -------------------------------------------------------------------
; Funcao: Exibe o score final centralizado na tela de vitoria.
; Parametros de entrada: Variavel global campo3 (Score).
; Parametros de saida: Escreve score no centro da tela.
; -------------------------------------------------------------------
carrega_score_final proc

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
    mov Es, ax   

    ; Texto "SCORE:"
    mov bp,OFFSET campo1
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,TAM_MSG3
    mov dh,15
    mov dl,14
    int 10h

    ; Valor do score
    mov bp,OFFSET campo3
    mov ah,13h
    mov al,0h
    xor bh,bh
    mov bl,15
    mov cx,5                   
    mov dh,15                  
    mov dl,20                 
    int 10h
    
    pop es
    pop ds
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    
carrega_score_final endp