⍝ Quick explanation:
⍝ STALINSORT is a lambda expression, so it should work on both
⍝ GNU APL and Dyalog APL.
⍝ 1. The parameter vector ⍵ is attributed to A.
⍝ 2. A sequence of indexes 2..(size of A) -- base-1 indexing --
⍝    is generated.
⍝ 3. For each generated index, another lambda checks whether
⍝    there is any number greater than A[index] before it. This
⍝    creates a vector where a 0 is attributed to every number
⍝    that should remain on the answer; a 0 is prepended to this
⍝    vector so that the first number always remains.
⍝ 4. The vector is NOT'd, so 0's become 1's and vice-versa.
⍝ 5. The NOT'd vector works as a selector among A: every number
⍝    with a corresponding 1 in its place makes the answer, while
⍝    the numbers with 0's in their positions are eliminated.

STALINSORT←{(~0,({×+/(A[⍳⍵]>(⍵⌷A))}¨(1↓⍳⍴A)))/A←⍵}

⍝ Tests
STALINSORT ⍳15   ⍝ Applied to sequence 1..15 inclusive
STALINSORT ⌽⍳15  ⍝ Applied to sequence 15..1 inclusive
STALINSORT 3 1 2 5 5 4 7 6 9 8
STALINSORT 1 2 4 5 6 8 0 9 5 7
STALINSORT 9 8 7 6 5 4 3 2 1 0
STALINSORT 1 3 2 5 4 7 0 9 8 6
STALINSORT 1 3 3 2 5 6 6
