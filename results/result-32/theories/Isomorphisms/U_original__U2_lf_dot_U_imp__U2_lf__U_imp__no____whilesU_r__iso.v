From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.


(* Import com isomorphism *)
From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__com__iso.

(* no_whilesR isomorphism *)
(* Both Original.LF_DOT_Imp.LF.Imp.no_whilesR and Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR 
   are empty inductive types (no constructors), so they are both uninhabited.
   We can prove they are isomorphic since both are False-like. *)

Definition imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR : imported_Original_LF__DOT__Imp_LF_Imp_com -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR.

(* For empty types, the isomorphism is trivial - both directions are absurd eliminations *)
Instance Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso : 
  (forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com)
     (_ : @rel_iso Original.LF_DOT_Imp.LF.Imp.com imported_Original_LF__DOT__Imp_LF_Imp_com Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2),
   Iso (Original.LF_DOT_Imp.LF.Imp.no_whilesR x1) (imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR x2)).
Proof.
  intros x1 x2 Hrel.
  unfold imported_Original_LF__DOT__Imp_LF_Imp_no__whilesR.
  (* Both no_whilesR types are empty (no constructors), so both are False-like *)
  (* We need to show they are isomorphic. Since both are empty/uninhabited, 
     we can construct the isomorphism using absurd elimination *)
  apply (Build_Iso 
    (fun (h : Original.LF_DOT_Imp.LF.Imp.no_whilesR x1) => 
       match h return Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR x2 with end)
    (fun (h : Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR x2) => 
       match h return Original.LF_DOT_Imp.LF.Imp.no_whilesR x1 with end)).
  - intro h. destruct h.
  - intro h. destruct h.
Defined.

Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.no_whilesR := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.no_whilesR Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.no_whilesR Imported.Original_LF__DOT__Imp_LF_Imp_no__whilesR Original_LF__DOT__Imp_LF_Imp_no__whilesR_iso := {}.
