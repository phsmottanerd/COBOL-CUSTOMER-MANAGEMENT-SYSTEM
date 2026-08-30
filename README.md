# 🦖💚 COBOL CUSTOMER MANAGEMENT SYSTEM 💚🦖

<div align="center">

```text
 ██████╗ ██████╗ ██████╗  ██████╗ ██╗     
██╔════╝██╔═══██╗██╔══██╗██╔═══██╗██║     
██║     ██║   ██║██████╔╝██║   ██║██║     
██║     ██║   ██║██╔══██╗██║   ██║██║     
╚██████╗╚██████╔╝██████╔╝╚██████╔╝███████╗
 ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝

        🦖 MAINFRAME • COBOL • LEGACY COMPUTING 🦖

             >>> SYSTEM ONLINE <<<
```

**COBOL CUSTOMER MANAGEMENT SYSTEM**

**Sistema de Gestão de Clientes desenvolvido em COBOL**

🟢 **GNUCOBOL**
🟢 **CRUD**
🟢 **FILE PROCESSING**
🟢 **LINE SEQUENTIAL**
🟢 **LEGACY COMPUTING**

</div>

---

## 🟢 💾 SOBRE O PROJETO

Este projeto implementa um **sistema de gerenciamento de clientes utilizando COBOL**, demonstrando conceitos fundamentais da programação tradicional e do processamento de arquivos.

O sistema foi desenvolvido para reproduzir, em um ambiente moderno, conceitos que fazem parte da história da computação empresarial, especialmente o processamento de dados utilizado em sistemas **mainframe**.

🦖💚 **Antes dos frameworks modernos, das APIs REST, dos containers e da computação em nuvem, sistemas COBOL já processavam grandes volumes de dados em ambientes corporativos.**

Este projeto é uma demonstração prática dessa tecnologia.

---

## 🟢 🦖 POR QUE COBOL?

COBOL — **Common Business-Oriented Language** — foi criado para aplicações voltadas principalmente ao processamento de informações empresariais.

Mesmo sendo uma tecnologia antiga, COBOL continua associado a sistemas críticos de grandes organizações, especialmente em ambientes de:

```text
🦖 MAINFRAME
🦖 BANCO DE DADOS
🦖 SISTEMAS FINANCEIROS
🦖 PROCESSAMENTO DE TRANSAÇÕES
🦖 PROCESSAMENTO BATCH
🦖 GRANDES VOLUMES DE DADOS
```

O objetivo deste projeto é estudar esses conceitos através de uma aplicação prática.

---

# 🟢 ⚙️ FUNCIONALIDADES

O sistema implementa um CRUD completo:

| Operação  | Função                |
| --------- | --------------------- |
| 🟢 CREATE | Inclusão de clientes  |
| 🟢 READ   | Consulta de clientes  |
| 🟢 READ   | Listagem de clientes  |
| 🟢 UPDATE | Alteração de clientes |
| 🟢 DELETE | Exclusão de clientes  |

### 🟢 MENU DO SISTEMA

```text
==========================================
          CRUD DE CLIENTES - COBOL
==========================================

[1] INCLUIR
[2] CONSULTAR
[3] LISTAR
[4] ALTERAR
[5] EXCLUIR
[0] SAIR

==========================================
OPCAO:
```

---

# 🟢 📋 DADOS DO CLIENTE

Cada cliente possui:

```text
CODIGO
NOME
CPF
TELEFONE
```

Estrutura utilizada no programa:

```cobol
01 CLIENTE.
    05 CODIGO       PIC 9(5).
    05 NOME         PIC X(30).
    05 CPF          PIC X(11).
    05 TELEFONE     PIC X(15).
```

Essa estrutura demonstra uma característica importante do COBOL:

> Os dados são definidos explicitamente através de estruturas e campos.

---

# 🟢 💾 COMO O CRUD FUNCIONA

## 🟢 1. INCLUIR CLIENTE

O usuário informa:

```text
Codigo
Nome
CPF
Telefone
```

Antes da gravação, o sistema verifica se o código já existe.

```text
CODIGO → VERIFICAÇÃO → GRAVAÇÃO
```

Se o código já estiver cadastrado:

```text
ERRO: CODIGO JA CADASTRADO.
```

Caso contrário:

```text
CLIENTE INCLUIDO COM SUCESSO.
```

---

# 🟢 🔎 2. CONSULTAR CLIENTE

O usuário informa o código.

O programa abre `CLIENTES.DAT` e percorre os registros utilizando `READ`.

```text
CODIGO INFORMADO
       ↓
OPEN INPUT
       ↓
READ
       ↓
COMPARA CODIGO
       ↓
ENCONTROU?
   ↙       ↘
 SIM       NÃO
  ↓         ↓
EXIBE     NÃO ENCONTRADO
```

Quando encontra o registro:

```text
Codigo   : 00001
Nome     : PAULO HENRIQUE
CPF      : 12345678901
Telefone : 21999999999
```

---

# 🟢 📋 3. LISTAR CLIENTES

A opção **LISTAR** percorre todos os registros do arquivo.

O programa executa sucessivos:

```cobol
READ CLIENTES
```

até chegar ao:

```text
AT END
```

Representação:

```text
CLIENTES.DAT
     │
     ├── CLIENTE 001
     ├── CLIENTE 002
     ├── CLIENTE 003
     ├── CLIENTE 004
     └── AT END
```

---

# 🟢 ✏️ 4. ALTERAR CLIENTE

Para alterar um cliente, o sistema:

```text
1. Localiza o código
2. Lê os registros
3. Cria um arquivo temporário
4. Mantém os registros existentes
5. Substitui os dados do cliente
6. Reconstrói CLIENTES.DAT
```

Esse mecanismo demonstra uma técnica clássica de processamento de arquivos sequenciais.

```text
CLIENTES.DAT
     ↓
READ
     ↓
TEMP.DAT
     ↓
ALTERAÇÃO
     ↓
NOVO CLIENTES.DAT
```

---

# 🟢 🗑️ 5. EXCLUIR CLIENTE

A exclusão também utiliza processamento através de arquivo temporário.

O programa lê todos os clientes.

Se o código for diferente daquele que será excluído:

```text
WRITE → TEMP.DAT
```

Se for o código selecionado:

```text
NÃO COPIA
```

Depois:

```text
TEMP.DAT
    ↓
RECRIA
    ↓
CLIENTES.DAT
```

Resultado:

```text
CLIENTE EXCLUIDO COM SUCESSO.
```

---

# 🟢 💾 ARQUIVOS UTILIZADOS

O sistema utiliza dois arquivos:

### `CLIENTES.DAT`

Arquivo principal dos clientes.

```text
CLIENTES.DAT
```

### `TEMP.DAT`

Arquivo temporário utilizado durante operações de alteração e exclusão.

```text
TEMP.DAT
```

O projeto utiliza:

```cobol
ORGANIZATION IS LINE SEQUENTIAL
```

Isso permite trabalhar com registros armazenados sequencialmente em arquivo texto.

---

# 🟢 🧠 CONCEITOS COBOL UTILIZADOS

Este projeto demonstra diversos conceitos importantes:

```text
🟢 IDENTIFICATION DIVISION
🟢 ENVIRONMENT DIVISION
🟢 DATA DIVISION
🟢 FILE SECTION
🟢 WORKING-STORAGE SECTION
🟢 PROCEDURE DIVISION
🟢 FILE-CONTROL
🟢 FILE STATUS
🟢 OPEN
🟢 CLOSE
🟢 READ
🟢 WRITE
🟢 EXTEND
🟢 PERFORM
🟢 EVALUATE
🟢 IF / ELSE
🟢 ACCEPT
🟢 DISPLAY
🟢 AT END
🟢 PIC
🟢 LINE SEQUENTIAL
```

---

# 🟢 🧬 ESTRUTURA DO PROGRAMA

O fluxo principal pode ser representado assim:

```text
                    🦖 COBOL SYSTEM
                          │
                          ▼
                  ┌───────────────┐
                  │    INICIO     │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │ CRIAR ARQUIVO │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │     MENU      │
                  └───────┬───────┘
                          │
          ┌───────────────┼───────────────┐
          ▼               ▼               ▼
       INCLUIR         CONSULTAR        LISTAR
          │               │               │
          └───────────────┼───────────────┘
                          │
                 ┌────────┴────────┐
                 ▼                 ▼
              ALTERAR           EXCLUIR
                 │                 │
                 └────────┬────────┘
                          ▼
                    CLIENTES.DAT
```

---

# 🟢 🦖 COBOL E OS "DINOSSAUROS" DA COMPUTAÇÃO

Este projeto também representa uma pequena viagem pela evolução da computação.

```text
🦖 MAINFRAME
      │
      ▼
🦖 COBOL
      │
      ▼
🦖 ARQUIVOS SEQUENCIAIS
      │
      ▼
🦖 PROCESSAMENTO DE DADOS
      │
      ▼
💻 COMPUTADORES PESSOAIS
      │
      ▼
🌐 INTERNET
      │
      ▼
☁️ CLOUD
      │
      ▼
🤖 IA
```

O mais interessante é que uma parte importante dessa história **ainda está em produção**.

COBOL não é apenas uma linguagem antiga.

É parte da infraestrutura de sistemas empresariais que ajudaram a construir a computação moderna.

---

# 🟢 💻 DOS COMPUTADORES ANTIGOS AO MAINFRAME

Na época em que computadores pessoais ainda possuíam recursos extremamente limitados, sistemas corporativos já utilizavam processamento estruturado de grandes quantidades de informações.

Hoje temos:

```text
CPU MULTICORE
GB / TB DE RAM
SSD
CLOUD
CONTAINERS
KUBERNETES
MICROSERVICES
AI
```

Mas muitos ambientes corporativos continuam dependendo de:

```text
COBOL
JCL
z/OS
CICS
DB2
VSAM
JES
MAINFRAME
```

É justamente essa coexistência entre **tecnologias clássicas e modernas** que torna o estudo de Mainframe tão interessante.

---

# 🟢 🖥️ TECNOLOGIA

### Linguagem

```text
COBOL
```

### Compilador

```text
GNUCOBOL
```

### Ambiente

```text
OpenCobolIDE
```

### Persistência

```text
CLIENTES.DAT
TEMP.DAT
```

### Arquitetura

```text
Console Application
        +
File Processing
        +
CRUD
```

---

# 🟢 🚀 COMO EXECUTAR

Com o GnuCOBOL instalado:

```bash
cobc -x -free -o crud-clientes main.cob
```

Executar:

### Windows

```bash
crud-clientes.exe
```

### Linux

```bash
./crud-clientes
```

O arquivo:

```text
CLIENTES.DAT
```

será utilizado como base de dados do sistema.

---

# 🟢 📁 ESTRUTURA DO PROJETO

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

# 🟢 🎯 OBJETIVO DO PROJETO

Este projeto foi desenvolvido com objetivos educacionais e profissionais para demonstrar:

* Programação COBOL
* Processamento de arquivos
* Estruturas de dados
* CRUD
* Controle de fluxo
* Manipulação de registros
* Tratamento básico de arquivos
* Conceitos de sistemas legados
* Fundamentos relacionados ao ambiente Mainframe

---

# 🟢 🧑‍💻 AUTOR

## PAULO HENRIQUE

Desenvolvedor com foco em:

```text
🟢 COBOL
🟢 IBM Z / MAINFRAME
🟢 JAVA
🟢 SPRING BOOT
🟢 ANGULAR
🟢 CYBERSECURITY
🟢 INFRAESTRUTURA
```

---

# 🟢 🦖 LEGACY DOES NOT MEAN DEAD

```text
             🦖
            /|\
           / | \
          /  |  \
         /___|___\
            |
         COBOL
            |
    ┌───────┴────────┐
    │                │
 MAINFRAME        BUSINESS
    │                │
    └───────┬────────┘
            │
        BILLIONS
        OF RECORDS
```

> **Tecnologia antiga não significa tecnologia inútil.**

> Algumas das aplicações mais importantes do mundo continuam dependendo de sistemas construídos sobre tecnologias que começaram décadas atrás.

---

# 🟢 📚 PRÓXIMOS PASSOS

Possíveis evoluções deste projeto:

```text
[✓] CRUD básico
[✓] Arquivo sequencial
[✓] Inclusão
[✓] Consulta
[✓] Listagem
[✓] Alteração
[✓] Exclusão

[ ] Validação de CPF
[ ] Validação de telefone
[ ] Tratamento avançado de erros
[ ] VSAM KSDS
[ ] JCL
[ ] DB2
[ ] CICS
[ ] Integração com API
[ ] Ambiente IBM Z
```

---

# 🟢 🧩 CONCLUSÃO

Este projeto é uma demonstração de como é possível estudar **COBOL e conceitos de Mainframe** através de uma aplicação pequena, mas funcional.

O sistema utiliza uma abordagem simples para demonstrar conceitos fundamentais que continuam relevantes no desenvolvimento de sistemas empresariais:

```text
INPUT
  ↓
PROCESSAMENTO
  ↓
VALIDAÇÃO
  ↓
ARMAZENAMENTO
  ↓
CONSULTA
  ↓
ALTERAÇÃO
  ↓
EXCLUSÃO
```

```text
================================================
       COBOL CUSTOMER MANAGEMENT SYSTEM
================================================

             🦖 LEGACY COMPUTING
             💚 COBOL
             💚 MAINFRAME
             💚 GNUCOBOL
             💚 FILE PROCESSING

              >>> SYSTEM END <<<
================================================
```

<div align="center">

### 🦖💚 COBOL • MAINFRAME • LEGACY COMPUTING 💚🦖

**Built with COBOL by Paulo Henrique**

</div>
