; main.asm
.model small
.stack 100h

include dados.asm
include desenha.asm
include telas.asm
include fase1.asm

.code

main:
    mov ax, @data
    mov ds, ax
    mov es, ax   
    call IniciarVideo
MainLoop:
    call menu_principal
    cmp al, 1
    jne .SairDoJogo
    
    ; --- NOVO: Zera o score ao iniciar o jogo ---
    mov byte ptr [campo3], '0'
    mov byte ptr [campo3+1], '0'
    mov byte ptr [campo3+2], '0'
    mov byte ptr [campo3+3], '0'
    mov byte ptr [campo3+4], '0'
    mov fase_atual, 1
    ; --------------------------------------------

    call fase_inicio
.Fase2:
    inc fase_atual
    mov tempo_restante, 60
    mov random_seed, 12345
    mov enemy1_x, 90 
    mov enemy1_y, 15
    mov enemy2_x, 290 
    mov enemy2_y, 50
    mov enemy3_x, 190
    mov enemy3_y, 90 
    call fase_inicio
    jmp MainLoop

.SairDoJogo:
    call FinalizarVideo
    mov ah, 4Ch
    int 21h

IniciarVideo proc
    mov ax, 0013h
    int 10h
    ret
IniciarVideo endp

FinalizarVideo proc
    mov ax, 0003h
    int 10h
    ret
FinalizarVideo endp

end main