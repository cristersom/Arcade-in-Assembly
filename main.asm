; main.asm
.model small
.stack 100h

include dados.asm
include desenha.asm
include telas.asm
include fase1.asm
include colisao.asm

.code

main:
    mov ax, @data
    mov ds, ax
    mov es, ax   
    call IniciarVideo
MainLoop:
    mov player_morto, 0
    mov enemy1_x, 90  
    mov enemy1_y, 20
    mov enemy2_x, 190 
    mov enemy2_y, 60
    mov enemy3_x, 290 
    mov enemy3_y, 100
    call menu_principal
    cmp al, 1
    jne .SairDoJogo
    
    ; --- NOVO: Zera o score ao iniciar o jogo ---
    mov byte ptr [campo3], '0'
    mov byte ptr [campo3+1], '0'
    mov byte ptr [campo3+2], '0'
    mov byte ptr [campo3+3], '0'
    mov byte ptr [campo3+4], '0'
    ; --------------------------------------------
    call fase_inicio
    jmp .Fase2
    
.SairDoJogo:
    call FinalizarVideo
    mov ah, 4Ch
    int 21h
    
.Fase2:
    inc fase_atual
    mov random_seed, 12345
    mov enemy1_x, 90  
    mov enemy1_y, 15
    mov enemy2_x, 190 
    mov enemy2_y, 50
    mov enemy3_x, 290 
    mov enemy3_y, 90
    call fase_inicio   
.Fase3:
    inc fase_atual
    mov random_seed, 12345
    mov enemy1_x, 90 
    mov enemy1_y, 20
    mov enemy2_x, 290 
    mov enemy2_y, 40
    mov enemy3_x, 190
    mov enemy3_y, 60 
    call fase_inicio
    jmp MainLoop    


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
