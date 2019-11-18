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

  -- This is necessary to prove the correctness, I can't find a way yet ...
  postulate
    less-stalin : ∀ (x y : ℕ) (zs : List ℕ) → x ≤ y → x ≤* stalinSort (y ∷ zs)

  -- Proof that Stalin Sort returns a sorted list
  stalinSort-correctness : ∀ (xs : List ℕ) → SortedList (stalinSort xs)
  stalinSort-correctness [] = []
  stalinSort-correctness (x ∷ []) = [] ∷ []
  stalinSort-correctness (x ∷ y ∷ zs) with x ≤? y
  ...| yes m≤n = less-stalin x y zs m≤n ∷ (stalinSort-correctness (y ∷ zs))
  ...| no m≰n  = stalinSort-correctness (x ∷ zs)
