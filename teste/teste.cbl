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
       77 WS-RESULT        PIC 9(5) VALUE ZEROS.
       PROCEDURE DIVISION.


                   COMPUTE WS-RESULT = ((((5 + 5) * 3) - 15) / 3) ** 3

                DISPLAY 'RESULTADO..: ' WS-RESULT
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
