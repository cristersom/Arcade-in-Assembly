; main.asm
.model small
.stack 100h

; Arquivos do projeto do jogo
include dados.asm     ; Variaveis, constantes e sprites
include desenha.asm   ; Rotinas de desenho na tela
include telas.asm     ; Telas do jogo (menu, game over, vitoria, etc.)
include fase1.asm     ; Logica e execucao das fases do jogo
include colisao.asm   ; Rotinas de deteccao de colisao

.code

; -------------------------------------------------------------------
; Funcao: Ponto de entrada do programa. Configura segmentos e gerencia o loop principal.
; Parametros de entrada: Nenhum
; Parametros de saida: Nenhum (retorna ao DOS ao finalizar)
; -------------------------------------------------------------------
main:
    mov ax, @data
    mov ds, ax
    mov es, ax   
    call IniciarVideo
    
; Loop do programa   
MainLoop:
    ; Zera os status caso o jogador queira jogar novamente
    mov player_morto, 0
    mov player_venceu, 0
    mov qtd_vidas, 3
    mov fase_atual, 1
    mov game_delay_dx, 3000
    mov timer_counter, 39
    ; Reposiciona os inimigos
    mov enemy1_x, 90  
    mov enemy1_y, 20
    mov enemy2_x, 190 
    mov enemy2_y, 60
    mov enemy3_x, 290 
    mov enemy3_y, 100
    
    call menu_principal     ; Vai para o menu principal
    
    cmp al, 1      ; Compara a escolha do jogador: 1 - Continua, 0 - Sai
    jne .SairDoJogo
    
    ; Zera o score ao iniciar o jogo
    mov byte ptr [campo3], '0'
    mov byte ptr [campo3+1], '0'
    mov byte ptr [campo3+2], '0'
    mov byte ptr [campo3+3], '0'
    mov byte ptr [campo3+4], '0'
    
    call fase_inicio    ; Comeca a fase 1
    jmp .Fase2          ; Pula para fase 2
    
; Sai do modo de video
.SairDoJogo:
    call FinalizarVideo
    mov ah, 4Ch
    int 21h
    
; Dados da fase 2
.Fase2:
    inc fase_atual          ; Incrementa o contador de fases (fase 2)
    mov random_seed, 12345  ; Seleciona uma seed para melhor spawn dos inimigos 
    
    ; Reposiciona os inimigos para a fase 2
    mov enemy1_x, 90  
    mov enemy1_y, 15
    mov enemy2_x, 190 
    mov enemy2_y, 50
    mov enemy3_x, 290 
    mov enemy3_y, 90
    
    call fase_inicio        ; Comeca a fase 2  
    
; Dados da fase 3    
.Fase3:
    inc fase_atual          ; Incrementa o contador de fases (fase 3)
    mov random_seed, 12345  ; Seleciona uma seed para melhor spawn dos inimigos 
    
    ; Reposiciona os inimigos para a fase 3
    mov enemy1_x, 190 
    mov enemy1_y, 20
    mov enemy2_x, 290 
    mov enemy2_y, 40
    
    call fase_inicio       ; Vai para a fase 3
    jmp MainLoop           ; Quando finalizar a fase 3, volta para o menu

; -------------------------------------------------------------------
; Funcao: Inicia o modo de video VGA 320x200 (Modo 13h)
; Parametros de entrada: Nenhum
; Parametros de saida: Altera o modo de video da BIOS (INT 10h/AH=00h)
; -------------------------------------------------------------------
IniciarVideo proc
    mov ax, 0013h
    int 10h
    ret
IniciarVideo endp

; -------------------------------------------------------------------
; Funcao: Finaliza o modo grafico retornando ao modo texto
; Parametros de entrada: Nenhum
; Parametros de saida: Restaura modo de texto padrao (INT 10h/AH=00h)
; -------------------------------------------------------------------
FinalizarVideo proc
    mov ax, 0003h
    int 10h
    ret
FinalizarVideo endp

end main
