From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_bool__rec : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool -> Type,
  x imported_Original_LF__DOT__Basics_LF_Basics_true -> x imported_Original_LF__DOT__Basics_LF_Basics_false -> forall x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool, x x2 := Imported.Original_LF__DOT__Basics_LF_Basics_bool__rec.
Instance Original_LF__DOT__Basics_LF_Basics_bool__rec_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool -> Set) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool -> Type)
    (hx : forall (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
          rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4 -> IsoOrSortRelaxed (x1 x3) (x2 x4))
    (x3 : x1 Original.LF_DOT_Basics.LF.Basics.true) (x4 : x2 imported_Original_LF__DOT__Basics_LF_Basics_true),
  rel_iso_sort (hx Original.LF_DOT_Basics.LF.Basics.true imported_Original_LF__DOT__Basics_LF_Basics_true Original_LF__DOT__Basics_LF_Basics_true_iso) x3 x4 ->
  forall (x5 : x1 Original.LF_DOT_Basics.LF.Basics.false) (x6 : x2 imported_Original_LF__DOT__Basics_LF_Basics_false),
  rel_iso_sort (hx Original.LF_DOT_Basics.LF.Basics.false imported_Original_LF__DOT__Basics_LF_Basics_false Original_LF__DOT__Basics_LF_Basics_false_iso) x5 x6 ->
  forall (x7 : Original.LF_DOT_Basics.LF.Basics.bool) (x8 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx2 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x7 x8),
  rel_iso_sort (hx x7 x8 hx2) (Original.LF_DOT_Basics.LF.Basics.bool_rec x1 x3 x5 x7) (imported_Original_LF__DOT__Basics_LF_Basics_bool__rec x2 x4 x6 x8).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bool_rec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bool__rec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bool_rec Original_LF__DOT__Basics_LF_Basics_bool__rec_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bool_rec Imported.Original_LF__DOT__Basics_LF_Basics_bool__rec Original_LF__DOT__Basics_LF_Basics_bool__rec_iso := {}.