      ******************************************************************
      * Author: Charles Nunes
      * Date: 24/02/2024
      * Purpose: Calculo
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DESAFIOM1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  WRK-NUM1                    PIC 99.
       77  WRK-NUM2                    PIC 99.
       77  WRK-RESULT                  PIC 99.
       PROCEDURE DIVISION.
       P100-INICIO.
           PERFORM P200-CALCULO.
           PERFORM P999-FIM.
       P200-CALCULO.

           DISPLAY 'DIGITE O PRIMEIRO NUMERO: '
           ACCEPT WRK-NUM1

           DISPLAY 'DIGITE O SEGUNDO NUMERO: '
           ACCEPT WRK-NUM2

      *================= SOMA ===================
           COMPUTE WRK-RESULT = WRK-NUM1 + WRK-NUM2
              ON SIZE ERROR PERFORM P300-ERRO
           END-COMPUTE

           DISPLAY 'A SOMA E: ' WRK-RESULT.

      *================= SUBTRACAO ===================

           COMPUTE WRK-RESULT = WRK-NUM1 - WRK-NUM2
              ON SIZE ERROR PERFORM P300-ERRO
           END-COMPUTE

           DISPLAY 'A SUBTRACAO E: ' WRK-RESULT.

      *================= MULTIPLICACAO ===================

           COMPUTE WRK-RESULT = WRK-NUM1 * WRK-NUM2
              ON SIZE ERROR PERFORM P300-ERRO
           END-COMPUTE

           DISPLAY 'A MULTIPLICACAO E: ' WRK-RESULT.

      *================= DIVISAO ===================

           COMPUTE WRK-RESULT = WRK-NUM1 / WRK-NUM2
              ON SIZE ERROR PERFORM P300-ERRO
           END-COMPUTE

           DISPLAY 'A DIVISAO E: ' WRK-RESULT.

       P300-ERRO.
           DISPLAY 'ERRO NO CALCULO'
           PERFORM P999-FIM.

       P999-FIM.
            STOP RUN.
       END PROGRAM DESAFIOM1.
