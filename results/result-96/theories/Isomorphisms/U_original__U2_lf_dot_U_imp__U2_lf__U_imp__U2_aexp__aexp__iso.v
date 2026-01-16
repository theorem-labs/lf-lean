From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp : Type := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp.

Fixpoint aexp_to_imported (a : Original.LF_DOT_Imp.LF.Imp.AExp.aexp) : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp :=
  match a with
  | Original.LF_DOT_Imp.LF.Imp.AExp.ANum n => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_ANum (nat_to_imported n)
  | Original.LF_DOT_Imp.LF.Imp.AExp.APlus a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AExp.AMinus a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMinus (aexp_to_imported a1) (aexp_to_imported a2)
  | Original.LF_DOT_Imp.LF.Imp.AExp.AMult a1 a2 => Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMult (aexp_to_imported a1) (aexp_to_imported a2)
  end.

Fixpoint imported_to_aexp (a : imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp) : Original.LF_DOT_Imp.LF.Imp.AExp.aexp :=
  match a with
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_ANum n => Original.LF_DOT_Imp.LF.Imp.AExp.ANum (imported_to_nat n)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.APlus (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMinus a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.AMinus (imported_to_aexp a1) (imported_to_aexp a2)
  | Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMult a1 a2 => Original.LF_DOT_Imp.LF.Imp.AExp.AMult (imported_to_aexp a1) (imported_to_aexp a2)
  end.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso : Iso Original.LF_DOT_Imp.LF.Imp.AExp.aexp imported_Original_LF__DOT__Imp_LF_Imp_AExp_aexp.
Proof.
  unshelve eapply Build_Iso.
  - exact aexp_to_imported.
  - exact imported_to_aexp.
  - intro a. induction a as [n | a1 IH1 a2 IH2 | a1 IH1 a2 IH2 | a1 IH1 a2 IH2].
    + simpl.
      apply (IsoEq.f_equal Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_ANum).
      exact (to_from nat_iso n).
    + simpl.
      apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_APlus IH1 IH2).
    + simpl.
      apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMinus IH1 IH2).
    + simpl.
      apply (IsoEq.f_equal2 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp_AMult IH1 IH2).
  - intro a. induction a as [n | a1 IH1 a2 IH2 | a1 IH1 a2 IH2 | a1 IH1 a2 IH2].
    + simpl.
      apply (IsoEq.f_equal Original.LF_DOT_Imp.LF.Imp.AExp.ANum).
      exact (from_to nat_iso n).
    + simpl.
      apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.APlus IH1 IH2).
    + simpl.
      apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.AMinus IH1 IH2).
    + simpl.
      apply (IsoEq.f_equal2 Original.LF_DOT_Imp.LF.Imp.AExp.AMult IH1 IH2).
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.aexp Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.aexp Imported.Original_LF__DOT__Imp_LF_Imp_AExp_aexp Original_LF__DOT__Imp_LF_Imp_AExp_aexp_iso := {}.