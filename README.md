<div align="center">

<img src="https://capsule-render.vercel.app/api?type=rect&color=000000&height=120&section=header&text=CRUD%20DE%20CLIENTES&fontColor=00FF41&fontSize=35&fontAlignY=50&desc=COBOL%20%7C%20GNUCOBOL%20%7C%20LEGACY%20COMPUTING&descColor=00FF41&descSize=16" width="100%"/>

<br>

<img src="https://readme-typing-svg.demolab.com?font=Courier+New&weight=700&size=22&duration=2500&pause=1000&color=00FF41&background=00000000&center=true&vCenter=true&width=700&lines=COBOL+CUSTOMER+MANAGEMENT+SYSTEM;PROGRAM+LOADED...;FILE+SYSTEM+READY...;CRUD+SYSTEM+ONLINE..." />

</div>

---

<div align="center">

```text
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║                 COBOL CUSTOMER MANAGEMENT SYSTEM             ║
║                                                              ║
║                 >>> PROGRAM LOADED <<<                       ║
║                 >>> FILE SYSTEM READY <<<                    ║
║                 >>> CRUD SYSTEM ONLINE <<<                    ║
║                                                              ║
║                 🦖  COBOL  💾  MAINFRAME                     ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

</div>

# 🦖 CRUD DE CLIENTES — COBOL

**Autor:** Paulo Henrique
**Projeto:** CRUD Client Management System
**Tecnologia:** COBOL / GNUCOBOL
**Aplicação:** Console / Terminal
**Persistência:** Arquivos `.DAT`

---

# 🟢 DESCRIÇÃO

Este projeto consiste em um **sistema de gerenciamento de clientes desenvolvido em COBOL**, utilizando **GNUCOBOL** para compilação e execução.

A aplicação demonstra, de forma prática, conceitos fundamentais da programação COBOL, incluindo:

* processamento sequencial de arquivos;
* criação e leitura de registros;
* inclusão de clientes;
* consulta por código;
* listagem de registros;
* exclusão de clientes;
* utilização de arquivo temporário;
* controle de `FILE STATUS`;
* estruturas `PERFORM`, `IF`, `EVALUATE` e `READ`;
* operações `OPEN`, `WRITE` e `CLOSE`.

O projeto foi desenvolvido como laboratório prático de **COBOL e processamento de dados**, aproximando conceitos tradicionais de sistemas corporativos e ambientes Mainframe.

---

# 🖥️ MENU PRINCIPAL

```text
╔══════════════════════════════════════════════════════╗
║                                                      ║
║              CRUD DE CLIENTES - COBOL                ║
║                                                      ║
║              [1] INCLUIR CLIENTE                    ║
║              [2] CONSULTAR CLIENTE                  ║
║              [3] LISTAR CLIENTES                    ║
║              [4] EXCLUIR CLIENTE                    ║
║              [0] SAIR                                ║
║                                                      ║
║              OPCAO:                                  ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
```

O programa apresenta um menu interativo em terminal.

O usuário seleciona a operação através da variável:

```cobol
01  OPCAO PIC 9 VALUE 9.
```

A seleção é processada através de `EVALUATE`.

---

# 💾 ARQUIVOS UTILIZADOS

O sistema utiliza dois arquivos principais:

```text
CRUD-CLIENTES
│
├── CLIENTES.DAT
│
└── TEMP.DAT
```

### CLIENTES.DAT

É o arquivo principal da aplicação.

Nele ficam armazenados os registros dos clientes.

### TEMP.DAT

É utilizado durante o processo de exclusão.

Os registros que não serão excluídos são copiados para o arquivo temporário.

Depois o arquivo principal é reconstruído.

---

# 🧬 ESTRUTURA DO CLIENTE

Cada cliente possui quatro informações:

```cobol
01  CLIENTE.
    05  CODIGO       PIC 9(05).
    05  NOME         PIC X(30).
    05  CPF          PIC X(11).
    05  TELEFONE     PIC X(15).
```

### Estrutura

```text
╔════════════════════════════════════════════╗
║ CODIGO    → 5 posições numéricas           ║
║ NOME      → 30 posições alfanuméricas      ║
║ CPF       → 11 posições alfanuméricas      ║
║ TELEFONE  → 15 posições alfanuméricas      ║
╚════════════════════════════════════════════╝
```

---

# ➕ INCLUIR CLIENTE

A operação de inclusão começa solicitando o código:

```text
Codigo:
```

O programa copia o código para:

```cobol
MOVE CODIGO TO CODIGO-BUSCA
```

Depois executa:

```cobol
PERFORM VERIFICAR-CODIGO
```

O objetivo é impedir que dois clientes possuam o mesmo código.

Se o código já existir:

```text
ERRO: CODIGO JA CADASTRADO.
```

Caso não exista, o programa solicita:

```text
Nome:
CPF:
Telefone:
```

Depois abre o arquivo para extensão:

```cobol
OPEN EXTEND CLIENTES
```

E grava o registro:

```cobol
WRITE CLIENTE
```

Resultado:

```text
CLIENTE INCLUIDO COM SUCESSO.
```

---

# 🔎 CONSULTAR CLIENTE

A consulta recebe um código:

```text
Codigo:
```

O programa abre:

```cobol
OPEN INPUT CLIENTES
```

Depois realiza a leitura sequencial:

```cobol
READ CLIENTES
```

Cada registro é comparado com:

```cobol
CODIGO-BUSCA
```

Quando encontra o cliente:

```text
Codigo   : 00001
Nome     : PAULO HENRIQUE
CPF      : 12345678901
Telefone : 21999999999
```

Caso não encontre:

```text
CLIENTE NAO ENCONTRADO.
```

---

# 📋 LISTAR CLIENTES

A operação `LISTAR` percorre o arquivo inteiro.

Fluxo:

```text
OPEN INPUT CLIENTES
        │
        ▼
     READ
        │
        ▼
    DISPLAY
        │
        ▼
     READ
        │
        ▼
     DISPLAY
        │
        ▼
      AT END
        │
        ▼
      CLOSE
```

A saída é apresentada no terminal:

```text
CODIGO | NOME | CPF | TELEFONE
------------------------------------------

00001 | PAULO HENRIQUE | 12345678901 | 21999999999
00002 | JOAO SILVA    | 98765432100 | 21988888888
```

---

# 🗑️ EXCLUIR CLIENTE

A exclusão utiliza uma estratégia importante de processamento de arquivos.

O programa não simplesmente apaga fisicamente uma linha do arquivo.

Em vez disso:

```text
CLIENTES.DAT
     │
     ▼
    READ
     │
     ▼
COMPARAR CÓDIGO
     │
     ├───────────────┐
     │               │
   IGUAL          DIFERENTE
     │               │
     ▼               ▼
  DESCARTA        COPIA PARA
  REGISTRO        TEMP.DAT
                       │
                       ▼
                   TEMP.DAT
                       │
                       ▼
              RECRIAR ARQUIVO
                       │
                       ▼
                 CLIENTES.DAT
```

Essa abordagem permite reconstruir o arquivo sem o registro selecionado.

---

# 🔄 RECRIAR ARQUIVO

Após a exclusão, o procedimento:

```cobol
RECRIAR-ARQUIVO.
```

abre o arquivo temporário:

```cobol
OPEN INPUT TEMP
```

e cria novamente o arquivo principal:

```cobol
OPEN OUTPUT CLIENTES
```

Depois os registros são copiados novamente:

```cobol
READ TEMP
```

seguido de:

```cobol
WRITE CLIENTE
```

Resultado:

```text
TEMP.DAT
   │
   ▼
READ
   │
   ▼
WRITE
   │
   ▼
CLIENTES.DAT
```

---

# ⚙️ FILE STATUS

O programa utiliza `FILE STATUS` para verificar o resultado das operações de arquivo.

```cobol
FILE STATUS IS WS-FILE-STATUS.
```

E:

```cobol
FILE STATUS IS WS-TEMP-STATUS.
```

Os campos são definidos como:

```cobol
01  WS-FILE-STATUS   PIC XX VALUE SPACES.
01  WS-TEMP-STATUS   PIC XX VALUE SPACES.
```

O código:

```text
00
```

indica operação realizada com sucesso.

O código:

```text
35
```

é utilizado pelo programa para identificar que o arquivo não foi encontrado durante a abertura para entrada.

Nesse caso, o programa cria `CLIENTES.DAT`.

---

# 🗂️ ORGANIZAÇÃO DO ARQUIVO

O projeto utiliza:

```cobol
ORGANIZATION IS LINE SEQUENTIAL
```

Isso significa que os registros são armazenados de forma sequencial em arquivo texto.

A definição utilizada é:

```cobol
SELECT CLIENTES
    ASSIGN TO "CLIENTES.DAT"
    ORGANIZATION IS LINE SEQUENTIAL
    FILE STATUS IS WS-FILE-STATUS.
```

---

# 🧠 PRINCIPAIS COMANDOS COBOL

O projeto utiliza comandos fundamentais da linguagem.

### Arquivos

```text
OPEN
READ
WRITE
CLOSE
```

### Entrada e saída

```text
ACCEPT
DISPLAY
```

### Controle

```text
IF
ELSE
EVALUATE
PERFORM
```

### Processamento

```text
MOVE
```

### Tratamento de leitura

```text
AT END
NOT AT END
```

---

# 🏗️ ESTRUTURA DO PROGRAMA

O programa está organizado nas principais divisões COBOL:

```text
IDENTIFICATION DIVISION
        │
        ▼
ENVIRONMENT DIVISION
        │
        ▼
DATA DIVISION
        │
        ├── FILE SECTION
        │
        └── WORKING-STORAGE SECTION
        │
        ▼
PROCEDURE DIVISION
```

---

# 🖥️ FLUXO GERAL

```text
                INÍCIO
                  │
                  ▼
          CRIAR-ARQUIVO
                  │
                  ▼
                MENU
                  │
        ┌─────────┼─────────┐
        │         │         │
        ▼         ▼         ▼
    INCLUIR   CONSULTAR   LISTAR
        │         │         │
        └─────────┼─────────┘
                  │
                  ▼
               EXCLUIR
                  │
                  ▼
             MENU NOVAMENTE
                  │
                  ▼
                 SAIR
```

---

# 🦖 COBOL E MAINFRAME

Embora este projeto seja executado localmente utilizando **GNUCOBOL**, seus conceitos são diretamente relacionados ao aprendizado de ambientes COBOL corporativos.

O próximo nível de evolução envolve tecnologias como:

```text
🦖 COBOL
   │
   ▼
💾 JCL
   │
   ▼
🖥️ z/OS
   │
   ├── JES
   ├── VSAM
   ├── DB2
   └── CICS
   │
   ▼
🖥️ IBM Z
```

O objetivo é utilizar este projeto como uma base para avançar de um CRUD baseado em arquivos para aplicações COBOL em ambiente Mainframe.

---

# 🏛️ LEGACY COMPUTING

COBOL possui uma longa história no processamento de dados empresariais.

Este projeto demonstra conceitos que continuam importantes:

```text
DADOS
  │
  ▼
REGISTROS
  │
  ▼
ARQUIVOS
  │
  ▼
PROCESSAMENTO
  │
  ▼
REGRAS DE NEGÓCIO
  │
  ▼
SISTEMAS CORPORATIVOS
```

O objetivo não é apenas criar um CRUD.

É compreender **como sistemas tradicionais processam dados e regras de negócio**.

---

# 🛠️ TECNOLOGIAS

```text
╔══════════════════════════════════════════════════╗
║                                                  ║
║  LANGUAGE      : COBOL                           ║
║  COMPILER      : GNUCOBOL                        ║
║  IDE           : OpenCobolIDE                    ║
║  STORAGE       : FILE SYSTEM                     ║
║  FILE FORMAT   : LINE SEQUENTIAL                 ║
║  APPLICATION   : CONSOLE                         ║
║                                                  ║
╚══════════════════════════════════════════════════╝
```

---

# 📁 ESTRUTURA DO PROJETO

```text
CRUD-CLIENTES/
│
├── main.cob
│
├── CLIENTES.DAT
│
├── TEMP.DAT
│
└── README.md
```

---

# 🚀 COMPILAÇÃO

Com o GNUCOBOL instalado:

```bash
cobc -x -free -o crud-clientes main.cob
```

No Windows:

```bash
crud-clientes.exe
```

No Linux:

```bash
./crud-clientes
```

---

# 🧪 OPERAÇÕES IMPLEMENTADAS

```text
╔══════════════════════════════════════════════════╗
║                                                  ║
║  [✓] INCLUIR CLIENTE                             ║
║  [✓] CONSULTAR CLIENTE                           ║
║  [✓] LISTAR CLIENTES                             ║
║  [✓] EXCLUIR CLIENTE                             ║
║                                                  ║
║  [✓] VALIDAÇÃO DE CÓDIGO                         ║
║  [✓] FILE STATUS                                 ║
║  [✓] ARQUIVO TEMPORÁRIO                          ║
║  [✓] RECONSTRUÇÃO DO ARQUIVO                    ║
║                                                  ║
╚══════════════════════════════════════════════════╝
```

---

# 🔮 PRÓXIMOS PASSOS

A evolução planejada para o projeto pode incluir:

```text
[✓] CRUD COM ARQUIVO SEQUENCIAL
[✓] INCLUSÃO
[✓] CONSULTA
[✓] LISTAGEM
[✓] EXCLUSÃO
[✓] FILE STATUS

[ ] ALTERAÇÃO DE CLIENTES
[ ] VSAM KSDS
[ ] JCL
[ ] BATCH
[ ] DB2
[ ] CICS
[ ] z/OS
[ ] IBM Z
```

---

# 👨‍💻 AUTOR

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=rect&color=000000&height=100&section=footer&text=PAULO%20HENRIQUE&fontColor=00FF41&fontSize=30&desc=COBOL%20%7C%20MAINFRAME%20%7C%20GNUCOBOL&descColor=00FF41&descSize=14"/>

```text
╔══════════════════════════════════════════════════════╗
║                                                      ║
║                 PAULO HENRIQUE                       ║
║                                                      ║
║              COBOL / MAINFRAME                      ║
║              GNUCOBOL                               ║
║              LEGACY COMPUTING                       ║
║                                                      ║
║                 🦖 💾 🖥️                             ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
```

</div>

---

<div align="center">

```text
>>> COBOL CUSTOMER MANAGEMENT SYSTEM <<<
>>> PROGRAM STATUS: ONLINE <<<
>>> FILE SYSTEM: READY <<<
>>> LEGACY COMPUTING: ACTIVE <<<
```

### 🦖💚 COBOL — LEGACY TO THE FUTURE 💚🦖

</div>
