From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__ceval__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__loop__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_loop__never__stops : forall x x0 : imported_String_string -> imported_nat,
  imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_loop (fun x1 : imported_String_string => x x1) (fun x1 : imported_String_string => x0 x1) -> imported_False := Imported.Original_LF__DOT__Imp_LF_Imp_loop__never__stops.
Instance Original_LF__DOT__Imp_LF_Imp_loop__never__stops_iso : forall (x1 : Original.LF_DOT_Imp.LF.Imp.state) (x2 : imported_String_string -> imported_nat)
    (hx : forall (x3 : String.string) (x4 : imported_String_string), rel_iso String_string_iso x3 x4 -> rel_iso nat_iso (x1 x3) (x2 x4)) (x3 : Original.LF_DOT_Imp.LF.Imp.state)
    (x4 : imported_String_string -> imported_nat) (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso nat_iso (x3 x5) (x4 x6))
    (x5 : Original.LF_DOT_Imp.LF.Imp.ceval Original.LF_DOT_Imp.LF.Imp.loop x1 x3)
    (x6 : imported_Original_LF__DOT__Imp_LF_Imp_ceval imported_Original_LF__DOT__Imp_LF_Imp_loop (fun x : imported_String_string => x2 x) (fun x : imported_String_string => x4 x)),
  rel_iso
    (Original_LF__DOT__Imp_LF_Imp_ceval_iso Original_LF__DOT__Imp_LF_Imp_loop_iso x1 (fun x : imported_String_string => x2 x)
       (fun (x7 : String.string) (x8 : imported_String_string) (hx1 : rel_iso String_string_iso x7 x8) => hx x7 x8 hx1) x3 (fun x : imported_String_string => x4 x)
       (fun (x7 : String.string) (x8 : imported_String_string) (hx1 : rel_iso String_string_iso x7 x8) => hx0 x7 x8 hx1))
    x5 x6 ->
  rel_iso False_iso (Original.LF_DOT_Imp.LF.Imp.loop_never_stops x1 x3 x5) (imported_Original_LF__DOT__Imp_LF_Imp_loop__never__stops x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.loop_never_stops := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_loop__never__stops := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.loop_never_stops Original_LF__DOT__Imp_LF_Imp_loop__never__stops_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.loop_never_stops Imported.Original_LF__DOT__Imp_LF_Imp_loop__never__stops Original_LF__DOT__Imp_LF_Imp_loop__never__stops_iso := {}.