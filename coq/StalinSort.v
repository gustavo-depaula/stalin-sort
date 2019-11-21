Set Implicit Arguments.

Require Import
        Arith_base
        Arith.Wf_nat
        List
        Omega
        Wellfounded
        Tactics.Tactics.

Import ListNotations.

Section STALIN.
  Variable A : Set.
  Variable leA : A -> A -> Prop.
  Variable leA_dec : forall (x y : A), {leA x y} + {~ leA x y}.

  Inductive sorted : list A -> Prop :=
  | SortedNil : sorted []
  | SortedSingle : forall x, sorted [x]
  | SortedCons : forall y y' ys, leA y y' ->
                            sorted (y' :: ys) ->
                            sorted (y :: y' :: ys).

  Hint Constructors sorted.

  Inductive In (x : A) : list A -> Prop :=
  | Here : forall xs, In x (x :: xs)
  | There : forall ys y, In x ys -> In x (y :: ys).

  Hint Constructors In.

  Definition sub_list xs ys := forall x, In x xs -> In x ys.

  Lemma sub_list_nil : forall ys, sub_list [] ys.
  Proof.
    intros ys ; unfold sub_list ; intros x H ; inversion H.
  Qed.

  Lemma sub_list_refl : forall xs, sub_list xs xs.
  Proof.
    intros xs ; unfold sub_list ; intros H ; auto.
  Qed.

  Lemma sub_list_skip : forall xs ys x, sub_list xs ys -> sub_list (x :: xs) (x :: ys).
  Proof.
    intros xs ys x H ; unfold sub_list in * ; intros z Hz.
    inversion Hz ; clear Hz ; subst ; auto.
  Qed.

  Hint Resolve sub_list_nil sub_list_refl sub_list_skip.

  Definition length_wf :=
    @wf_inverse_image (list A) nat lt (@length A) lt_wf.

  Definition stalin (xs : list A) :=
    {ys | sorted ys /\ sub_list ys xs}.

  Lemma stalin_nil : stalin [].
  Proof.
    unfold stalin ; exists (@nil A) ; splits*.
  Qed.

  Lemma stalin_single : forall x, stalin [x].
  Proof.
    intros x ; unfold stalin ; exists [x] ; splits*.
  Qed.

  Hint Resolve stalin_nil stalin_single.

  Definition stalin_sort_rec
    : forall xs, (forall ys, length ys < length xs -> stalin ys) -> stalin xs.
    refine (fun xs rec =>
              match xs as xs' return xs = xs' -> stalin xs' with
              | [] => fun _ => _
              | [ _ ] => fun _ => _
              | y :: y' :: ys' => fun _ =>
                match leA_dec y y' with
                | left _ =>
                  match rec (y' :: ys') _ with
                  | exist _ zs _ => _
                  end
                | right _  =>
                  match rec (y :: ys') _ with
                  | exist _ zs _ => exist _ zs _
                  end
                end
              end (eq_refl xs)) ; substs* ; crush.
    -
      destruct zs ; crush.
      unfolds ; exists (@nil A) ; crush.
      unfolds. exists (a :: zs) ; crush.
      unfolds. intros x H1. inverts* H1.
    -
      unfold sub_list in * ; crush.
      specialize (H0 _ H1). inverts* H0.
  Defined.

  Definition stalin_sort : forall xs, stalin xs :=
    (@well_founded_induction _ _ length_wf _ stalin_sort_rec).

End STALIN.
