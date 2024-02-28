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
       01 USUARIOS-REG.
            05 WS-IDUSUARIO           PIC 9(06).
            05 WS-EMAIL               PIC X(100).
            05 WS-NOME                PIC X(100).
            05 WS-SENHA               PIC X(8).
            05 WS-PHONE               PIC X(12).
       77 WS-TAMANHONOME              PIC 999 VALUE 0.
       77 WS-TEXTO                    PIC X(40) VALUE SPACES.
       77 WS-PONTEIRO                 PIC 9(02) VALUE ZEROS.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           INITIALIZE WS-NOME
                      WS-TEXTO

           MOVE 'CHARLES NUNES' TO WS-NOME.

           INSPECT WS-NOME TALLYING WS-TAMANHONOME FOR ALL
             BEFORE INITIAL " ".

           DISPLAY WS-TAMANHONOME.

           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
