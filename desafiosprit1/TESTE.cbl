      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-VARIAVEIS.
           03 WS-COUNT         PIC 99.
           03 WS-TOT           PIC 99.
           03 WS-IND           PIC 99.
           03 CONTADOR         PIC 99.
           03 CARACTER                   PIC X(01).
           03 WS-TOTARROUBA              PIC 9(02) VALUE ZEROS.
           03 WS-TOT-MAIUSC              PIC 9(02) VALUE ZEROS.
           03 WS-TOT-MINUSC              PIC 9(02) VALUE ZEROS.
           03 WS-TOT-NUMERO              PIC 9(02) VALUE ZEROS.

       77 WS-PASSWORD   PIC X(8) VALUE 'aA345678'.
       77 WRK-MSGERRO                    PIC X(50).

       PROCEDURE DIVISION.
       P100-INICIO.
           INITIALIZE WS-VARIAVEIS.
           PERFORM 2000-VALIDARSENHA THRU 2001-FIMVALIDASENHA 7 TIMES.

       P300-PROCESSA-1.
           ADD 1 TO WS-COUNT
           DISPLAY 'WS-COUNT: ' WS-COUNT.
       P300-FIM.

       2000-VALIDARSENHA.
           IF CONTADOR >= 1 AND CONTADOR <=8
                MOVE WS-PASSWORD(CONTADOR:1) TO CARACTER
                MOVE CONTADOR
                 TO WRK-MSGERRO
                 DISPLAY 'CONTADOR: ' WRK-MSGERRO 'CHAR ' CARACTER
            END-IF

           IF CARACTER IS ALPHABETIC-LOWER
                 ADD 1 TO WS-TOT-MINUSC
                 MOVE CONTADOR
                 TO WRK-MSGERRO
                 DISPLAY 'MINUSCULO: ' WRK-MSGERRO 'CHAR ' CARACTER
             ELSE IF CARACTER IS NUMERIC
                 ADD 1 TO WS-TOT-NUMERO
                 MOVE CONTADOR
                 TO WRK-MSGERRO
                 DISPLAY 'NUMERICO: 'WRK-MSGERRO 'CHAR ' CARACTER
            ELSE IF CARACTER IS ALPHABETIC-UPPER
                 ADD 1 TO WS-TOT-MAIUSC
                 MOVE CONTADOR
                 TO WRK-MSGERRO
               DISPLAY 'MAIUSCULO: ' WRK-MSGERRO 'CHAR ' CARACTER
            END-IF.
            ADD 1 TO CONTADOR.
       2001-FIMVALIDASENHA.

       P900-FINALIZA.
           STOP RUN.


       END PROGRAM YOUR-PROGRAM-NAME.
