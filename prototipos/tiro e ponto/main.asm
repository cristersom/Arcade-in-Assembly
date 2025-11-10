; main.asm
.model small
.stack 100h

include dados.asm
include telas.asm
include fase1.asm

.code

main:
    mov ax, @data
    mov ds, ax
    mov es, ax       

MainLoop:
    call IniciarVideo

    call menu_principal
    cmp al, 1
    jne .SairDoJogo
    call fase1_inicio
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
