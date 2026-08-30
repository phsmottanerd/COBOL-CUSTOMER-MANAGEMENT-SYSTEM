from pathlib import Path
import zipfile
from xml.sax.saxutils import escape

root = Path("/mnt/data/CRUD-CLIENTES-COBOL")
assets = root / "assets"
assets.mkdir(parents=True, exist_ok=True)

GREEN = "#00FF41"
BG = "#000000"
FONT = "DejaVu Sans Mono, Courier New, monospace"

def make_svg(filename, title, lines, width=1400, line_height=34, extra_height=0):
    pad_x, top = 42, 62
    height = top + (len(lines) * line_height) + 55 + extra_height
    out = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        f'<rect width="100%" height="100%" fill="{BG}"/>',
        f'<rect x="14" y="14" width="{width-28}" height="{height-28}" rx="8" fill="none" stroke="{GREEN}" stroke-width="3"/>',
        f'<text x="{pad_x}" y="55" fill="{GREEN}" font-family="{FONT}" font-size="28" font-weight="800">{escape(title)}</text>',
    ]
    y = top + 40
    for line in lines:
        out.append(
            f'<text x="{pad_x}" y="{y}" fill="{GREEN}" font-family="{FONT}" '
            f'font-size="21" font-weight="800">{escape(line)}</text>'
        )
        y += line_height
    out.append("</svg>")
    (assets / filename).write_text("\n".join(out), encoding="utf-8")

make_svg("01-header.svg", ">>> COBOL TERMINAL // CRUD DE CLIENTES <<<", [
    "PAULO HENRIQUE",
    "GNUCOBOL  |  LEGACY COMPUTING  |  FILE PROCESSING",
    "",
    ">>> PROGRAM LOADED",
    ">>> FILE SYSTEM READY",
    ">>> CRUD SYSTEM ONLINE",
    "",
    "████  COBOL — LEGACY TO THE FUTURE  ████",
], line_height=38, extra_height=15)

make_svg("02-descricao.svg", ">>> DESCRIÇÃO DO PROJETO <<<", [
    "Sistema de gerenciamento de clientes desenvolvido em COBOL.",
    "Implementado com GNUCOBOL e processamento sequencial de arquivos.",
    "",
    "O programa permite incluir, consultar, listar e excluir clientes.",
    "Os registros são armazenados no arquivo CLIENTES.DAT.",
    "Durante a exclusão, TEMP.DAT é usado para reconstruir o arquivo.",
    "",
    "OBJETIVO: praticar COBOL, registros, arquivos, validação e fluxo.",
], line_height=36)

make_svg("03-crud.svg", ">>> OPERAÇÕES DO CRUD <<<", [
    "[1] INCLUIR CLIENTE",
    "    Recebe código, nome, CPF e telefone.",
    "    Verifica se o código já existe antes de gravar.",
    "",
    "[2] CONSULTAR CLIENTE",
    "    Pesquisa CLIENTES.DAT pelo código informado.",
    "",
    "[3] LISTAR CLIENTES",
    "    Percorre todos os registros e exibe os clientes.",
    "",
    "[4] EXCLUIR CLIENTE",
    "    Confirma a exclusão e reconstrói CLIENTES.DAT.",
    "",
    "[0] SAIR",
], line_height=35, extra_height=20)

make_svg("04-arquivos.svg", ">>> ARQUIVOS E REGISTROS <<<", [
    "CLIENTES.DAT",
    "    CODIGO      PIC 9(05)",
    "    NOME        PIC X(30)",
    "    CPF         PIC X(11)",
    "    TELEFONE    PIC X(15)",
    "",
    "TEMP.DAT",
    "    TEMP-CODIGO       PIC 9(05)",
    "    TEMP-NOME         PIC X(30)",
    "    TEMP-CPF          PIC X(11)",
    "    TEMP-TELEFONE     PIC X(15)",
], line_height=34)

make_svg("05-fluxo.svg", ">>> FLUXO DE EXECUÇÃO <<<", [
    "INICIO",
    "  |",
    "  +--> CRIAR-ARQUIVO",
    "  |",
    "  +--> MENU",
    "         |",
    "         +--> INCLUIR",
    "         +--> CONSULTAR",
    "         +--> LISTAR",
    "         +--> EXCLUIR",
    "         |       |",
    "         |       +--> REMOVER-CLIENTE",
    "         |               |",
    "         |               +--> RECRIAR-ARQUIVO",
    "         |",
    "         +--> SAIR",
    "                 |",
    "                 +--> STOP RUN",
], line_height=33)

make_svg("06-cobol.svg", ">>> ESTRUTURA COBOL <<<", [
    "IDENTIFICATION DIVISION",
    "    PROGRAM-ID. CRUD-CLIENTES.",
    "",
    "ENVIRONMENT DIVISION",
    "    FILE-CONTROL",
    "        CLIENTES -> CLIENTES.DAT",
    "        TEMP     -> TEMP.DAT",
    "",
    "DATA DIVISION",
    "    FILE SECTION",
    "    WORKING-STORAGE SECTION",
    "",
    "PROCEDURE DIVISION",
    "    INICIO",
    "    CRIAR-ARQUIVO",
    "    MENU",
    "    INCLUIR / CONSULTAR / LISTAR / EXCLUIR",
    "    REMOVER-CLIENTE / RECRIAR-ARQUIVO",
], line_height=33)

make_svg("07-tecnologias.svg", ">>> STACK E CONCEITOS <<<", [
    "LINGUAGEM       : COBOL",
    "COMPILADOR      : GNUCOBOL",
    "ARMAZENAMENTO   : ARQUIVOS SEQUENCIAIS",
    "FORMATO         : LINE SEQUENTIAL",
    "CONTROLE        : FILE STATUS",
    "",
    "CONCEITOS PRATICADOS:",
    "  OPEN / CLOSE / READ / WRITE",
    "  PERFORM / EVALUATE / IF",
    "  ACCEPT / DISPLAY",
    "  REGISTROS E FILE HANDLING",
    "  VALIDAÇÃO DE CÓDIGO",
    "  RECONSTRUÇÃO DE ARQUIVO PARA EXCLUSÃO",
], line_height=34)

make_svg("08-mainframe.svg", ">>> DA ESTAÇÃO LOCAL AO MAINFRAME <<<", [
    "ESTE PROJETO É UMA BASE PRÁTICA PARA EVOLUIR EM COBOL.",
    "",
    "COBOL",
    "  |",
    "  +--> JCL",
    "        |",
    "        +--> JES",
    "              |",
    "              +--> z/OS",
    "                    |",
    "                    +--> IBM Z",
    "",
    "O CRUD LOCAL REFORÇA FUNDAMENTOS QUE APARECEM",
    "EM AMBIENTES CORPORATIVOS E MAINFRAME.",
    "",
    "🦖  LEGACY TECHNOLOGY  |  MODERN ENGINEERING  💾",
], line_height=34, extra_height=20)

make_svg("09-terminal.svg", ">>> SYSTEM STATUS <<<", [
    "USER       : PAULO HENRIQUE",
    "PROGRAM    : CRUD-CLIENTES",
    "LANGUAGE   : COBOL",
    "COMPILER   : GNUCOBOL",
    "DATABASE   : CLIENTES.DAT",
    "TEMP FILE  : TEMP.DAT",
    "STATUS     : ONLINE",
    "",
    "> READY FOR COMPILE",
    "> READY FOR EXECUTION",
    "> READY FOR NEXT RECORD",
    "",
    "        🦖  COBOL NEVER DIED.  💾",
], line_height=35, extra_height=10)

readme = """<div align="center">

<img src="./assets/01-header.svg" width="100%" alt="COBOL Terminal CRUD de Clientes">

</div>

<div align="center">

<img src="./assets/02-descricao.svg" width="100%" alt="Descrição do projeto">

</div>

<div align="center">

<img src="./assets/03-crud.svg" width="100%" alt="Operações CRUD">

</div>

<div align="center">

<img src="./assets/04-arquivos.svg" width="100%" alt="Arquivos e registros">

</div>

<div align="center">

<img src="./assets/05-fluxo.svg" width="100%" alt="Fluxo de execução">

</div>

<div align="center">

<img src="./assets/06-cobol.svg" width="100%" alt="Estrutura COBOL">

</div>

<div align="center">

<img src="./assets/07-tecnologias.svg" width="100%" alt="Stack e conceitos">

</div>

<div align="center">

<img src="./assets/08-mainframe.svg" width="100%" alt="Evolução para Mainframe">

</div>

---

<div align="center">

<img src="./assets/09-terminal.svg" width="100%" alt="System status">

</div>

---

## >>> COMO FUNCIONA <<<

Este projeto implementa um CRUD de clientes em COBOL usando arquivos sequenciais.

### 01. INCLUIR

O programa solicita o código do cliente e chama `VERIFICAR-CODIGO`.  
Se o código ainda não existir, solicita nome, CPF e telefone e grava o registro em `CLIENTES.DAT`.

### 02. CONSULTAR

O usuário informa um código. O programa abre `CLIENTES.DAT`, percorre os registros com `READ` e apresenta os dados quando encontra o código informado.

### 03. LISTAR

O programa percorre `CLIENTES.DAT` do início ao fim e apresenta todos os registros encontrados.

### 04. EXCLUIR

O programa primeiro localiza o código e pede confirmação.  
Quando a exclusão é confirmada, `REMOVER-CLIENTE` copia todos os registros diferentes do código escolhido para `TEMP.DAT`. Depois `RECRIAR-ARQUIVO` recria `CLIENTES.DAT` usando os registros preservados.

---

## >>> ESTRUTURA DO PROJETO <<<

```text
CRUD-CLIENTES/
├── CRUD-CLIENTES.COB
├── README.md
└── assets/
    ├── 01-header.svg
    ├── 02-descricao.svg
    ├── 03-crud.svg
    ├── 04-arquivos.svg
    ├── 05-fluxo.svg
    ├── 06-cobol.svg
    ├── 07-tecnologias.svg
    ├── 08-mainframe.svg
    └── 09-terminal.svg
