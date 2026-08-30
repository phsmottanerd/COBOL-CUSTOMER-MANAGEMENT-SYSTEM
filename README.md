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

       <div align="center">

<h1 style="color:#00FF00;">🦖 COBOL CUSTOMER MANAGEMENT SYSTEM</h1>

<p style="color:#00FF00;">
💻 CRUD DE CLIENTES — GNUCOBOL
</p>

<p style="color:#00FF00;">
Sistema de gerenciamento de clientes desenvolvido em COBOL,
utilizando GNUCOBOL e processamento de arquivos.
</p>

</div>

<hr>

<h2 style="color:#00FF00;">🖥️ DESCRIÇÃO DO PROJETO</h2>

<p style="color:#00FF00;">
Este projeto é um CRUD de gerenciamento de clientes desenvolvido
em COBOL. A aplicação permite incluir, consultar, listar, alterar
e excluir clientes utilizando arquivos como forma de persistência
dos dados.
</p>

<p style="color:#00FF00;">
O objetivo é praticar conceitos fundamentais da linguagem COBOL,
processamento sequencial de arquivos, estruturas de dados,
controle de fluxo e operações de entrada e saída.
</p>

<h2 style="color:#00FF00;">🦖 O QUE É COBOL?</h2>

<p style="color:#00FF00;">
COBOL significa Common Business-Oriented Language e é uma linguagem
voltada principalmente para processamento de informações empresariais.
A linguagem possui uma longa história dentro dos ambientes corporativos
e de Mainframe.
</p>

<h2 style="color:#00FF00;">💾 FUNCIONALIDADES</h2>

<p style="color:#00FF00;">
🟢 CREATE — INCLUIR CLIENTE<br>
🔎 READ — CONSULTAR CLIENTE<br>
📋 READ — LISTAR CLIENTES<br>
✏️ UPDATE — ALTERAR CLIENTE<br>
🗑️ DELETE — EXCLUIR CLIENTE
</p>

<h2 style="color:#00FF00;">🟢 INCLUIR CLIENTE</h2>

<p style="color:#00FF00;">
Permite cadastrar um novo cliente informando código, nome, CPF
e telefone. Antes da gravação, o sistema verifica se o código
já está cadastrado.
</p>

<h2 style="color:#00FF00;">🔎 CONSULTAR CLIENTE</h2>

<p style="color:#00FF00;">
A consulta recebe o código do cliente e percorre o arquivo
CLIENTES.DAT até localizar o registro correspondente.
</p>

<h2 style="color:#00FF00;">📋 LISTAR CLIENTES</h2>

<p style="color:#00FF00;">
A opção listar realiza uma leitura sequencial do arquivo
CLIENTES.DAT e apresenta todos os clientes cadastrados.
</p>

<h2 style="color:#00FF00;">✏️ ALTERAR CLIENTE</h2>

<p style="color:#00FF00;">
A alteração utiliza um arquivo temporário para reconstruir os
registros e preservar os dados que não foram modificados.
</p>

<h2 style="color:#00FF00;">🗑️ EXCLUIR CLIENTE</h2>

<p style="color:#00FF00;">
A exclusão percorre os registros do arquivo principal e copia
para TEMP.DAT somente os registros que devem permanecer.
Depois disso, o arquivo CLIENTES.DAT é reconstruído.
</p>

<h2 style="color:#00FF00;">💽 ARQUIVOS</h2>

<p style="color:#00FF00;">
📁 CLIENTES.DAT — arquivo principal dos clientes.<br>
📁 TEMP.DAT — arquivo temporário utilizado durante o processamento.
</p>

<h2 style="color:#00FF00;">🧬 ESTRUTURA DO REGISTRO</h2>

```cobol
01 CLIENTE.
    05 CODIGO       PIC 9(05).
    05 NOME         PIC X(30).
    05 CPF          PIC X(11).
    05 TELEFONE     PIC X(15).
