; dados.asm
.data

    CR equ 13
    NL equ 10 
    C equ 0Ch
    E equ 0Eh
    

    msg      db "                            __   __   " , CR, NL
             db "    ___ ___________ ___ _  / /  / /__ " , CR, NL
             db "   (_-</ __/ __/ _ `/  ' \/ _ \/ / -_)", CR, NL
             db "  /___/\__/_/  \_,_/_/_/_/_.__/_/\__/ " 

    TAM_MSG equ $-msg 

    nomes    db 'Cristersom Simionato e Wellinton Sartori', CR, NL
    TAM_NOMES equ $-nomes 

    ; Strings separadas para o menu (com alinhamento corrigido)
    menu_jogar_des db '                Jogar  '
    TAM_JOGAR_DES  equ $-menu_jogar_des
    menu_jogar_sel db '              [ Jogar ]'
    TAM_JOGAR_SEL  equ $-menu_jogar_sel

    menu_sair_des  db '                Sair   '
    TAM_SAIR_DES   equ $-menu_sair_des
    menu_sair_sel db '              [ Sair ] '
    TAM_SAIR_SEL   equ $-menu_sair_sel

    menu_selecionado db 0 ; 0 = Jogar, 1 = Sair

    campo3     db '000'
    TAM_MSG5 equ $-campo3 

    campo4     db '60'
    TAM_MSG6 equ $-campo4 

    campo1     db 'SCORE: '
    TAM_MSG3 equ $-campo1 

    campo2     db 'TEMPO: '
    TAM_MSG4 equ $-campo2 

    sprite_vazio db (13*17) dup(0) ; Sprite preto 17x13 para apagar

    ; Coordenadas para a animacao do menu
    nave_aliada_x dw 10 
    nave_aliada_y dw 90  
    nave_alien_x dw 220 
    nave_alien_y dw 70 
    nave_alien2_x dw 120 
    nave_alien2_y dw 50 
    meteoro_x dw 280    
    meteoro_y dw 110  
    meteoro2_x dw 110    
    meteoro2_y dw 130 
    nave3_x dw 20      
    nave3_y dw 188  
    nave4_x dw 280      
    nave4_y dw 187    
    direcao_atual dw 3
    direcao_atual2 dw 2  
    direcao_aliada_y db 1

    ; Variaveis para o delay (50ms)
    delay_cx dw 0
    delay_dx dw 50000 

    ; --- VARIAVEIS DA FASE 1 ---
    qtd_vidas db 3    ; n?mero de vidas do jogador
    vidas_max db 3    ; m?ximo de vidas
    
    player_x dw 10  
    player_y dw 91  

    enemy1_x dw 340 
    enemy1_y dw 65
    enemy2_x dw 380 
    enemy2_y dw 100
    enemy3_x dw 420 
    enemy3_y dw 130

    ; Variaveis do Tiro
    tiro_ativo db 0 
    tiro_x dw 0
    tiro_y dw 0

    ; Delay menor para o jogo
    game_delay_cx dw 0
    game_delay_dx dw 15000 

    tempo_restante  db 60
    timer_counter   db 67 

    ; --- Constantes de Limite da Tela ---
    MIN_X dw 0
    MAX_X dw 302 
    MIN_Y dw 10  
    MAX_Y dw 180 

; (Sprites ... mantidos)
nave_cacador db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 12,12,12,12,12,12,0,0,0,0,0,0,0,0,0,0,0
             db 15,15,15,15,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,15,15,15,0,0,0,0,0,0,15,15,15,15,0,0
             db 0,0,0,0,15,15,15,0,0,0,15,15,0,0,0,15,0
             db 0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,15
             db 14,0,14,0,14,15,15,15,15,15,15,15,15,15,15,15,15
             db 0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,0
             db 0,0,0,0,15,15,15,0,0,0,0,15,15,15,15,0,0
             db 0,0,15,15,15,0,0,0,0,0,0,0,0,0,0,0,0
             db 15,15,15,15,0,0,0,0,0,0,0,0,0,0,0,0,0
             db 12,12,12,12,12,12,0,0,0,0,0,0,0,0,0,0,0
             db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

nave1 db 0,0,0,0,0,0,0,14,14,14,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,14,14,14,0,0,0,0,0,0,0
      db 0,0,0,0,0,14,14,14,14,14,14,14,0,0,0,0,0
      db 0,0,0,0,0,14,14,14,14,14,14,14,0,0,0,0,0
      db 0,0,0,2,2,0,0,2,2,2,0,0,2,2,0,0,0
      db 0,0,0,2,2,0,0,2,2,2,0,0,2,2,0,0,0
      db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
      db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
      db 0,0,0,0,0,13,13,0,14,0,13,13,0,0,0,0,0
      db 0,0,0,0,0,13,13,0,0,0,13,13,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

nave2 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,6,6,6,0,0,6,6,6,0,0,0,0
      db 0,0,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0
      db 0,6,6,5,0,0,0,5,5,5,6,0,0,0,0,0,0
      db 6,6,5,5,0,0,0,5,5,5,5,5,0,5,6,0,0
      db 5,5,5,5,5,5,5,5,0,0,0,5,5,0,0,0,0
      db 5,5,5,5,5,5,5,5,0,0,0,5,5,5,5,5,5
      db 6,5,5,0,0,0,5,5,5,5,5,6,0,0,0,0,0
      db 0,6,5,0,0,0,5,5,6,6,6,6,6,6,0,0,0
      db 0,0,0,6,6,6,6,6,6,6,0,0,0,0,0,0,0
      db 0,0,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

nave3 db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,7,7,7,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,12,12,12,0,0,0,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,0,0,0,4,4,4,0,0,0,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0
      db 0,0,0,0,7,7,7,0,0,0,7,7,7,0,0,0,0

nave4 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      
vidas db 1,1,1,1,1,0,0,0Ch,0Ch,0Ch,0Ch,0Ch,0,0Eh,0Eh,0Eh,0,0,0
      db 0,1,1,1,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0,0Eh,0,0,0Eh,0,0
      db 0,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0,0Eh,0,0Eh,0,0Eh,0Eh
      db 0Eh,0Eh,0Eh,0Eh,0Eh,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0,0,0,0,0,0
      db 0,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch
      db 0,1,1,1,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0,0
      db 1,1,1,1,1,0,0,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0,0,0,0
 
msg_fase1    db "   _______   ________  ___", CR, NL
             db "  / __/ _ | / __/ __/ <  /", CR, NL
             db " / _// __ |_\ \/ _/   / / ", CR, NL
             db "/_/ /_/ |_/___/___/  /_/  ", CR, NL, 0
                                    
TAM_FASE1 equ ($ - msg_fase1)


; fim do dados.asm
