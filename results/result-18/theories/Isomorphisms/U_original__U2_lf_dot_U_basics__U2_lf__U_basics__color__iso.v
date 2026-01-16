From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__rgb__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_color : Type := Imported.Original_LF__DOT__Basics_LF_Basics_color.

Definition color_to (x : Original.LF_DOT_Basics.LF.Basics.color) : imported_Original_LF__DOT__Basics_LF_Basics_color :=
  match x with
  | Original.LF_DOT_Basics.LF.Basics.black => Imported.Original_LF__DOT__Basics_LF_Basics_color_black
  | Original.LF_DOT_Basics.LF.Basics.white => Imported.Original_LF__DOT__Basics_LF_Basics_color_white
  | Original.LF_DOT_Basics.LF.Basics.primary p => 
      Imported.Original_LF__DOT__Basics_LF_Basics_color_primary (to Original_LF__DOT__Basics_LF_Basics_rgb_iso p)
  end.

Definition color_from (y : imported_Original_LF__DOT__Basics_LF_Basics_color) : Original.LF_DOT_Basics.LF.Basics.color :=
  match y with
  | Imported.Original_LF__DOT__Basics_LF_Basics_color_black => Original.LF_DOT_Basics.LF.Basics.black
  | Imported.Original_LF__DOT__Basics_LF_Basics_color_white => Original.LF_DOT_Basics.LF.Basics.white
  | Imported.Original_LF__DOT__Basics_LF_Basics_color_primary p =>
      Original.LF_DOT_Basics.LF.Basics.primary (from Original_LF__DOT__Basics_LF_Basics_rgb_iso p)
  end.

Instance Original_LF__DOT__Basics_LF_Basics_color_iso : Iso Original.LF_DOT_Basics.LF.Basics.color imported_Original_LF__DOT__Basics_LF_Basics_color.
Proof.
  apply Build_Iso with (to := color_to) (from := color_from).
  - (* to_from: forall x : B, eq (to (from x)) x *)
    (* x : imported type, we need to show color_to (color_from x) = x *)
    intros x.
    refine (match x as x0 return IsomorphismDefinitions.eq (color_to (color_from x0)) x0 with
            | Imported.Original_LF__DOT__Basics_LF_Basics_color_black => _
            | Imported.Original_LF__DOT__Basics_LF_Basics_color_white => _
            | Imported.Original_LF__DOT__Basics_LF_Basics_color_primary r => _
            end).
    + apply IsomorphismDefinitions.eq_refl.
    + apply IsomorphismDefinitions.eq_refl.
    + simpl. unfold color_to, color_from.
      (* r : Imported.rgb, need to show to (from r) = r for rgb *)
      apply (f_equal Imported.Original_LF__DOT__Basics_LF_Basics_color_primary).
      apply (to_from Original_LF__DOT__Basics_LF_Basics_rgb_iso r).
  - (* from_to: forall x : A, eq (from (to x)) x *)
    (* x : original type, we need to show color_from (color_to x) = x *)
    intros x.
    refine (match x as x0 return IsomorphismDefinitions.eq (color_from (color_to x0)) x0 with
            | Original.LF_DOT_Basics.LF.Basics.black => _
            | Original.LF_DOT_Basics.LF.Basics.white => _
            | Original.LF_DOT_Basics.LF.Basics.primary r => _
            end).
    + apply IsomorphismDefinitions.eq_refl.
    + apply IsomorphismDefinitions.eq_refl.
    + simpl. unfold color_to, color_from.
      (* r : Original.rgb, need to show from (to r) = r for rgb *)
      apply (f_equal Original.LF_DOT_Basics.LF.Basics.primary).
      apply (from_to Original_LF__DOT__Basics_LF_Basics_rgb_iso r).
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.color := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_color := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.color Original_LF__DOT__Basics_LF_Basics_color_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.color Imported.Original_LF__DOT__Basics_LF_Basics_color Original_LF__DOT__Basics_LF_Basics_color_iso := {}.