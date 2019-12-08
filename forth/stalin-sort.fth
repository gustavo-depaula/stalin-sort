: LIST ( size -- )
    CREATE DUP , CELLS ALLOT
;

: LIST@ ( index list -- value )
    SWAP 1 + CELLS + @
;

: LIST! ( value index list -- )
    SWAP 1 + CELLS + !
;

: STALINSORT ( list -- sorted-list )
    0 OVER LIST@ SWAP 1 SWAP DUP @ 1
    DO
        I OVER LIST@ ROT ROT >R >R 2DUP
        > IF
            DROP
            0
        ELSE
            1
        THEN
        R> + R> 
    LOOP
    2DUP ! SWAP 0 SWAP 1 -
    DO
        I OVER >R SWAP LIST! R>
    -1
    +LOOP
;
