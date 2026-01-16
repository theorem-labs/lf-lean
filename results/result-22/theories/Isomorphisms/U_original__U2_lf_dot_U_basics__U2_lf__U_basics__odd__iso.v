From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.nat__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__negb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_odd : imported_nat -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_odd.

(* Helper: show Original.odd and Imported.odd compute the same values *)
Lemma odd_commutes : forall n : nat,
  IsomorphismDefinitions.eq 
    (to Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.odd n))
    (Imported.Original_LF__DOT__Basics_LF_Basics_odd (nat_to_imported n)).
Proof.
  fix IH 1.
  intro n.
  destruct n as [|[|n']].
  - (* n = 0: odd 0 = false *)
    apply IsomorphismDefinitions.eq_refl.
  - (* n = 1: odd 1 = true *)
    apply IsomorphismDefinitions.eq_refl.
  - (* n = S (S n'): odd (S (S n')) = odd n' *)
    simpl Original.LF_DOT_Basics.LF.Basics.odd.
    simpl nat_to_imported.
    (* Need to show: to (odd n') = Imported.odd (S (S (nat_to_imported n'))) *)
    pose proof (IH n') as IHn.
    (* IHn : to (odd n') = Imported.odd (nat_to_imported n') *)
    (* Need: Imported.odd (S (S m)) = Imported.odd m *)
    (* This holds by definition/computation *)
    exact IHn.
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_odd_iso : forall (x1 : nat) (x2 : imported_nat),
  rel_iso nat_iso x1 x2 -> rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.odd x1) (imported_Original_LF__DOT__Basics_LF_Basics_odd x2).
Proof.
  intros x1 x2 H.
  constructor. simpl.
  pose proof (proj_rel_iso H) as Hnat. simpl in Hnat.
  pose proof (odd_commutes x1) as Hc.
  destruct Hnat.
  exact Hc.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_odd := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.odd Original_LF__DOT__Basics_LF_Basics_odd_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.odd Imported.Original_LF__DOT__Basics_LF_Basics_odd Original_LF__DOT__Basics_LF_Basics_odd_iso := {}.