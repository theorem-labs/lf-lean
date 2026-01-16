From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.

#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
Local Open Scope nat_scope.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__bool__iso.

Monomorphic Definition imported_Original_LF__DOT__IndProp_LF_IndProp_reflect : SProp -> imported_Original_LF__DOT__Basics_LF_Basics_bool -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect.
Monomorphic Instance Original_LF__DOT__IndProp_LF_IndProp_reflect_iso : forall (x1 : Prop) (x2 : SProp),
  Iso x1 x2 ->
  forall (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
  rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4 -> Iso (Original.LF_DOT_IndProp.LF.IndProp.reflect x1 x3) (imported_Original_LF__DOT__IndProp_LF_IndProp_reflect x2 x4).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.reflect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.reflect Original_LF__DOT__IndProp_LF_IndProp_reflect_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.reflect Imported.Original_LF__DOT__IndProp_LF_IndProp_reflect Original_LF__DOT__IndProp_LF_IndProp_reflect_iso := {}.