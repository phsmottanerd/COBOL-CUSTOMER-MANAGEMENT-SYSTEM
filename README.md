<div align="center">

<pre>
 ██████╗ ██████╗ ██████╗  ██████╗ ██╗     
██╔════╝██╔═══██╗██╔══██╗██╔═══██╗██║     
██║     ██║   ██║██████╔╝██║   ██║██║     
██║     ██║   ██║██╔══██╗██║   ██║██║     
╚██████╗╚██████╔╝██████╔╝╚██████╔╝███████╗
 ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝

        ██████╗ ██████╗  ██████╗ ██╗     
       ██╔════╝██╔═══██╗██╔══██╗██║     
       ██║     ██║   ██║██████╔╝██║     
       ██║     ██║   ██║██╔══██╗██║     
       ╚██████╗╚██████╔╝██████╔╝███████╗
        ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝

             🦖 LEGACY COMPUTING 🦖
              >>> SYSTEM ONLINE <<<
</pre>

<font color="#00FF41">

# 🦖 CRUD DE CLIENTES — COBOL

### 💾 COBOL CUSTOMER MANAGEMENT SYSTEM

**Sistema de gerenciamento de clientes desenvolvido em COBOL com GNUCOBOL**

</font>

</div>

---

<div style="color:#00FF41">

## 🦖 SOBRE O PROJETO

Este projeto apresenta um **CRUD completo de clientes desenvolvido em COBOL**, utilizando processamento de arquivos sequenciais.

A aplicação foi construída com o objetivo de praticar conceitos fundamentais da linguagem COBOL e compreender como sistemas tradicionais de processamento de dados são estruturados.

O projeto trabalha diretamente com arquivos, registros, leitura sequencial, gravação, alteração e exclusão de dados.

A ideia é reproduzir, em um ambiente de estudo moderno, uma pequena aplicação empresarial utilizando conceitos que fazem parte da história da computação corporativa.

---

## 💚 O QUE É COBOL?

**COBOL — Common Business-Oriented Language** — é uma linguagem criada para aplicações voltadas ao processamento de informações empresariais.

Durante décadas, COBOL foi utilizado em sistemas críticos responsáveis por processar grandes quantidades de informações.

Enquanto a tecnologia evoluiu de computadores antigos para servidores modernos, cloud e inteligência artificial, muitos sistemas corporativos continuaram utilizando COBOL.

Por isso, estudar COBOL também significa compreender uma parte importante da evolução da computação.

---

## 🦖💻 DOS COMPUTADORES ANTIGOS AO MAINFRAME

Imagine a evolução:

🦖 **Computadores de grande porte**

⬇️

🦖 **Mainframes**

⬇️

🦖 **COBOL**

⬇️

💾 **Arquivos e processamento batch**

⬇️

💻 **Computadores pessoais**

⬇️

🌐 **Internet**

⬇️

☁️ **Cloud Computing**

⬇️

🐳 **Containers**

⬇️

🤖 **Inteligência Artificial**

Mesmo com toda essa evolução, conceitos como **processamento de dados, registros, arquivos, regras de negócio e transações** continuam existindo.

---

## 💾 FUNCIONALIDADES

O sistema possui as operações básicas de um CRUD:

### 🟢 CREATE — INCLUIR

Permite cadastrar um novo cliente.

O usuário informa:

* Código
* Nome
* CPF
* Telefone

Antes da gravação, o programa verifica se o código já existe.

---

### 🔎 READ — CONSULTAR

Permite pesquisar um cliente através do código.

O programa abre o arquivo `CLIENTES.DAT`, percorre os registros e procura o código informado.

Quando encontra o registro, os dados são apresentados na tela.

---

### 📋 READ — LISTAR

A opção listar percorre todos os registros existentes no arquivo.

Cada cliente é lido sequencialmente até que o programa alcance o final do arquivo.

---

### ✏️ UPDATE — ALTERAR

A alteração utiliza um arquivo temporário.

O programa lê os registros existentes e cria uma nova versão dos dados, substituindo as informações do cliente selecionado.

Fluxo:

**CLIENTES.DAT**

⬇️

**LEITURA DOS REGISTROS**

⬇️

**TEMP.DAT**

⬇️

**ALTERAÇÃO**

⬇️

**NOVO CLIENTES.DAT**

---

### 🗑️ DELETE — EXCLUIR

A exclusão utiliza o mesmo conceito de processamento através de arquivo temporário.

O programa percorre os registros.

O cliente selecionado não é copiado para o arquivo temporário.

Os demais clientes são preservados.

Depois disso, o arquivo principal é reconstruído.

---

## 🧠 COMO O SISTEMA FUNCIONA

O fluxo principal da aplicação é:

**INÍCIO**

⬇️

**CRIAR / VERIFICAR CLIENTES.DAT**

⬇️

**MENU PRINCIPAL**

⬇️

**OPERAÇÃO DO USUÁRIO**

⬇️

**PROCESSAMENTO**

⬇️

**CLIENTES.DAT**

---

## 🖥️ MENU DO SISTEMA

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

## 💾 ARQUIVOS DO SISTEMA

O projeto utiliza dois arquivos principais.

### 📁 CLIENTES.DAT

É o arquivo principal utilizado para armazenar os clientes.

Cada registro possui:

* Código
* Nome
* CPF
* Telefone

### 📁 TEMP.DAT

É utilizado como arquivo temporário durante operações de alteração e exclusão.

---

## 🧬 ESTRUTURA DOS DADOS

O registro principal possui a seguinte estrutura:

```cobol
01 CLIENTE.
    05 CODIGO       PIC 9(5).
    05 NOME         PIC X(30).
    05 CPF          PIC X(11).
    05 TELEFONE     PIC X(15).
```

Essa estrutura demonstra uma característica importante do COBOL: os dados são definidos através de estruturas hierárquicas e campos com tamanho determinado.

---

## 🟢 PROCESSAMENTO SEQUENCIAL

O projeto utiliza:

```text
ORGANIZATION IS LINE SEQUENTIAL
```

Isso significa que os registros são armazenados sequencialmente.

O programa utiliza operações como:

```text
OPEN
READ
WRITE
CLOSE
```

O fluxo de leitura pode ser representado como:

**OPEN**

⬇️

**READ**

⬇️

**PROCESSAMENTO**

⬇️

**READ**

⬇️

**AT END**

⬇️

**CLOSE**

Esse modelo de processamento é um dos conceitos fundamentais para compreender aplicações COBOL baseadas em arquivos.

---

## 🦖 COBOL E MAINFRAME

Este projeto não é um emulador de Mainframe e não pretende substituir um ambiente IBM Z.

O objetivo é utilizar **GNUCOBOL** para estudar a linguagem e conceitos que também aparecem no universo Mainframe.

No ambiente corporativo, COBOL pode trabalhar junto com tecnologias como:

```text
COBOL
JCL
z/OS
CICS
DB2
VSAM
JES
IBM Z
```

O estudo deste pequeno CRUD é, portanto, uma porta de entrada para conceitos maiores relacionados ao desenvolvimento de sistemas corporativos e Mainframe.

---

## 💻 TECNOLOGIAS

| Tecnologia         | Utilização                  |
| ------------------ | --------------------------- |
| 🟢 COBOL           | Linguagem principal         |
| 🟢 GNUCOBOL        | Compilação e execução       |
| 🟢 OpenCobolIDE    | Ambiente de desenvolvimento |
| 🟢 File Processing | Persistência dos dados      |
| 🟢 LINE SEQUENTIAL | Organização dos arquivos    |

---

## 🧩 CONCEITOS COBOL PRATICADOS

Este projeto utiliza:

🟢 `IDENTIFICATION DIVISION`

🟢 `ENVIRONMENT DIVISION`

🟢 `DATA DIVISION`

🟢 `FILE SECTION`

🟢 `WORKING-STORAGE SECTION`

🟢 `PROCEDURE DIVISION`

🟢 `FILE-CONTROL`

🟢 `FD`

🟢 `PIC`

🟢 `FILE STATUS`

🟢 `OPEN`

🟢 `READ`

🟢 `WRITE`

🟢 `CLOSE`

🟢 `EXTEND`

🟢 `PERFORM`

🟢 `IF`

🟢 `EVALUATE`

🟢 `ACCEPT`

🟢 `DISPLAY`

🟢 `AT END`

---

## 🦖 POR QUE UM CRUD EM COBOL?

Um CRUD parece simples.

Mas, neste projeto, ele permite estudar vários conceitos importantes simultaneamente.

Ao implementar:

**INCLUIR**

**CONSULTAR**

**LISTAR**

**ALTERAR**

**EXCLUIR**

é possível entender:

* Estrutura de dados
* Persistência
* Processamento sequencial
* Validação
* Controle de fluxo
* Leitura de arquivos
* Gravação de registros
* Manipulação de arquivos temporários
* Organização de programas COBOL

---

## 🧱 ARQUITETURA DO PROJETO

```text
                🦖 COBOL APPLICATION
                         │
                         ▼
                 ┌───────────────┐
                 │     MENU      │
                 └───────┬───────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
    INCLUIR          CONSULTAR         LISTAR
        │                │                │
        └────────────────┼────────────────┘
                         │
                ┌────────┴────────┐
                │                 │
                ▼                 ▼
             ALTERAR           EXCLUIR
                │                 │
                └────────┬────────┘
                         ▼
                   CLIENTES.DAT
                         │
                         ▼
                     TEMP.DAT
```

---

## 📁 ESTRUTURA DO REPOSITÓRIO

```text
CRUD-CLIENTES/
│
├── main.cob
├── CLIENTES.DAT
├── TEMP.DAT
└── README.md
```

---

## ⚙️ COMO EXECUTAR

Com o GNUCOBOL instalado, o programa pode ser compilado com:

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

## 🧪 EXEMPLO DE UTILIZAÇÃO

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

OPCAO: 1

----------- INCLUIR CLIENTE -----------

Codigo: 00001
Nome: PAULO HENRIQUE
CPF: 12345678901
Telefone: 21999999999

CLIENTE INCLUIDO COM SUCESSO.
```

Depois:

```text
OPCAO: 3

----------- LISTA DE CLIENTES -----------

CODIGO | NOME | CPF | TELEFONE

00001 | PAULO HENRIQUE | 12345678901 | 21999999999
```

---

## 🦖💚 LEGACY COMPUTING

Existe uma diferença importante entre **tecnologia antiga** e **tecnologia sem valor**.

COBOL pertence à história da computação empresarial e continua sendo relevante para compreender sistemas corporativos, processamento de dados e ambientes Mainframe.

Este projeto representa justamente essa ponte:

```text
🦖 TECNOLOGIA CLÁSSICA
          +
💻 DESENVOLVIMENTO ATUAL
          =
🟢 ESTUDO DE MAINFRAME E COBOL
```

---

## 🚀 PRÓXIMOS PASSOS

Este CRUD pode evoluir para um ambiente mais próximo de aplicações Mainframe:

```text
[✓] CRUD DE CLIENTES
[✓] ARQUIVO SEQUENCIAL
[✓] INCLUSÃO
[✓] CONSULTA
[✓] LISTAGEM
[✓] ALTERAÇÃO
[✓] EXCLUSÃO

[ ] VSAM KSDS
[ ] JCL
[ ] DB2
[ ] CICS
[ ] z/OS
[ ] IBM Z
[ ] PROCESSAMENTO BATCH
[ ] INTEGRAÇÃO COM SISTEMAS MODERNOS
```

---

## 👨‍💻 AUTOR

### PAULO HENRIQUE

Projeto desenvolvido como parte dos estudos práticos em:

🟢 **COBOL**

🟢 **Mainframe**

🟢 **IBM Z**

🟢 **Programação de sistemas corporativos**

🟢 **Tecnologias Legacy**

---

## 🦖💚 FINAL

```text
======================================================

       COBOL CUSTOMER MANAGEMENT SYSTEM

       🦖 LEGACY COMPUTING
       💾 FILE PROCESSING
       🟢 COBOL
       🟢 GNUCOBOL
       🟢 MAINFRAME

              >>> SYSTEM ONLINE <<<

======================================================
```

<font color="#00FF41">

### 🦖 COBOL NÃO É APENAS HISTÓRIA.

### É PARTE DA EVOLUÇÃO DA COMPUTAÇÃO EMPRESARIAL.

### 💚 CODE • LEGACY • MAINFRAME • FUTURE 💚

</font>

</div>
