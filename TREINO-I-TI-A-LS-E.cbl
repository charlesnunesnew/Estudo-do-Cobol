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
       01 WS-NOME.
           03 WS-PRIMEIRO-NOME        PIC X(5) VALUE 'SYDY'.
           03 FILLER                  PIC X(10) VALUE 'ARAUJO'.         ACRESCENTADO PARA O INITIALISE
           03 FILLLER                  PIC 9(03) VALUE 1.
      *     03 WS-ULTIMO-NOME          PIC X(10) VALUE 'ARAUJO'.
       PROCEDURE DIVISION.

            DISPLAY "SAIDA 1: "
            DISPLAY WS-NOME

            DISPLAY "SAIDA 2: "
            INITIALISE WS-NOME REPLACING ALPHANUMERIC BY SPACES                                          ACRESCENTADO PARA O INITIALISE
                                         NUMERIC      BY ZEROS.
            DISPLAY WS-NOME
            .
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
