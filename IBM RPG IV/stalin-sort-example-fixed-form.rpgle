     H DftActGrp(*No)

     C* Stalin Sort

     DARR              S             10I 0 DIM(6)
     DSIZE             S              3U 0 INZ(6)
     DI                S              3U 0
     DMSG              S             52A   VARYING INZ('New Size : ')

     DSTALIN_SORT      PR
     D *N                            10I 0 DIM(6)
     D *N                             3U 0

     C                   Z-ADD     1             ARR(1)
     C                   Z-ADD     2             ARR(2)
     C                   Z-ADD     5             ARR(3)
     C                   Z-ADD     4             ARR(4)
     C                   Z-ADD     1             ARR(5)
     C                   Z-ADD     6             ARR(6)
     C                   CALLP     STALIN_SORT(ARR : SIZE)
     C                   EVAl      MSG = MSG + %CHAR(SIZE)
     C     MSG           DSPLY
     C                   FOR       I = 1 TO SIZE
     C     ARR(I)        DSPLY
     C                   ENDFOR
     C                   RETURN

     PSTALIN_SORT      B
     DSTALIN_SORT      PI
     D ARR                           10I 0 DIM(6)
     D SIZE                           3U 0

     DI                S                   LIKE(SIZE)
     DOUT_INDEX        S                   LIKE(SIZE) INZ(1)
     DNEWSIZE          S                   LIKE(SIZE) INZ(0)
     DLASTVAL          S             10I 0 INZ(*LOVAL)

     C     SIZE          IFEQ      1
     C                   RETURN
     C                   END

     C                   FOR       I = 1 TO SIZE
     C     ARR(I)        IFGE      LASTVAL
     C                   Z-ADD     ARR(I)        LASTVAL
     C     OUT_INDEX     IFNE      I
     C                   Z-ADD     LASTVAL       ARR(OUT_INDEX)
     C                   END
     C     NEWSIZE       ADD       1             NEWSIZE
     C     OUT_INDEX     ADD       1             OUT_INDEX
     C                   END
     C                   ENDFOR
     C                   Z-ADD     NEWSIZE       SIZE
     C                   RETURN
     PSTALIN_SORT      E