From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. - disabled *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__update__iso Isomorphisms.U_logic__not__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_update__neq : forall (x : Type) (x0 : imported_String_string -> imported_option x) (x1 x2 : imported_String_string) (x3 : x),
  (imported_Corelib_Init_Logic_eq x2 x1 -> imported_False) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => x0 x4) x2 x3 x1) (x0 x1) := Imported.Original_LF__DOT__Maps_LF_Maps_update__neq.
Instance Original_LF__DOT__Maps_LF_Maps_update__neq_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string), rel_iso String_string_iso x5 x6 -> rel_iso (option_iso hx) (x3 x5) (x4 x6)) (x5 : String.string) (x6 : imported_String_string)
    (hx1 : rel_iso String_string_iso x5 x6) (x7 : String.string) (x8 : imported_String_string) (hx2 : rel_iso String_string_iso x7 x8) (x9 : x1) (x10 : x2) (hx3 : rel_iso hx x9 x10) 
    (x11 : x7 <> x5) (x12 : imported_Corelib_Init_Logic_eq x8 x6 -> imported_False),
  (forall (x13 : x7 = x5) (x14 : imported_Corelib_Init_Logic_eq x8 x6), rel_iso (Corelib_Init_Logic_eq_iso hx2 hx1) x13 x14 -> rel_iso False_iso (x11 x13) (x12 x14)) ->
  rel_iso
    (Corelib_Init_Logic_eq_iso
       (Original_LF__DOT__Maps_LF_Maps_update_iso x3 (fun x : imported_String_string => x4 x)
          (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : rel_iso String_string_iso x13 x14) => hx0 x13 x14 hx5) hx2 hx3 hx1)
       (hx0 x5 x6 hx1))
    (Original.LF_DOT_Maps.LF.Maps.update_neq x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__Maps_LF_Maps_update__neq x4 x10 x12).
Proof.
  intros.
  (* The goal is to show two equality proofs are isomorphic.
     The Corelib_Init_Logic_eq_iso is between (eq : Prop) and (imported_eq : SProp).
     rel_iso for such an isomorphism should follow from the fact that
     both sides are proofs of equivalent propositions. *)
  apply Build_rel_iso. simpl.
  (* Goal is IsomorphismDefinitions.eq (to (Corelib_Init_Logic_eq_iso ...) (update_neq ...)) (imported_update_neq ...) *)
  (* Both sides are in SProp, so all inhabitants are equal *)
  exact IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.update_neq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_update__neq := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.update_neq Original_LF__DOT__Maps_LF_Maps_update__neq_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.update_neq Imported.Original_LF__DOT__Maps_LF_Maps_update__neq Original_LF__DOT__Maps_LF_Maps_update__neq_iso := {}.