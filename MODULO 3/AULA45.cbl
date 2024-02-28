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
       77 WS-TM-1                              PIC 99.
       77 WS-TM-2                              PIC 99.
       77 WS-TM-3                              PIC 99.
       COPY 'LAYOUT001.CPY'.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE 'MARIA'                       TO WS-PRIMEIRO-NOME
            MOVE 'CAMPOS'                      TO WS-SEGUNDO-NOME
            MOVE '557591008140'                TO WS-TELEFONE
            MOVE 'AV GETULIIO,762'             TO WS-RUA
            MOVE 'CENTRO'                      TO WS-BAIRRO
            MOVE 'CRUZ DAS ALMAS'              TO WS-CIDADE
            MOVE 'BA'                          TO WS-UF
            MOVE '44380000'                    TO WS-CEP
            MOVE 'BRASILEIRA'                  TO WS-NACIONALIDADE
            MOVE 'ENFERMEIRA'                  TO WS-PROFISSAO

            MOVE ZEROS                         TO WS-TM-1

            INSPECT FUNCTION REVERSE(WS-PRIMEIRO-NOME)
                         TALLYING WS-TM-1 FOR LEADING ' '


                 DISPLAY '1 - NOME COMPLETO: 'WS-PRIMEIRO-NOME
                    (1:(FUNCTION LENGTH(WS-PRIMEIRO-NOME) - WS-TM-1))' '
                                              WS-SEGUNDO-NOME

                 DISPLAY '2 - TELEFONE.....: +'WS-TELEFONE(1:2)' ('
                    WS-TELEFONE(3:2)')'WS-TELEFONE(5:4)'-'
                    WS-TELEFONE(9:4)

            DISPLAY '2 - TELEFONE.2...: +'WS-PAIS' ('
                                          WS-DDD') '
                                          WS-PREFIXO'-'
                                          WS-SUFIXO

            MOVE ZEROS                         TO WS-TM-1
            INSPECT FUNCTION REVERSE(WS-RUA)
                    TALLYING WS-TM-1 FOR LEADING ' '

            MOVE ZEROS                         TO WS-TM-2
            INSPECT FUNCTION REVERSE(WS-BAIRRO)
                    TALLYING WS-TM-2 FOR LEADING ' '

            MOVE ZEROS                         TO WS-TM-3
            INSPECT FUNCTION REVERSE(WS-CIDADE)
                    TALLYING WS-TM-3 FOR LEADING ' '

            DISPLAY '3 - ENDERECO.....: 'WS-RUA
                (1:(FUNCTION LENGTH(WS-RUA) - WS-TM-1))
                                        ' '
                                        WS-BAIRRO
                (1:(FUNCTION LENGTH(WS-BAIRRO) - WS-TM-2))
                                        ' - '
                                           WS-CIDADE
                (1:(FUNCTION LENGTH(WS-CIDADE) - WS-TM-3))
                                        ' '
                                           WS-UF
               FUNCTION CONCATENATE(' - CEP: '
                                    WS-CEP-1
                                    '-'
                                    WS-CEP-2
                                     )
            DISPLAY '4 - NACIONALIDADE: 'WS-NACIONALIDADE
            DISPLAY '5 - PROFISSAO....: 'WS-PROFISSAO





            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
