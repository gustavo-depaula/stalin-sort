: LIST ( size -- )
    CREATE DUP , CELLS ALLOT
;

: LIST@ ( index list -- value )
    SWAP 1 + CELLS + @
;

: LIST! ( value index list -- )
    SWAP 1 + CELLS + !
;

: LIST-ERASE ( index list -- )
    DUP ROT SWAP @ SWAP 1 +
    2DUP
    > IF
        DO 
            I DUP 1 - SWAP ROT
            >R
            R@ LIST@
            SWAP R@ LIST!
            R>
        LOOP
    ELSE
        2DROP
    THEN
    DUP @ 1 - SWAP !
;   

: STALINSORT ( LIST -- SORTED-LIST ) 
    1 >R
    BEGIN
        R@ SWAP >R 
        DUP DUP 1 -
        R@ LIST@
        SWAP R@ LIST@ 
        > IF
            R@ LIST-ERASE
            0
        ELSE
            DROP
            1
        THEN
        R> SWAP R> + >R
        DUP @ R@
        =
    UNTIL
    R> R> 2DROP
;
