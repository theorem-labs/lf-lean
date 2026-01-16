From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__reflect__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_iff__reflect : forall (x : SProp) (x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool),
  imported_iff x (imported_Corelib_Init_Logic_eq x0 imported_Original_LF__DOT__Basics_LF_Basics_true) -> imported_Original_LF__DOT__IndProp_LF_IndProp_reflect x x0 := Imported.Original_LF__DOT__IndProp_LF_IndProp_iff__reflect.
Instance Original_LF__DOT__IndProp_LF_IndProp_iff__reflect_iso : forall (x1 : Prop) (x2 : SProp) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool)
    (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4) (x5 : x1 <-> x3 = Original.LF_DOT_Basics.LF.Basics.true)
    (x6 : imported_iff x2 (imported_Corelib_Init_Logic_eq x4 imported_Original_LF__DOT__Basics_LF_Basics_true)),
  rel_iso
    {|
      to := iff_iso hx (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso);
      from := from (iff_iso hx (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso));
      to_from :=
        fun x : imported_iff x2 (imported_Corelib_Init_Logic_eq x4 imported_Original_LF__DOT__Basics_LF_Basics_true) =>
        to_from (iff_iso hx (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso)) x;
      from_to := fun x : x1 <-> x3 = Original.LF_DOT_Basics.LF.Basics.true => seq_p_of_t (from_to (iff_iso hx (Corelib_Init_Logic_eq_iso hx0 Original_LF__DOT__Basics_LF_Basics_true_iso)) x)
    |} x5 x6 ->
  rel_iso
    {|
      to := Original_LF__DOT__IndProp_LF_IndProp_reflect_iso hx hx0;
      from := from (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso hx hx0);
      to_from := fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_reflect x2 x4 => to_from (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso hx hx0) x;
      from_to := fun x : Original.LF_DOT_IndProp.LF.IndProp.reflect x1 x3 => seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_reflect_iso hx hx0) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.iff_reflect x1 x3 x5) (imported_Original_LF__DOT__IndProp_LF_IndProp_iff__reflect x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.iff_reflect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_iff__reflect := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.iff_reflect Original_LF__DOT__IndProp_LF_IndProp_iff__reflect_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.iff_reflect Imported.Original_LF__DOT__IndProp_LF_IndProp_iff__reflect Original_LF__DOT__IndProp_LF_IndProp_iff__reflect_iso := {}.