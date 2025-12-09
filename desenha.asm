;desenha.asm
.code

; Funcao: Converte coordenadas (X, Y) para offset linear de memoria de video (Y*320+X)
; Parametros de entrada: AX = Y, DX = X
; Parametros de saida: DI = Endereco calculado
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

; Funcao: Desenha um sprite de tamanho 13x29 pixels na memoria de video
; Parametros de entrada: AX = Y, DX = X, BX = Offset do sprite
; Parametros de saida: Nenhum
desenha_13x29 proc
    push ax
    push bx
    push dx
    push cx
    push di
    push es

    mov AX, 0A000h  ; Pega o segmento de video
    mov ES, AX      ; Coloca o segmento de video em ES para desenhar pixels na tela 
    mov DX, 13      ; N?mero de linhas
laco_13x29:         ; Loop para controlar as linhas
    mov CX, 29      ; Numero de colunas
LACO_13x29:         ; Loop para controlar as colunas
    mov AL, [BX]    ; Pega a cor do pixel da sprite
    stosb           ; Pinta o pixel correspondente na tela
    inc BX          ; Vai para proximo dado da sprite
    loop LACO_13x29 ; Repete at? acabar de pintar a linha 
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

; Funcao: Desenha o icone de vida na HUD (7x19 pixels)
; Parametros de entrada: AX = Y, DX = X, BX = Offset do sprite
; Parametros de saida: Nenhum
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

; Funcao: Desenha uma coluna vertical (usado para limpar rastro lateral)
; Parametros de entrada: AX = Y, DX = X, BX = Offset da cor/sprite
; Parametros de saida: Nenhum
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

; Funcao: Desenha uma linha horizontal (usado para limpar rastro vertical)
; Parametros de entrada: AX = Y, DX = X, BX = Offset da cor/sprite
; Parametros de saida: Nenhum
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

; Funcao: Desenha um pixel unico na tela (usado para o tiro)
; Parametros de entrada: AX = Y, DX = X, CL = Cor do pixel
; Parametros de saida: Nenhum
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

; Funcao: Renderiza a superficie e controla o efeito de scroll horizontal
; Parametros de entrada: Variaveis globais 'fase_atual' e 'desloc_superficie'
; Parametros de saida: Atualiza 'desloc_superficie'
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
    push di                            ; Salva ponteiro da mem?ria de v?deo
    
    mov cx, 320                        ; N?mero de colunas (largura da tela)
    mov dx, bp                         ; DX recebe o deslocamento horizontal inicial
    mov ax, dx                         ; Copia deslocamento para AX
    add si, ax                         ; Aplica deslocamento inicial na sprite
    
coluna_loop:
    lodsb                              ; L? um byte da imagem (DS:SI) e incrementa SI
    stosb                              ; Escreve o byte na tela (ES:DI) e incrementa DI
    
    inc dx                             ; Avan?a posi??o na largura da superf?cie
    cmp dx, bx                         ; Verifica se ultrapassou a largura total da imagem
    jb skip_reset                      ; Se ainda estiver dentro da largura, continua
    sub dx, bx                         ; Reseta posi??o horizontal (volta ao in?cio)
    sub si, bx                         ; Corrige SI para in?cio da linha da imagem
    
skip_reset:                 
    
    loop coluna_loop                   ; Repete para todas as 320 colunas da linha
    pop di                             ; Restaura ponteiro de v?deo
    add di, 320                        ; Avan?a para a pr?xima linha da tela

    pop si                             ; Restaura ponteiro da sprite
    add si, 490                        ; Avan?a para a pr?xima linha da sprite de superf?cie

    pop cx                             ; Restaura contador de linhas
    loop linha_loop                    ; Repete para todas as linhas da tela

    mov ax, desloc_superficie          ; Carrega deslocamento horizontal do cen?rio
    inc ax                             ; Incrementa para gerar efeito de scroll
    cmp ax, 490                        ; Verifica se atingiu o final da superf?cie
    jb ok_scroll                       ; Se ainda n?o chegou ao fim, mant?m valor
    xor ax, ax                         ; Se chegou ao fim, volta para zero
ok_scroll:
    
    mov desloc_superficie, ax          ; Atualiza o deslocamento do cen?rio
    
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

; Funcao: Inicializa e desenha a HUD (Score, Vidas, Tempo)
; Parametros de entrada: Variaveis 'campo1'...'campo4', 'qtd_vidas'
; Parametros de saida: Nenhum
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

; Funcao: Exibe a pontuacao final na tela de vitoria
; Parametros de entrada: Variavel 'campo3' (score)
; Parametros de saida: Nenhum
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