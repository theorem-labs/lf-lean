From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_maps__U2_lf__U_maps__update__iso.

Definition imported_Original_LF__DOT__Maps_LF_Maps_update__shadow : forall (x : Type) (x0 : imported_String_string -> imported_option x) (x1 : imported_String_string) (x2 x3 : x),
  imported_Corelib_Init_Logic_eq
    (fun x12 : imported_String_string =>
     imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x5 : imported_String_string => x0 x5) x1 x2 x4) x1 x3 x12)
    (fun x12 : imported_String_string => imported_Original_LF__DOT__Maps_LF_Maps_update (fun x4 : imported_String_string => x0 x4) x1 x3 x12) := Imported.Original_LF__DOT__Maps_LF_Maps_update__shadow.
Instance Original_LF__DOT__Maps_LF_Maps_update__shadow_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_Maps.LF.Maps.partial_map x1) (x4 : imported_String_string -> imported_option x2)
    (hx0 : forall (x5 : String.string) (x6 : imported_String_string),
           @rel_iso String.string imported_String_string String_string_iso x5 x6 -> @rel_iso (option x1) (imported_option x2) (@option_iso x1 x2 hx) (x3 x5) (x4 x6))
    (x5 : String.string) (x6 : imported_String_string) (hx1 : @rel_iso String.string imported_String_string String_string_iso x5 x6) (x7 : x1) (x8 : x2) (hx2 : @rel_iso x1 x2 hx x7 x8) 
    (x9 : x1) (x10 : x2) (hx3 : @rel_iso x1 x2 hx x9 x10),
  @rel_iso (@Original.LF_DOT_Maps.LF.Maps.update x1 (@Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x7) x5 x9 = @Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x9)
    (@imported_Corelib_Init_Logic_eq (imported_String_string -> imported_option x2)
       (fun x12 : imported_String_string =>
        @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x0 : imported_String_string => x4 x0) x6 x8 x) x6
          x10 x12)
       (fun x12 : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x : imported_String_string => x4 x) x6 x10 x12))
    (@Corelib_Init_Logic_eq_iso (String.string -> option x1) (imported_String_string -> imported_option x2)
       (@IsoArrow String.string imported_String_string String_string_iso (option x1) (imported_option x2) (@option_iso x1 x2 hx))
       (@Original.LF_DOT_Maps.LF.Maps.update x1 (@Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x7) x5 x9)
       (fun x12 : imported_String_string =>
        @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x0 : imported_String_string => x4 x0) x6 x8 x) x6
          x10 x12)
       (@IsoFunND String.string imported_String_string String_string_iso (option x1) (imported_option x2) (@option_iso x1 x2 hx)
          (@Original.LF_DOT_Maps.LF.Maps.update x1 (@Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x7) x5 x9)
          (fun x12 : imported_String_string =>
           @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x0 : imported_String_string => x4 x0) x6 x8 x)
             x6 x10 x12)
          (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : @rel_iso String.string imported_String_string String_string_iso x11 x12) =>
           @Original_LF__DOT__Maps_LF_Maps_update_iso x1 x2 hx (@Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x7)
             (fun x : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x0 : imported_String_string => x4 x0) x6 x8 x)
             (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : @rel_iso String.string imported_String_string String_string_iso x13 x14) =>
              @Original_LF__DOT__Maps_LF_Maps_update_iso x1 x2 hx x3 (fun x : imported_String_string => x4 x)
                (fun (x15 : String.string) (x16 : imported_String_string) (hx6 : @rel_iso String.string imported_String_string String_string_iso x15 x16) => hx0 x15 x16 hx6) x5 x6 hx1 x7 x8 hx2 x13
                x14 hx5)
             x5 x6 hx1 x9 x10 hx3 x11 x12 hx4))
       (@Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x9) (fun x12 : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x : imported_String_string => x4 x) x6 x10 x12)
       (@IsoFunND String.string imported_String_string String_string_iso (option x1) (imported_option x2) (@option_iso x1 x2 hx) (@Original.LF_DOT_Maps.LF.Maps.update x1 x3 x5 x9)
          (fun x12 : imported_String_string => @imported_Original_LF__DOT__Maps_LF_Maps_update x2 (fun x : imported_String_string => x4 x) x6 x10 x12)
          (fun (x11 : String.string) (x12 : imported_String_string) (hx4 : @rel_iso String.string imported_String_string String_string_iso x11 x12) =>
           @Original_LF__DOT__Maps_LF_Maps_update_iso x1 x2 hx x3 (fun x : imported_String_string => x4 x)
             (fun (x13 : String.string) (x14 : imported_String_string) (hx5 : @rel_iso String.string imported_String_string String_string_iso x13 x14) => hx0 x13 x14 hx5) x5 x6 hx1 x9 x10 hx3 x11 x12
             hx4)))
    (Original.LF_DOT_Maps.LF.Maps.update_shadow x1 x3 x5 x7 x9) (@imported_Original_LF__DOT__Maps_LF_Maps_update__shadow x2 x4 x6 x8 x10).
Proof.
  (* The goal reduces to an SProp equality after unfolding rel_iso.
     Since SProp has proof irrelevance, any two proofs of the same SProp type are equal. *)
  intros.
  simpl. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Maps.LF.Maps.update_shadow := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Maps_LF_Maps_update__shadow := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Maps.LF.Maps.update_shadow Original_LF__DOT__Maps_LF_Maps_update__shadow_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Maps.LF.Maps.update_shadow Imported.Original_LF__DOT__Maps_LF_Maps_update__shadow Original_LF__DOT__Maps_LF_Maps_update__shadow_iso := {}.