      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRUD-CLIENTES.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  OPCAO              PIC 9 VALUE 9.
       01  CODIGO-BUSCA       PIC 9(5) VALUE 0.
       01  TOTAL-CLIENTES     PIC 99 VALUE 0.
       01  POSICAO            PIC 99 VALUE 0.
       01  ENCONTRADO         PIC X VALUE "N".
       01  CONFIRMA           PIC X VALUE "N".

       01  TABELA-CLIENTES.
       05  CLIENTE OCCURS 50 TIMES.
           10  CODIGO     PIC 9(5).
           10  NOME       PIC X(30).
           10  CPF        PIC X(11).
           10  TELEFONE   PIC X(15).

       PROCEDURE DIVISION.

       INICIO.

       PERFORM MENU

       STOP RUN.

       
       MENU.

       MOVE 9 TO OPCAO

       PERFORM UNTIL OPCAO = 0

           DISPLAY SPACE
           DISPLAY "=============================================="
           DISPLAY "          CRUD DE CLIENTES - COBOL"
           DISPLAY "=============================================="
           DISPLAY "[1] INCLUIR CLIENTE"
           DISPLAY "[2] CONSULTAR CLIENTE"
           DISPLAY "[3] LISTAR CLIENTES"
           DISPLAY "[4] EXCLUIR CLIENTE"
           DISPLAY "[0] SAIR"
           DISPLAY "=============================================="
           DISPLAY "OPCAO: " WITH NO ADVANCING
           ACCEPT OPCAO

           EVALUATE OPCAO
               WHEN 1
                   PERFORM INCLUIR
               WHEN 2
                   PERFORM CONSULTAR
               WHEN 3
                   PERFORM LISTAR
               WHEN 4
                   PERFORM EXCLUIR
               WHEN 0
                   DISPLAY "SISTEMA ENCERRADO."
               WHEN OTHER
                   DISPLAY "OPCAO INVALIDA."
           END-EVALUATE

           END-PERFORM.


       

           INCLUIR.

       IF TOTAL-CLIENTES = 50

           DISPLAY "LIMITE DE CLIENTES ATINGIDO."

       ELSE

           ADD 1 TO TOTAL-CLIENTES

           MOVE TOTAL-CLIENTES TO POSICAO

           DISPLAY SPACE
           DISPLAY "=============================================="
           DISPLAY "             INCLUIR CLIENTE"
           DISPLAY "=============================================="

           DISPLAY "Codigo: " WITH NO ADVANCING
           ACCEPT CODIGO (POSICAO)

           DISPLAY "Nome: " WITH NO ADVANCING
           ACCEPT NOME (POSICAO)

           DISPLAY "CPF: " WITH NO ADVANCING
           ACCEPT CPF (POSICAO)

           DISPLAY "Telefone: " WITH NO ADVANCING
           ACCEPT TELEFONE (POSICAO)

           DISPLAY SPACE
           DISPLAY "CLIENTE INCLUIDO COM SUCESSO."

           END-IF.


           CONSULTAR.

       DISPLAY SPACE
       DISPLAY "=============================================="
       DISPLAY "             CONSULTAR CLIENTE"
       DISPLAY "=============================================="

       DISPLAY "Codigo: " WITH NO ADVANCING
       ACCEPT CODIGO-BUSCA

       MOVE "N" TO ENCONTRADO
       MOVE 1 TO POSICAO

       PERFORM UNTIL POSICAO > TOTAL-CLIENTES

           IF CODIGO (POSICAO) = CODIGO-BUSCA

               MOVE "S" TO ENCONTRADO

               DISPLAY SPACE
               DISPLAY "CLIENTE ENCONTRADO"
               DISPLAY "----------------------------------------------"
               DISPLAY "CODIGO   : " CODIGO (POSICAO)
               DISPLAY "NOME     : " NOME (POSICAO)
               DISPLAY "CPF      : " CPF (POSICAO)
               DISPLAY "TELEFONE : " TELEFONE (POSICAO)
               DISPLAY "----------------------------------------------"

               MOVE TOTAL-CLIENTES TO POSICAO

           ELSE

               ADD 1 TO POSICAO

           END-IF

       END-PERFORM

       IF ENCONTRADO = "N"

           DISPLAY "CLIENTE NAO ENCONTRADO."

       END-IF.


       LISTAR.

       DISPLAY SPACE
       DISPLAY "=============================================="
       DISPLAY "             LISTA DE CLIENTES"
       DISPLAY "=============================================="

       IF TOTAL-CLIENTES = 0

           DISPLAY "NENHUM CLIENTE CADASTRADO."

       ELSE

           MOVE 1 TO POSICAO

           PERFORM UNTIL POSICAO > TOTAL-CLIENTES

               DISPLAY "----------------------------------------------"
               DISPLAY "CODIGO   : " CODIGO (POSICAO)
               DISPLAY "NOME     : " NOME (POSICAO)
               DISPLAY "CPF      : " CPF (POSICAO)
               DISPLAY "TELEFONE : " TELEFONE (POSICAO)

               ADD 1 TO POSICAO

           END-PERFORM

           DISPLAY "----------------------------------------------"

       END-IF.


       EXCLUIR.

       DISPLAY SPACE
       DISPLAY "=============================================="
       DISPLAY "             EXCLUIR CLIENTE"
       DISPLAY "=============================================="

       IF TOTAL-CLIENTES = 0

           DISPLAY "NENHUM CLIENTE CADASTRADO."

       ELSE

           DISPLAY "Codigo: " WITH NO ADVANCING
           ACCEPT CODIGO-BUSCA

           MOVE "N" TO ENCONTRADO
           MOVE 1 TO POSICAO

           PERFORM UNTIL POSICAO > TOTAL-CLIENTES

               IF CODIGO (POSICAO) = CODIGO-BUSCA

                   MOVE "S" TO ENCONTRADO

                   DISPLAY "CLIENTE ENCONTRADO."
                   DISPLAY "NOME: " NOME (POSICAO)

                   DISPLAY "CONFIRMAR EXCLUSAO? (S/N): "
                       WITH NO ADVANCING

                   ACCEPT CONFIRMA

                   IF CONFIRMA = "S" OR CONFIRMA = "s"

                       PERFORM REMOVER

                   ELSE

                       DISPLAY "EXCLUSAO CANCELADA."

                   END-IF

                   MOVE TOTAL-CLIENTES TO POSICAO

               ELSE

                   ADD 1 TO POSICAO

               END-IF

           END-PERFORM

           IF ENCONTRADO = "N"

               DISPLAY "CLIENTE NAO ENCONTRADO."

           END-IF

       END-IF.


       REMOVER.

       IF POSICAO < TOTAL-CLIENTES

           PERFORM VARYING POSICAO FROM POSICAO BY 1
               UNTIL POSICAO >= TOTAL-CLIENTES

               MOVE CODIGO (POSICAO + 1)
                   TO CODIGO (POSICAO)

               MOVE NOME (POSICAO + 1)
                   TO NOME (POSICAO)

               MOVE CPF (POSICAO + 1)
                   TO CPF (POSICAO)

               MOVE TELEFONE (POSICAO + 1)
                   TO TELEFONE (POSICAO)

           END-PERFORM

       END-IF

       MOVE ZERO TO CODIGO (TOTAL-CLIENTES)
       MOVE SPACES TO NOME (TOTAL-CLIENTES)
       MOVE SPACES TO CPF (TOTAL-CLIENTES)
       MOVE SPACES TO TELEFONE (TOTAL-CLIENTES)

       SUBTRACT 1 FROM TOTAL-CLIENTES

       DISPLAY "CLIENTE EXCLUIDO COM SUCESSO.".
```
