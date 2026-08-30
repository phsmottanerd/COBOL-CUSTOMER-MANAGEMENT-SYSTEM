

       IDENTIFICATION DIVISION.



       PROGRAM-ID. CRUD-CLIENTES.



      *============================================================*



      *              CRUD DE CLIENTES - COBOL                     *



      *                                                            *



      *  AUTOR      : PAULO HENRIQUE                              *



      *  PROJETO    : CRUD CLIENT MANAGEMENT SYSTEM               *



      *  TECNOLOGIA : GNUCOBOL                                    *



      *                                                            *



      *  OPERACOES : INCLUIR | CONSULTAR | LISTAR | EXCLUIR       *



      *============================================================*



       ENVIRONMENT DIVISION.



       INPUT-OUTPUT SECTION.



       FILE-CONTROL.



       SELECT CLIENTES



           ASSIGN TO "CLIENTES.DAT"



           ORGANIZATION IS LINE SEQUENTIAL



           FILE STATUS IS WS-FILE-STATUS.



       SELECT TEMP



           ASSIGN TO "TEMP.DAT"



           ORGANIZATION IS LINE SEQUENTIAL



            FILE STATUS IS WS-TEMP-STATUS.



           DATA DIVISION.



            FILE SECTION.



       FD  CLIENTES.



       01  CLIENTE.



       05 CODIGO       PIC 9(05).



       05 NOME         PIC X(30).



       05 CPF          PIC X(11).



       05 TELEFONE     PIC X(15).



       FD  TEMP.



       01  CLIENTE-TEMP.



       05 TEMP-CODIGO   PIC 9(05).



       05 TEMP-NOME     PIC X(30).



       05 TEMP-CPF      PIC X(11).



       05 TEMP-TELEFONE PIC X(15).



       WORKING-STORAGE SECTION.



       01  OPCAO            PIC 9 VALUE 9.



       01  CODIGO-BUSCA     PIC 9(05) VALUE 0.



       01  FIM              PIC X VALUE "N".



       01  ENCONTRADO       PIC X VALUE "N".



       01  CONFIRMA         PIC X VALUE "N".



       01  WS-FILE-STATUS   PIC XX VALUE SPACES.



       01  WS-TEMP-STATUS   PIC XX VALUE SPACES.



           PROCEDURE DIVISION.



           INICIO.



       PERFORM CRIAR-ARQUIVO



       PERFORM MENU



       STOP RUN.





      *============================================================*



      *                    CRIAR ARQUIVO                           *



      *============================================================*



           CRIAR-ARQUIVO.



       OPEN INPUT CLIENTES



       IF WS-FILE-STATUS = "35"



           CLOSE CLIENTES



           OPEN OUTPUT CLIENTES



           IF WS-FILE-STATUS = "00"



               CLOSE CLIENTES



           ELSE



               DISPLAY "ERRO AO CRIAR CLIENTES.DAT."



               DISPLAY "STATUS: " WS-FILE-STATUS



           END-IF



       ELSE



           IF WS-FILE-STATUS = "00"



               CLOSE CLIENTES



           ELSE



               DISPLAY "ERRO AO ABRIR CLIENTES.DAT."



               DISPLAY "STATUS: " WS-FILE-STATUS



           END-IF



       END-IF.





      *============================================================*



      *                         MENU                               *



      *============================================================*



           MENU.



       PERFORM UNTIL OPCAO = 0



           DISPLAY SPACE



           DISPLAY "=============================================="



           DISPLAY "           CRUD DE CLIENTES - COBOL"



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





      *============================================================*



      *                         INCLUIR                            *



      *============================================================*



       INCLUIR.



       DISPLAY SPACE



       DISPLAY "----------- INCLUIR CLIENTE -----------"



       DISPLAY "Codigo: " WITH NO ADVANCING



       ACCEPT CODIGO



       MOVE CODIGO TO CODIGO-BUSCA



       PERFORM VERIFICAR-CODIGO



       IF ENCONTRADO = "S"



           DISPLAY "ERRO: CODIGO JA CADASTRADO."



       ELSE



           DISPLAY "Nome: " WITH NO ADVANCING



           ACCEPT NOME



           DISPLAY "CPF: " WITH NO ADVANCING



           ACCEPT CPF



           DISPLAY "Telefone: " WITH NO ADVANCING



           ACCEPT TELEFONE



           OPEN EXTEND CLIENTES



           IF WS-FILE-STATUS = "00"



               WRITE CLIENTE



               IF WS-FILE-STATUS = "00"



                   DISPLAY "CLIENTE INCLUIDO COM SUCESSO."



               ELSE



                   DISPLAY "ERRO AO GRAVAR CLIENTE."



                   DISPLAY "STATUS: " WS-FILE-STATUS



               END-IF



               CLOSE CLIENTES



           ELSE



               DISPLAY "ERRO AO ABRIR CLIENTES.DAT."



               DISPLAY "STATUS: " WS-FILE-STATUS



           END-IF



       END-IF.





      *============================================================*



      *                    VERIFICAR CODIGO                        *



      *============================================================*



       VERIFICAR-CODIGO.



       MOVE "N" TO ENCONTRADO



       MOVE "N" TO FIM



       OPEN INPUT CLIENTES



       IF WS-FILE-STATUS = "00"



           PERFORM UNTIL FIM = "S"



               READ CLIENTES



                   AT END



                       MOVE "S" TO FIM



                   NOT AT END



                       IF CODIGO = CODIGO-BUSCA



                           MOVE "S" TO ENCONTRADO



                           MOVE "S" TO FIM



                       END-IF



               END-READ



           END-PERFORM



           CLOSE CLIENTES



       END-IF.





      *============================================================*



      *                       CONSULTAR                            *



      *============================================================*



       CONSULTAR.



       DISPLAY SPACE



       DISPLAY "----------- CONSULTAR CLIENTE -----------"



       DISPLAY "Codigo: " WITH NO ADVANCING



       ACCEPT CODIGO-BUSCA



       MOVE "N" TO ENCONTRADO



       MOVE "N" TO FIM



       OPEN INPUT CLIENTES



       IF WS-FILE-STATUS = "00"



           PERFORM UNTIL FIM = "S"



               READ CLIENTES



                   AT END



                       MOVE "S" TO FIM



                   NOT AT END



                       IF CODIGO = CODIGO-BUSCA



                           MOVE "S" TO ENCONTRADO



                           DISPLAY SPACE



                           DISPLAY "Codigo   : " CODIGO



                           DISPLAY "Nome     : " NOME



                           DISPLAY "CPF      : " CPF



                           DISPLAY "Telefone : " TELEFONE



                           MOVE "S" TO FIM



                       END-IF



               END-READ



           END-PERFORM



           CLOSE CLIENTES



       ELSE



           DISPLAY "ERRO AO ABRIR CLIENTES.DAT."



           DISPLAY "STATUS: " WS-FILE-STATUS



       END-IF



       IF ENCONTRADO = "N"



           DISPLAY "CLIENTE NAO ENCONTRADO."



       END-IF.





      *============================================================*



      *                         LISTAR                             *



      *============================================================*



       LISTAR.



       DISPLAY SPACE



       DISPLAY "----------- LISTA DE CLIENTES -----------"



       DISPLAY "CODIGO | NOME | CPF | TELEFONE"



       DISPLAY "------------------------------------------"



       MOVE "N" TO FIM



       OPEN INPUT CLIENTES



       IF WS-FILE-STATUS = "00"



           PERFORM UNTIL FIM = "S"



               READ CLIENTES



                   AT END



                       MOVE "S" TO FIM



                   NOT AT END



                       DISPLAY CODIGO



                           " | "



                           NOME



                           " | "



                           CPF



                           " | "



                           TELEFONE



               END-READ



           END-PERFORM



           CLOSE CLIENTES



       ELSE



           DISPLAY "ERRO AO ABRIR CLIENTES.DAT."



           DISPLAY "STATUS: " WS-FILE-STATUS



       END-IF.





      *============================================================*



      *                         EXCLUIR                            *



      *============================================================*



       EXCLUIR.



       DISPLAY SPACE



       DISPLAY "----------- EXCLUIR CLIENTE -----------"



       DISPLAY "Codigo: " WITH NO ADVANCING



       ACCEPT CODIGO-BUSCA



       MOVE "N" TO ENCONTRADO



       MOVE "N" TO FIM



       OPEN INPUT CLIENTES



       IF WS-FILE-STATUS = "00"



           PERFORM UNTIL FIM = "S"



               READ CLIENTES



                   AT END



                       MOVE "S" TO FIM



                   NOT AT END



                       IF CODIGO = CODIGO-BUSCA



                           MOVE "S" TO ENCONTRADO



                           MOVE "S" TO FIM



                       END-IF



               END-READ



           END-PERFORM



           CLOSE CLIENTES



       END-IF



       IF ENCONTRADO = "N"



           DISPLAY "CLIENTE NAO ENCONTRADO."



       ELSE



           DISPLAY "Confirmar exclusao? (S/N): "



               WITH NO ADVANCING



           ACCEPT CONFIRMA



           IF CONFIRMA = "S"



              OR CONFIRMA = "s"



               PERFORM REMOVER-CLIENTE



           ELSE



               DISPLAY "EXCLUSAO CANCELADA."



           END-IF



       END-IF.





      *============================================================*



      *                    REMOVER CLIENTE                         *



      *============================================================*



       REMOVER-CLIENTE.



       MOVE "N" TO FIM



       OPEN INPUT CLIENTES



       OPEN OUTPUT TEMP



       IF WS-FILE-STATUS = "00"



          AND WS-TEMP-STATUS = "00"



           PERFORM UNTIL FIM = "S"



               READ CLIENTES



                   AT END



                       MOVE "S" TO FIM



                   NOT AT END



                       IF CODIGO NOT = CODIGO-BUSCA



                           MOVE CODIGO



                               TO TEMP-CODIGO



                           MOVE NOME



                               TO TEMP-NOME



                           MOVE CPF



                               TO TEMP-CPF



                           MOVE TELEFONE



                               TO TEMP-TELEFONE



                           WRITE CLIENTE-TEMP



                       END-IF



               END-READ



           END-PERFORM



           CLOSE CLIENTES



           CLOSE TEMP



           PERFORM RECRIAR-ARQUIVO



       ELSE



           DISPLAY "ERRO AO PROCESSAR EXCLUSAO."



           DISPLAY "STATUS CLIENTES: " WS-FILE-STATUS



           DISPLAY "STATUS TEMP: " WS-TEMP-STATUS



           CLOSE CLIENTES



           CLOSE TEMP



       END-IF.





      *============================================================*



      *                    RECRIAR ARQUIVO                         *



      *============================================================*



       RECRIAR-ARQUIVO.



       MOVE "N" TO FIM



       OPEN INPUT TEMP



       OPEN OUTPUT CLIENTES



       IF WS-TEMP-STATUS = "00"



          AND WS-FILE-STATUS = "00"



           PERFORM UNTIL FIM = "S"



               READ TEMP



                   AT END



                       MOVE "S" TO FIM



                   NOT AT END



                       MOVE TEMP-CODIGO



                           TO CODIGO



                       MOVE TEMP-NOME



                           TO NOME



                       MOVE TEMP-CPF



                           TO CPF



                       MOVE TEMP-TELEFONE



                           TO TELEFONE



                       WRITE CLIENTE



               END-READ



           END-PERFORM



           CLOSE TEMP



           CLOSE CLIENTES



           DISPLAY "CLIENTE EXCLUIDO COM SUCESSO."



       ELSE



           DISPLAY "ERRO AO RECRIAR CLIENTES.DAT."



           DISPLAY "STATUS CLIENTES: " WS-FILE-STATUS



           DISPLAY "STATUS TEMP: " WS-TEMP-STATUS



           CLOSE TEMP



           CLOSE CLIENTES



       END-IF.



```
