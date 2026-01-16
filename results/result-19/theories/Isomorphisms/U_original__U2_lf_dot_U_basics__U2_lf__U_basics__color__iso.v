From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__rgb__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_color : Type := Imported.Original_LF__DOT__Basics_LF_Basics_color.
Instance Original_LF__DOT__Basics_LF_Basics_color_iso : Iso Original.LF_DOT_Basics.LF.Basics.color imported_Original_LF__DOT__Basics_LF_Basics_color.
Proof.
  apply Build_Iso with
    (to := fun x => match x with
                   | Original.LF_DOT_Basics.LF.Basics.black => Imported.Original_LF__DOT__Basics_LF_Basics_color_black
                   | Original.LF_DOT_Basics.LF.Basics.white => Imported.Original_LF__DOT__Basics_LF_Basics_color_white
                   | Original.LF_DOT_Basics.LF.Basics.primary p => 
                       Imported.Original_LF__DOT__Basics_LF_Basics_color_primary (to Original_LF__DOT__Basics_LF_Basics_rgb_iso p)
                   end)
    (from := fun y => match y with
                     | Imported.Original_LF__DOT__Basics_LF_Basics_color_black => Original.LF_DOT_Basics.LF.Basics.black
                     | Imported.Original_LF__DOT__Basics_LF_Basics_color_white => Original.LF_DOT_Basics.LF.Basics.white
                     | Imported.Original_LF__DOT__Basics_LF_Basics_color_primary p =>
                         Original.LF_DOT_Basics.LF.Basics.primary (from Original_LF__DOT__Basics_LF_Basics_rgb_iso p)
                     end).
  - (* to_from *)
    intros x.
    destruct x as [| | p]; try apply IsomorphismDefinitions.eq_refl.
    destruct p; apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intros x.
    destruct x as [| | p]; try apply IsomorphismDefinitions.eq_refl.
    destruct p; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.color := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_color := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.color Original_LF__DOT__Basics_LF_Basics_color_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.color Imported.Original_LF__DOT__Basics_LF_Basics_color Original_LF__DOT__Basics_LF_Basics_color_iso := {}.
