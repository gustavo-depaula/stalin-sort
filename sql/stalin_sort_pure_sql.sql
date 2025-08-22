-- First things first, most SQL databases don't have any "implicit order" 
-- so we need a column like `pos` that says which "position" each element
-- is on the table. Think of it like an autoincrement primary key.

-- For this code, let's suppose we have some table called `input` that
-- contains the list we want to sort. If you want to create yourself, use these
-- commands below:

CREATE TABLE input(pos INTEGER, value INTEGER);

INSERT INTO input VALUES
(1, 1),
(2, 4),
(3, 5),
(4, 4),
(5, 10),
(6, 2),
(7, 8),
(8, 11),
(9, 10);


-- The actual sorting algorithm is quite simple using Window Functions:

WITH
  last_max(pos, value, last_max) AS (SELECT *, MAX(value) OVER (ORDER BY pos) FROM input)
SELECT value FROM last_max WHERE value >= last_max;
