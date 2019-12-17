module StalinSort where

  import Relation.Binary.PropositionalEquality as Eq
  open Eq using (_≡_; refl)
  open import Data.Nat using (ℕ; _≤_; _≤?_)
  open import Data.List using (List; _∷_; [])
  open import Relation.Nullary using (Dec; yes; no)

  -- Implementation of Stalin Sort
  stalinSort : List ℕ → List ℕ
  stalinSort [] = []
  stalinSort (x ∷ []) = x ∷ []
  stalinSort (x ∷ y ∷ zs) with x ≤? y
  ...| yes m≤n = x ∷ stalinSort (y ∷ zs)
  ...| no m≰n  = stalinSort (x ∷ zs)

  -- Example Test
  _ : stalinSort (2 ∷ 3 ∷ 5 ∷ 4 ∷ 6 ∷ []) ≡ (2 ∷ 3 ∷ 5 ∷ 6 ∷ [])
  _ = refl

  -------------------- Correctness of Stalin Sort -------------------------
  {-
     This section is only interesting for Logic and Formal Verification
     enthusiasts. Although I tried to sketch the formal proof that
     Stalin Sort always returns a Sorted List, there is a point in the proof
     that I couldn't solve yet. I declared it as a postulate, so somebody can
     try improving it by giving an lemma that remove the postulate and
     finish the proof =D
  -}

  -- A proof that x is less than all values in xs (thanks to Twan van Laarhoven)
  data _≤*_ (x : ℕ) : List ℕ → Set where
    []  : x ≤* []
    _∷_ : ∀ {y ys} → (x ≤ y) → y ≤* ys → x ≤* (y ∷ ys)

  -- Proof that a list is sorted (thanks to Twan van Laarhoven)
  data SortedList : List ℕ → Set where
    []  : SortedList []
    _∷_ : ∀ {x xs} → x ≤* xs → SortedList xs → SortedList (x ∷ xs)

  -- Proof that if x ≤ y and y is the start of a list which we then stalin sort,
  -- then x is smaller or equal to each element in the stalin sorted list
  less-stalin : ∀ (x y : ℕ) (zs : List ℕ) → x ≤ y → x ≤* stalinSort (y ∷ zs)
  less-stalin x y []       x≤y = x≤y ∷ []
  less-stalin x y (z ∷ zs) x≤y with y ≤? z
  ...| yes y≤z = x≤y ∷ less-stalin y z zs y≤z
  ...| no  y≰z = less-stalin x y zs x≤y

  -- Proof that Stalin Sort returns a sorted list
  stalinSort-correctness : ∀ (xs : List ℕ) → SortedList (stalinSort xs)
  stalinSort-correctness [] = []
  stalinSort-correctness (x ∷ []) = [] ∷ []
  stalinSort-correctness (x ∷ y ∷ zs) with x ≤? y
  ...| yes m≤n = less-stalin x y zs m≤n ∷ (stalinSort-correctness (y ∷ zs))
  ...| no m≰n  = stalinSort-correctness (x ∷ zs)


