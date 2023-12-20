CREATE OR REPLACE FUNCTION StalinSort(A INT[]) RETURNS INT[] AS $$
DECLARE
    n INT;
    bigger INT;
    B INT[] := '{}';
BEGIN
    n := array_length(A, 1);
    bigger := 0;

    FOR i IN 1..n LOOP
        IF A[i] >= bigger THEN
            bigger := A[i];
            B := B || A[i];
        END IF;
    END LOOP;

    RETURN B;
END;
$$ LANGUAGE plpgsql;

-- Example:
-- postgres=# SELECT StalinSort(ARRAY[5, 2, 8, 3, 1, 9, 4, 6, 7]);
-- stalinsort
-- ------------
--  {5,8,9}
-- (1 row)
