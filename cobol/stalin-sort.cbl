       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORTVECT.
       AUTHOR. COMRADE STALIN
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  I                 PIC 9(4) COMP.
       01  S                 PIC 9(4) COMP.
       01  VECTOR-LENGTH     PIC 9(4) COMP VALUE 10.
       01  VECTOR.
           02 VEC            PIC 9(4) OCCURS 10 TIMES.
       01  SORTED-VECTOR.
           02 SVEC           PIC 9(4) OCCURS 10 TIMES.
       01  MAX              PIC 9(4) VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN SECTION.
      *    INITIALIZE VECTOR (YEP, HAVEN'T FIND A LITERAL INIT WAY YET)
      *    VALUES: 6, 8, 5, 9, 11, 12, 4, 2, 7, 9
           MOVE 6 TO VEC(1)
           MOVE 8 TO VEC(2)
           MOVE 5 TO VEC(3)
           MOVE 9 TO VEC(4)
           MOVE 11 TO VEC(5)
           MOVE 12 TO VEC(6)
           MOVE 4 TO VEC(7)
           MOVE 2 TO VEC(8)
           MOVE 7 TO VEC(9).
           MOVE 9 TO VEC(10).

           DISPLAY "in array"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > VECTOR-LENGTH
              DISPLAY VEC(I) " " WITH NO ADVANCING
           END-PERFORM.

           DISPLAY " ".
           DISPLAY "out array".
           PERFORM STALIN-SORT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > VECTOR-LENGTH
              DISPLAY SVEC(I) " " WITH NO ADVANCING
           END-PERFORM.
           DISPLAY " ".
           
           STOP RUN.


       STALIN-SORT SECTION.
           MOVE 1 TO S.
           MOVE VEC(1) TO MAX
           PERFORM VARYING I FROM 2 BY 1 UNTIL I > VECTOR-LENGTH 
              IF VEC(I) >= MAX
                  MOVE MAX TO SVEC(S)
                  ADD 1 TO S
                  MOVE VEC(I) TO MAX
              END-IF 
           END-PERFORM.
           MOVE MAX TO SVEC(S).
