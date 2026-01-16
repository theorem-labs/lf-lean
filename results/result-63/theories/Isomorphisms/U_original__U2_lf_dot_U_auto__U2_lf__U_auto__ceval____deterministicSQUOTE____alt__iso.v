From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt : forall (x : imported_Original_LF__DOT__Imp_LF_Imp_com) (x0 x1 x2 : imported_String_string -> imported_nat),
  imported_Original_LF__DOT__Imp_LF_Imp_ceval x (fun x3 : imported_String_string => x0 x3) (fun x3 : imported_String_string => x1 x3) ->
  imported_Original_LF__DOT__Imp_LF_Imp_ceval x (fun x3 : imported_String_string => x0 x3) (fun x3 : imported_String_string => x2 x3) ->
  imported_Corelib_Init_Logic_eq (fun x14 : imported_String_string => x1 x14) (fun x14 : imported_String_string => x2 x14) := Imported.Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt.
Instance Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_com) (hx : rel_iso Original_LF__DOT__Imp_LF_Imp_com_iso x1 x2) (x3 : Original.LF_DOT_Imp.LF.Imp.state)
    (x4 : imported_String_string -> imported_nat) (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6))
    (x5 : Original.LF_DOT_Imp.LF.Imp.state) (x6 : imported_String_string -> imported_nat)
    (hx1 : forall (x7 : String.string) (x8 : imported_String_string), rel_iso String_string_iso x7 x8 -> rel_iso nat_iso (x5 x7) (x6 x8)) (x7 : Original.LF_DOT_Imp.LF.Imp.state)
    (x8 : imported_String_string -> imported_nat) (hx2 : forall (x9 : String.string) (x10 : imported_String_string), rel_iso String_string_iso x9 x10 -> rel_iso nat_iso (x7 x9) (x8 x10))
    (x9 : Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x5) (x10 : imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 (fun x : imported_String_string => x4 x) (fun x : imported_String_string => x6 x)),
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun x : imported_String_string => x4 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx0 x11 x12 hx3) x5 (fun x : imported_String_string => x6 x)
       (fun (x11 : String.string) (x12 : imported_String_string) (hx3 : rel_iso String_string_iso x11 x12) => hx1 x11 x12 hx3))
    x9 x10 ->
  forall (x11 : Original.LF_DOT_Imp.LF.Imp.ceval x1 x3 x7) (x12 : imported_Original_LF__DOT__Imp_LF_Imp_ceval x2 (fun x : imported_String_string => x4 x) (fun x : imported_String_string => x8 x)),
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso hx x3 (fun x : imported_String_string => x4 x)
       (fun (x13 : String.string) (x14 : imported_String_string) (hx4 : rel_iso String_string_iso x13 x14) => hx0 x13 x14 hx4) x7 (fun x : imported_String_string => x8 x)
       (fun (x13 : String.string) (x14 : imported_String_string) (hx4 : rel_iso String_string_iso x13 x14) => hx2 x13 x14 hx4))
    x11 x12 ->
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (IsoFunND x5 (fun x14 : imported_String_string => x6 x14) (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) => hx1 x13 x14 hx5))
       (IsoFunND x7 (fun x14 : imported_String_string => x8 x14) (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) => hx2 x13 x14 hx5)))
    (Original.LF_DOT_Auto.LF.Auto.ceval_deterministic'_alt x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt x4 x6 x8 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_Auto.LF.Auto.ceval_deterministic'_alt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Auto.LF.Auto.ceval_deterministic'_alt Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Auto.LF.Auto.ceval_deterministic'_alt Imported.Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt Original_LF__DOT__Auto_LF_Auto_ceval__deterministic'__alt_iso := {}.