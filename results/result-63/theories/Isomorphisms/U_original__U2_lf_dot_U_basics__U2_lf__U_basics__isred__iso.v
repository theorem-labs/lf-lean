From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__color__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_isred : imported_Original_LF__DOT__Basics_LF_Basics_color -> imported_Original_LF__DOT__Basics_LF_Basics_bool := Imported.Original_LF__DOT__Basics_LF_Basics_isred.
Instance Original_LF__DOT__Basics_LF_Basics_isred_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.color) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_color),
  rel_iso Original_LF__DOT__Basics_LF_Basics_color_iso x1 x2 ->
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso (Original.LF_DOT_Basics.LF.Basics.isred x1) (imported_Original_LF__DOT__Basics_LF_Basics_isred x2).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.isred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_isred := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.isred Original_LF__DOT__Basics_LF_Basics_isred_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.isred Imported.Original_LF__DOT__Basics_LF_Basics_isred Original_LF__DOT__Basics_LF_Basics_isred_iso := {}.