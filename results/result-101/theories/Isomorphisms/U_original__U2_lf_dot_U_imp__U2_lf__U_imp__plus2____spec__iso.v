From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_x__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__plus2__iso Isomorphisms.U_peanoU_nat__U_nat__add__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_plus2__spec : forall (x : imported_String_string -> imported_nat) (x0 : imported_nat) (x1 : imported_String_string -> imported_nat),
  imported_Corelib_Init_Logic_eq (x imported_Original_LF__DOT__Imp_LF_Imp_X) x0 ->
  imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_plus2 (fun x2 : imported_String_string => x x2) (fun x2 : imported_String_string => x1 x2) ->
  imported_Corelib_Init_Logic_eq (x1 imported_Original_LF__DOT__Imp_LF_Imp_X) (imported_PeanoNat_Nat_add x0 (imported_S (imported_S imported_0))) := Imported.Original_LF__DOT__Imp_LF_Imp_plus2__spec.
Instance Original_LF__DOT__Imp_LF_Imp_plus2__spec_iso : forall (x1 : String.string -> nat) (x2 : imported_String_string -> imported_nat)
    (hx : forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4)
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat)
    (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) (x7 : x1 Original.LF_DOT_Imp.LF.Imp.X = x3)
    (x8 : imported_Corelib_Init_Logic_eq (x2 imported_Original_LF__DOT__Imp_LF_Imp_X) x4),
  rel_iso (Corelib_Init_Logic_eq_iso (hx Original.LF_DOT_Imp.LF.Imp.X imported_Original_LF__DOT__Imp_LF_Imp_X Original_LF__DOT__Imp_LF_Imp_X_iso) hx0) x7 x8 ->
  forall (x9 : Original.LF_DOT_Imp.LF.Imp.ceval Original.LF_DOT_Imp.LF.Imp.plus2 x1 x5)
    (x10 : imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_plus2 (fun x : imported_String_string => x2 x) (fun x : imported_String_string => x6 x)),
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso Original_LF__DOT__Imp_LF_Imp_plus2_iso x1 (fun x : imported_String_string => x2 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx x11 x12 hx3) x5 (fun x : imported_String_string => x6 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3))
    x9 x10 ->
  rel_iso (Corelib_Init_Logic_eq_iso (hx1 Original.LF_DOT_Imp.LF.Imp.X imported_Original_LF__DOT__Imp_LF_Imp_X Original_LF__DOT__Imp_LF_Imp_X_iso) (PeanoNat_Nat_add_iso hx0 (S_iso (S_iso _0_iso))))
    (Original.LF_DOT_Imp.LF.Imp.plus2_spec x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Imp_LF_Imp_plus2__spec x2 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.plus2_spec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_plus2__spec := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.plus2_spec Original_LF__DOT__Imp_LF_Imp_plus2__spec_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.plus2_spec Imported.Original_LF__DOT__Imp_LF_Imp_plus2__spec Original_LF__DOT__Imp_LF_Imp_plus2__spec_iso := {}.