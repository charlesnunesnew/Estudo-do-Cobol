      ******************************************************************
      * Author: Charles Nunes
      * Date: 24/02/2024
      * Purpose: Calcular um Boletrim Escolar
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DESAFIOM2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  WRK-MSGERRO                 PIC X(50).

       77  WRK-NOMEALUNO               PIC X(14).
       77  WRK-MATERIA                 PIC X(06).
       77  WRK-N1                      PIC 9(02).
       77  WRK-N2                      PIC 9(02) VALUE ZEROS.
       77  WRK-N3                      PIC 9(02) VALUE ZEROS.
       77  WRK-N4                      PIC 9(02) VALUE ZEROS.
       77  WRK-MEDIA                   PIC 9(02)V99 VALUE ZEROS.

       77  WS-OPCAO                    PIC X(01).
       PROCEDURE DIVISION.

       P001-NOME SECTION.
           DISPLAY 'DIGITE O NOME DO ALUNO: '
           ACCEPT WRK-NOMEALUNO.

       P002-MATERIA.
           DISPLAY 'DIGITE A MATERIA: '
           ACCEPT WRK-MATERIA.

       P003-N1.
           DISPLAY 'DIGITE A PRIMEIRA NOTA: '
           ACCEPT WRK-N1
           IF WRK-N1 = 00
              DISPLAY '************************************************'
              DISPLAY '     NOTA 1 INVALIDA - TENTE NOVAMENTE          '
              DISPLAY '************************************************'
              PERFORM P003-N1
           END-IF.

       P003-N2.
           DISPLAY 'DIGITE A SEGUNDA NOTA: '
           ACCEPT WRK-N2
           IF WRK-N2 = 00
              DISPLAY '************************************************'
              DISPLAY '     NOTA 2 INVALIDA - TENTE NOVAMENTE          '
              DISPLAY '************************************************'
              PERFORM P003-N2
           END-IF.

       P003-N3.
           DISPLAY 'DIGITE A TERCEIRA NOTA: '
           ACCEPT WRK-N3
           IF WRK-N3 = 00
              DISPLAY '************************************************'
              DISPLAY '     NOTA 3 INVALIDA - TENTE NOVAMENTE          '
              DISPLAY '************************************************'
              PERFORM P003-N3
             END-IF.

       P003-N4.
           DISPLAY 'DIGITE A QUARTA NOTA: '
           ACCEPT WRK-N4
           IF WRK-N4 = 00
              DISPLAY '************************************************'
              DISPLAY '     NOTA 4 INVALIDA - TENTE NOVAMENTE          '
              DISPLAY '************************************************'
              PERFORM P003-N4
             END-IF.

           COMPUTE WRK-MEDIA = (WRK-N1 + WRK-N2 + WRK-N3 + WRK-N4)/4


           DISPLAY '************ RESULTADO DO PROCESSAMENTO ***********'
           DISPLAY 'NOME DO ALUNO  : ' WRK-NOMEALUNO
           DISPLAY 'MATERIA        : ' WRK-MATERIA
           DISPLAY 'MEDIA          : ' WRK-MEDIA
           IF WRK-MEDIA >= 7
           DISPLAY 'STATUS         : Aprovado'
           ELSE
           DISPLAY 'STATUS         : Reprovado'
           END-IF.
           DISPLAY '***************************************************'

           DISPLAY "<F> PARA FINALIZAR"
           DISPLAY "<1> PARA NOVO CADASTRO"
           ACCEPT WS-OPCAO.

               IF WS-OPCAO EQUAL "F" THEN
                   PERFORM FINALIZAR
           ELSE
               IF WS-OPCAO EQUAL 1 THEN
                   PERFORM P001-NOME.

       P999-FIM.
             FINALIZAR.
            STOP RUN.

       END PROGRAM DESAFIOM2.
