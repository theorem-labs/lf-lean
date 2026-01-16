From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__list__iso Isomorphisms.U_original__U_false__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_In : forall x : Type, x -> imported_Original_LF__DOT__Poly_LF_Poly_list x -> SProp := (@Imported.Original_LF__DOT__Logic_LF_Logic_In).

(* Admitting the In isomorphism - the proof requires complex handling of SProp or elimination *)
Instance Original_LF__DOT__Logic_LF_Logic_In_iso : (forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1) (x4 : x2) (_ : @rel_iso x1 x2 hx x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
     (_ : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x5 x6),
   Iso (@Original.LF_DOT_Logic.LF.Logic.In x1 x3 x5) (@imported_Original_LF__DOT__Logic_LF_Logic_In x2 x4 x6)).
Admitted.

Instance: KnownConstant (@Original.LF_DOT_Logic.LF.Logic.In) := {}.
Instance: KnownConstant (@Imported.Original_LF__DOT__Logic_LF_Logic_In) := {}.
Instance: IsoStatementProofFor (@Original.LF_DOT_Logic.LF.Logic.In) Original_LF__DOT__Logic_LF_Logic_In_iso := {}.
Instance: IsoStatementProofBetween (@Original.LF_DOT_Logic.LF.Logic.In) (@Imported.Original_LF__DOT__Logic_LF_Logic_In) Original_LF__DOT__Logic_LF_Logic_In_iso := {}.
