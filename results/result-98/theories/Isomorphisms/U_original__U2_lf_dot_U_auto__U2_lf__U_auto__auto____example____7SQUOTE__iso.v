From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_auto__U2_lf__U_auto__is____fortytwo__iso Isomorphisms.U_s__iso Isomorphisms.and__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_auto__example__7' : forall x : imported_nat,
  imported_and (imported_le x (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0))))) (imported_le (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))) x) ->
  imported_Original_LF__DOT__Auto_LF_Auto_is__fortytwo x := Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__7'.
Instance Original_LF__DOT__Auto_LF_Auto_auto__example__7'_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : x1 <= 42 <= x1)
    (x4 : imported_and (imported_le x2 (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))))
            (imported_le (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))) x2)),
  rel_iso
    {|
      to :=
        and_iso (le_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso))))) (le_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))) hx);
      from :=
        from
          (and_iso (le_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))))
             (le_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))) hx));
      to_from :=
        fun
          x : imported_and (imported_le x2 (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))))
                (imported_le (imported_S (imported_S (imported_S (iterate1 imported_S 39 imported_0)))) x2) =>
        to_from
          (and_iso (le_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))))
             (le_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))) hx))
          x;
      from_to :=
        fun x : x1 <= 42 <= x1 =>
        seq_p_of_t
          (from_to
             (and_iso (le_iso hx (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))))
                (le_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 39 0 imported_0 _0_iso)))) hx))
             x)
    |} x3 x4 ->
  rel_iso
    {|
      to := Original_LF__DOT__Auto_LF_Auto_is__fortytwo_iso hx;
      from := from (Original_LF__DOT__Auto_LF_Auto_is__fortytwo_iso hx);
      to_from := fun x : imported_Original_LF__DOT__Auto_LF_Auto_is__fortytwo x2 => to_from (Original_LF__DOT__Auto_LF_Auto_is__fortytwo_iso hx) x;
      from_to := fun x : Original.LF_DOT_Auto.LF.Auto.is_fortytwo x1 => seq_p_of_t (from_to (Original_LF__DOT__Auto_LF_Auto_is__fortytwo_iso hx) x)
    |} (Original.LF_DOT_Auto.LF.Auto.auto_example_7' x1 x3) (imported_Original_LF__DOT__Auto_LF_Auto_auto__example__7' x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.auto_example_7' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__7' := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.auto_example_7' Original_LF__DOT__Auto_LF_Auto_auto__example__7'_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.auto_example_7' Imported.Original_LF__DOT__Auto_LF_Auto_auto__example__7' Original_LF__DOT__Auto_LF_Auto_auto__example__7'_iso := {}.