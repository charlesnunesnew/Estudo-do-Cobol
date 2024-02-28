      ******************************************************************
      * Author: Charles Nunes
      * Date: 26/02/2024
      * Purpose: Aula 46 Modulo 3
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.


       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-VARIAVEIS.
            03 WS-INT                          PIC 9(09)    VALUE ZEROS.
            03 WS-DEC                          PIC 9(09)V99 VALUE ZEROS.
            03 WS-VLR                          PIC S9(09)V99 VALUE ZERO.

       01 WS-MSK-VARIAVEIS.
           03 WS-MSK-INT                       PIC ZZZ,ZZ9.99.
           03 WS-MSK-DEC                       PIC ZZZBZZ9B99.
           03 WS-MSK-VLR                       PIC $$$,$$9.99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.


           MOVE 10                   TO WS-INT
                                        WS-DEC
                                        WS-VLR

            MOVE WS-INT              TO WS-MSK-INT.
            MOVE WS-DEC              TO WS-MSK-DEC.
            MOVE WS-VLR              TO WS-MSK-VLR.
            DISPLAY 'WS-INT...: ' WS-INT
            DISPLAY 'WS-DEC...: ' WS-DEC
            DISPLAY 'WS-VLR...: ' WS-VLR
            DISPLAY 'WS-MSK-INT: 'WS-MSK-INT
            DISPLAY 'WS-MSK-DEC: 'WS-MSK-DEC
            DISPLAY 'WS-MSK-VLR: 'WS-MSK-VLR
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
