⍝ Quick explanation:
⍝ STALINSORT is a lambda expression, so it should work on
⍝ GNU APL, Dyalog APL, NARS2000, ngn/apl, and dzaima/APL.
⍝ 1. Find the cumulative maximum of the argument vector ⍵.
⍝ 2. Compute a mask indicating which elements of ⍵ are
⍝    equal to the corresponding cumulative maximum.
⍝ 3. Filter so only the indicated elements of ⍵ remain.

STALINSORT←{⍵⌿⍨⍵=⌈\⍵}

⍝ Tests
STALINSORT ⍳15   ⍝ Applied to sequence 1..15 inclusive
STALINSORT ⌽⍳15  ⍝ Applied to sequence 15..1 inclusive
STALINSORT 3 1 2 5 5 4 7 6 9 8
STALINSORT 1 2 4 5 6 8 0 9 5 7
STALINSORT 9 8 7 6 5 4 3 2 1 0
STALINSORT 1 3 2 5 4 7 0 9 8 6
STALINSORT 1 3 3 2 5 6 6
