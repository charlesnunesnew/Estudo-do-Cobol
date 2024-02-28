      ******************************************************************
      * Author:SIDINEY ARAÚJO
      * Date:12/02/2024
      * Purpose:CRIAR CADASTRO USUÁRIO
      * Tectonics: cobc
      ******************************************************************
           IDENTIFICATION DIVISION.
       PROGRAM-ID. CDCLIE.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADUSER ASSIGN TO
           "C:\COBOL\DESAFIO"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS FD-CD-USER
           FILE STATUS IS WS-FS-CADUSER.

       DATA DIVISION.
       FILE SECTION.
       FD CADUSER.
       01 REG-USER.
           03 FD-CD-USER                 PIC 9(6).
           03 FD-NM                      PIC X(100).
           03 FD-EMAIL                   PIC X(100).
           03 FD-PHONE                   PIC 9(12).
           03 FD-PASSWORD                PIC X(8).

       WORKING-STORAGE SECTION.
       77 WS-FS-CADUSER                  PIC 99.
        88 FS-CADUSER-OK                 VALUE 0.
       77 WS-OPCAO                       PIC X.
       01 CAD-USER.
           03 WS-CD-USER                 PIC 9(6).
           03 WS-NM                      PIC X(100).
           03 WS-EMAIL                   PIC X(100).
           03 WS-PHONE                   PIC 9(12).
           03 WS-PASSWORD                PIC X(8).
       77  PSC-VAZIASNOME                PIC 9(009) VALUE ZEROS.
       77  PSC-VAZIASEMAIL               PIC 9(009) VALUE ZEROS.
       77  PSC-VAZIASSUFEMAIL            PIC 9(009) VALUE ZEROS.
       77  PSC-VAZIASSENHA               PIC 9(009) VALUE ZEROS.
       77  TAM-STRINGNOME                PIC 9(009) VALUE ZEROS.
       77  TAM-STRINGEMAIL               PIC 9(009) VALUE ZEROS.
       77  TAM-STRINGSENHA               PIC 9(009) VALUE ZEROS.
       77  TAM-PREF-EMAIL                PIC 9(009) VALUE ZEROS.
       77 WS-TAMANHONOME                 PIC 999 VALUE 0.
       01 WS-NOMECOMPLETO.
           03 WS-PRIM-NOME               PIC X(20).
           03 WS-SEGU-NOME               PIC X(20).
           03 WS-TERC-NOME               PIC X(20).
       01 WS-EMAILCOMPLETO.
           03 WS-PRE-EMAIL               PIC X(30).
           03 WS-SUF-EMAIL               PIC X(30).
       01 WS-COUNT.
           03 WS-PONTEIRO                PIC 9(02) VALUE ZEROS.
           03 WS-TOT-CAMPOS              PIC 9(02) VALUE ZEROS.
           03 FL-EMAIL1                  PIC 9(02) VALUE ZEROS.
           03 FL-EMAIL2                  PIC 9(02) VALUE ZEROS.
           03 WS-TOTARROUBA              PIC 9(02) VALUE ZEROS.
       77 WRK-MSGERRO                    PIC X(50).
       77 WRK-TECLA                      PIC X(1).

       SCREEN SECTION.
       01 TELA.
            05 LIMPA-TELA.
                10 BLANK SCREEN.
                10 LINE 01 COLUMN 01 PIC X(20) ERASE EOL
                   BACKGROUND-COLOR 3.
                10 LINE 01 COLUMN 25 PIC X(20)
                   BACKGROUND-COLOR 3  FOREGROUND-COLOR 0
                              FROM 'SISTEMA DE CADASTRO DE USUARIOS'.
                10 LINE 02 COLUMN 01 PIC X(25) ERASE EOL.

       01 TELA-REGISTRO.
            05 CHAVE FOREGROUND-COLOR 2.
               10 LINE 10 COLUMN 10 VALUE 'CODIGO.: '.
               10 COLUMN PLUS 2 PIC 9(06) USING WS-CD-USER.
      *             BLANK WHEN ZEROS.
            05 SS-DADOS.
               10 LINE 12 COLUMN 10 VALUE 'NOME...: '.
               10 COLUMN PLUS 2 PIC X(100) USING WS-NM.
               10 LINE 14 COLUMN 10 VALUE 'EMAIL..: '.
               10 COLUMN PLUS 2 PIC X(100) USING WS-EMAIL.
               10 LINE 16 COLUMN 10 VALUE 'FONE...: '.
               10 COLUMN PLUS 2 PIC X(12) USING WS-PHONE.
               10 LINE 18 COLUMN 10 VALUE 'SENHA..: '.
               10 COLUMN PLUS 2 PIC X(8) USING WS-PASSWORD.
               10 LINE 20 COLUMN 15 VALUE 'OPCAO......: ' .
               10 LINE 20 COLUMN 28 USING WS-OPCAO.

       01 MOSTRA-ERRO.
             02 MSG-ERRO.
               10 LINE 22 COLUMN 01 ERASE EOL
                             BACKGROUND-COLOR 1.
               10 LINE 22 COLUMN 10 PIC X(50)
                             BACKGROUND-COLOR 4
                             FROM WRK-MSGERRO.
               10 COLUMN PLUS 2 PIC X(01)
                             BACKGROUND-COLOR 1
                             USING WRK-TECLA.

       01 TELA-CHAVEINVALIDA.
                05 DP-INVALIDKEY.
               10 LINE 22 COLUMN 10 VALUE 'CHAVE INVÁLIDA'.


       01 TELA-SUCESSO.
            05 DP-SUCESSO.
            10 LINE 22 COLUMN 10 VALUE 'CADASTRO REALIZADO COM SUCESSO'.



       01 OPCOES-FIM.
            10 LINE 24 COLUMN 10 VALUE '<F> PARA FINALIZAR'.
            10 LINE 26 COLUMN 10 VALUE '<1> PARA NOVO CADASTRO'.



       PROCEDURE DIVISION.



       0001-PRINCIPAL SECTION.
           PERFORM 1000-INICIAR THRU 1100-MONTATELA.
           PERFORM P200-CADASTRAR UNTIL WS-OPCAO = 'F'.
           PERFORM P200-FIM.
           STOP RUN.

       1000-INICIAR.
            OPEN I-O CADUSER
              IF WS-FS-CADUSER = 35 THEN
                  OPEN OUTPUT CADUSER
                  CLOSE CADUSER
                  OPEN I-O CADUSER
               END-IF.

       1100-MONTATELA.
            DISPLAY TELA.
            ACCEPT TELA-REGISTRO.



           INITIALIZE WS-COUNT.
           MOVE 1 TO WS-PONTEIRO.

       P200-CADASTRAR.

           INITIALIZE TAM-STRINGNOME.
           INITIALIZE TAM-STRINGEMAIL.
           INITIALIZE PSC-VAZIASNOME.
           INITIALIZE PSC-VAZIASEMAIL.

           IF WS-FS-CADUSER EQUAL 35 THEN
               OPEN OUTPUT CADUSER
           END-IF.

      ******** verificação do nome ************************
           UNSTRING WS-NM
               DELIMITED BY SPACE
               INTO WS-PRIM-NOME
                    WS-SEGU-NOME
                    WS-TERC-NOME
               WITH POINTER WS-PONTEIRO
               TALLYING IN WS-TOT-CAMPOS
           END-UNSTRING.

      **************** nome ********************************************
           INSPECT WS-NM TALLYING WS-TAMANHONOME FOR ALL " ".

           INSPECT FUNCTION REVERSE (WS-SEGU-NOME) TALLYING
             PSC-VAZIASNOME FOR LEADING SPACES.

           SUBTRACT LENGTH OF WS-SEGU-NOME
               FROM PSC-VAZIASNOME GIVING TAM-STRINGNOME.
      **************** nome ********************************************

      **************** email ********************************************
           INSPECT FUNCTION REVERSE (WS-EMAIL) TALLYING PSC-VAZIASEMAIL
              FOR LEADING SPACES.

           SUBTRACT LENGTH OF WS-EMAIL
               FROM PSC-VAZIASEMAIL GIVING TAM-STRINGEMAIL.

           UNSTRING WS-EMAIL
               DELIMITED BY "@"
               INTO WS-PRE-EMAIL
                    WS-SUF-EMAIL
           END-UNSTRING.

           INSPECT WS-EMAIL TALLYING FL-EMAIL1 FOR ALL "CAPGEMINI.COM".
           INSPECT WS-EMAIL TALLYING FL-EMAIL2 FOR ALL "BRADESCO.COM".

           INSPECT WS-EMAIL
             TALLYING WS-TOTARROUBA
               FOR ALL '@'

           INSPECT WS-EMAIL
             TALLYING TAM-PREF-EMAIL
             FOR CHARACTERS BEFORE "@"

      **************** email ********************************************

      **************** SENHA ********************************************
           INSPECT WS-PASSWORD
             TALLYING TAM-STRINGSENHA
             FOR CHARACTERS BEFORE SPACE

           INSPECT variável
             TALLYING contadorA FOR ALL “A”
             contadorE FOR ALL “E”
             contadorI FOR ALL “I”
             contadorO FOR ALL “O”
             contadorU FOR ALL “U”
      **************** SENHA ********************************************




             IF FS-CADUSER-OK THEN
               MOVE WS-CD-USER           TO FD-CD-USER
               MOVE WS-NM                TO FD-NM
               MOVE WS-EMAIL             TO FD-EMAIL
               MOVE WS-PHONE             TO FD-PHONE
               MOVE WS-PASSWORD          TO FD-PASSWORD


           IF TAM-STRINGNOME <= 1 THEN
               MOVE 'USUARIO DEVE TER SOBRENOME' TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
           ELSE
           IF TAM-STRINGEMAIL <=10 THEN
               MOVE 'EMAIL MINIMO 10 CHARACTERS' TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
           ELSE
           IF WS-TOTARROUBA IS NOT = 1 THEN
               MOVE 'E-MAIL INVALIDO-FALTA O @'
                 TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
           ELSE
           IF TAM-PREF-EMAIL < 1 THEN
              MOVE
           'DEVE HAVER PELO MENOS 1 CARACTER ANTES DO ARROBA'
                 TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
           ELSE
           IF FL-EMAIL1 IS NOT = 1 AND FL-EMAIL2 IS NOT = 1 THEN
               MOVE 'APENAS BRADESCO.COM E CAPGEMINI.COM'
                 TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
           ELSE
           IF TAM-STRINGSENHA < 8 THEN
              MOVE 'SENHA MINIMO 8 CHARACTERS' TO WRK-MSGERRO
               ACCEPT MOSTRA-ERRO
           ELSE
               WRITE REG-USER
                 INVALID KEY
                 MOVE 'JA EXISTE ' TO WRK-MSGERRO
                   ACCEPT MOSTRA-ERRO
                 NOT INVALID KEY
                 DISPLAY TELA-SUCESSO
              END-WRITE
           END-IF

           CLOSE CADUSER.

           DISPLAY OPCOES-FIM
           ACCEPT WS-OPCAO.

               IF WS-OPCAO EQUAL "F" THEN
                  PERFORM FINALIZAR
           ELSE
               IF WS-OPCAO EQUAL 1 THEN
                   PERFORM 1000-INICIAR.

       P200-FIM.

           FINALIZAR.
           CLOSE CADUSER.
       END PROGRAM CDCLIE.
