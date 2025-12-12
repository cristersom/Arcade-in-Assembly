# Scramble - Assembly x86 (TDE 2)

Este repositório contém a implementação do jogo "Scramble", um clássico arcade de tiro com rolagem horizontal (side-scrolling), desenvolvido em Assembly 8086. Este projeto foi realizado como parte da Avaliação TDE 2 da disciplina de Computadores.

O jogo utiliza o modo de vídeo VGA 13h (320x200, 256 cores) e manipulação direta de memória de vídeo para renderização gráfica.

## Autores

* Cristersom Simionato
* Wellinton Sartori

## Sobre o Projeto

O objetivo deste trabalho foi desenvolver um programa em Assembly 8086 inspirado no jogo Scramble (Konami, 1981). O jogo foi adaptado para atender aos requisitos acadêmicos, focando em otimização de código, manipulação de strings e acesso direto à memória de vídeo.

### Especificações Técnicas

* **Linguagem:** Assembly x86 (16-bit).
* **Modo de Vídeo:** VGA 13h (320x200 pixels).
* **Renderização:** Escrita direta na memória de vídeo (Segmento 0A000h) para performance otimizada, evitando o uso excessivo de interrupções de BIOS para desenho de pixels.
* **Compilador Recomendado:** MASM (Microsoft Macro Assembler) ou TASM (Turbo Assembler).
* **Ambiente de Execução:** DOSBox ou emulador compatível com arquitetura 8086.

## Funcionalidades do Jogo

O jogo consiste em 3 fases distintas, cada uma com duração de 60 segundos. O jogador possui 3 vidas e deve acumular a maior pontuação possível.

### Fase 1: Espaço
* **Ambiente:** Superfície montanhosa azul com inimigos (naves alienígenas).
* **Inimigos:** Destrutíveis. Surgem aleatoriamente da direita para a esquerda.
* **Pontuação:**
  * 100 pontos por nave destruída.
  * 10 pontos por segundo de sobrevivência.

### Fase 2: Meteoros
* **Ambiente:** Superfície rochosa marrom (cor 6).
* **Inimigos:** Meteoros indestrutíveis. O jogador deve desviar.
* **Pontuação:**
  * 15 pontos por segundo de sobrevivência.
  * Tiros nos meteoros não geram pontos e não os destroem.

### Fase 3: Cidade
* **Ambiente:** Cenário urbano com prédios de alturas variadas.
* **Colisão Dinâmica:** A detecção de colisão com o solo considera a altura variável dos prédios desenhados na tela.
* **Inimigos:** Naves alienígenas mais rápidas.
* **Pontuação:**
  * 150 pontos por nave destruída.
  * 20 pontos por segundo de sobrevivência.

## Controles

A leitura do teclado é realizada via interrupção 16h (BIOS), sem bloqueio de execução.

| Tecla         | Ação                          |
|---------------|-------------------------------|
| Seta Cima     | Move a nave para cima         |
| Seta Baixo    | Move a nave para baixo        |
| Seta Esquerda | Move a nave para a esquerda   |
| Seta Direita  | Move a nave para a direita    |
| Barra de Espaço | Disparar tiro               |
| Enter         | Confirmar seleção no Menu     |

## Estrutura dos Arquivos

* **main.asm**: Arquivo principal contendo o ponto de entrada, gerenciamento de pilha e loop principal do jogo.
* **dados.asm**: Declaração de variáveis globais, constantes e definição das sprites (matrizes de cores para naves, terreno e fontes).
* **desenha.asm**: Rotinas de baixo nível para desenho na tela (pixel, linha, coluna e sprites completas) utilizando acesso direto à memória.
* **fases.asm**: Lógica de execução das fases, controle de tempo (timer), pontuação e movimentação de entidades.
* **colisao.asm**: Lógica de detecção de colisão (Bounding Box) entre jogador, inimigos, tiros e terreno.
* **telas.asm**: Gerenciamento e renderização das telas de Menu, Game Over e Vitória.

## Como Compilar e Executar

Para compilar este projeto, é necessário ter os arquivos fonte no mesmo diretório e utilizar um montador e linker compatíveis (ex: MASM 6.11).

Passo a passo no DOSBox:

1. Monte o arquivo principal (os outros arquivos são incluídos via diretiva `include`):
   masm main.asm;

2. Ligue o objeto gerado:
   link main.obj;

3. Execute o jogo:
   main.exe

## Decisões de Implementação

* **Scroll de Tela:** Nas fases 1 e 2, o terreno realiza um scroll horizontal contínuo. Na fase 3, o terreno é gerado proceduralmente com base em vetores de altura de prédios.
* **Gerador Aleatório:** Implementado um gerador pseudo-aleatório (Linear Congruential Generator) para definir as posições verticais de respawn dos inimigos, garantindo que o jogo não seja repetitivo.
* **Performance:** Instruções de string (`stosb`, `lodsb`) foram amplamente utilizadas nas rotinas de desenho para garantir a taxa de quadros necessária para a fluidez do jogo.
