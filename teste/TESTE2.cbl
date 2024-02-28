      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCOMM.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 WS-NOME-COMPLETO                     PIC X(30) VALUE SPACES.
       01 WS-NOME.
          03 WS-PRIM-NOME                      PIC X(10) VALUE SPACES.
          03 WS-NOME-MEIO                      PIC X(10) VALUE SPACES.
          03 WS-ULTI-NOME                      PIC X(10) VALUE SPACES.
       77 WS-MOSTRA                            PIC X(50) VALUE SPACES.
       01 WS-COUNT.
          03 WS-PONTEIRO                       PIC 9(02) VALUE ZEROS.
       PROCEDURE DIVISION.

      *********************************FORMA 1 *************************
            INITIALIZE WS-NOME-COMPLETO
                       WS-NOME
                       WS-MOSTRA


            MOVE 'MARIO CEZAR CASTRO'            TO WS-NOME-COMPLETO

            UNSTRING
               WS-NOME-COMPLETO
               DELIMITED BY SPACES
               INTO    WS-PRIM-NOME
                       WS-NOME-MEIO
                       WS-ULTI-NOME
            END-UNSTRING.

            DISPLAY 'PRIMEIRO NOME: ' WS-PRIM-NOME
            DISPLAY 'NOME DO MEIO: ' WS-NOME-MEIO
            DISPLAY 'ULTIMO NOME: ' WS-ULTI-NOME

      *********************************FORMA 2 *************************
            INITIALIZE WS-NOME-COMPLETO
                       WS-NOME
                       WS-MOSTRA
                       WS-COUNT

            MOVE 'MARIO CEZAR CASTRO'            TO WS-NOME-COMPLETO
            MOVE 1                               TO WS-PONTEIRO


            UNSTRING
               WS-NOME-COMPLETO
               DELIMITED BY SPACES
               INTO    WS-PRIM-NOME
                       WS-NOME-MEIO
                       WS-ULTI-NOME
               WITH POINTER WS-PONTEIRO
            END-UNSTRING.

            DISPLAY 'PRIMEIRO NOME: ' WS-PRIM-NOME
            DISPLAY 'NOME DO MEIO: ' WS-NOME-MEIO
            DISPLAY 'ULTIMO NOME: ' WS-ULTI-NOME
            DISPLAY 'PONTEIRO: ' WS-PONTEIRO
            STOP RUN.
       END PROGRAM PROGCOMM.
