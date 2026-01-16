From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_Original_LF__DOT__Basics_LF_Basics_rgb : Type := Imported.Original_LF__DOT__Basics_LF_Basics_rgb.
Instance Original_LF__DOT__Basics_LF_Basics_rgb_iso : Iso Original.LF_DOT_Basics.LF.Basics.rgb imported_Original_LF__DOT__Basics_LF_Basics_rgb.
Proof.
  apply Build_Iso with
    (to := fun x => match x with
                   | Original.LF_DOT_Basics.LF.Basics.red => Imported.Original_LF__DOT__Basics_LF_Basics_rgb_red
                   | Original.LF_DOT_Basics.LF.Basics.green => Imported.Original_LF__DOT__Basics_LF_Basics_rgb_green
                   | Original.LF_DOT_Basics.LF.Basics.blue => Imported.Original_LF__DOT__Basics_LF_Basics_rgb_blue
                   end)
    (from := fun y => match y with
                     | Imported.Original_LF__DOT__Basics_LF_Basics_rgb_red => Original.LF_DOT_Basics.LF.Basics.red
                     | Imported.Original_LF__DOT__Basics_LF_Basics_rgb_green => Original.LF_DOT_Basics.LF.Basics.green
                     | Imported.Original_LF__DOT__Basics_LF_Basics_rgb_blue => Original.LF_DOT_Basics.LF.Basics.blue
                     end).
  - (* to_from *)
    intros x.
    destruct x; apply IsomorphismDefinitions.eq_refl.
  - (* from_to *)
    intros x.
    destruct x; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_rgb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.rgb Original_LF__DOT__Basics_LF_Basics_rgb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.rgb Imported.Original_LF__DOT__Basics_LF_Basics_rgb Original_LF__DOT__Basics_LF_Basics_rgb_iso := {}.