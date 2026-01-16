From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


Monomorphic Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_silly1 : forall x : SProp, x -> x := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly1.
Monomorphic Instance Original_LF__DOT__Imp_LF_Imp_AExp_silly1_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : x1) (x4 : x2),
  rel_iso hx x3 x4 -> rel_iso hx (Original.LF_DOT_Imp.LF.Imp.AExp.silly1 x1 x3) (imported_Original_LF__DOT__Imp_LF_Imp_AExp_silly1 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.silly1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.silly1 Original_LF__DOT__Imp_LF_Imp_AExp_silly1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.silly1 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_silly1 Original_LF__DOT__Imp_LF_Imp_AExp_silly1_iso := {}.