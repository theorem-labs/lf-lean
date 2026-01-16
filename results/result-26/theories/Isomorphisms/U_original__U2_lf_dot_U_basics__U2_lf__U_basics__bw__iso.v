From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__Basics_LF_Basics_bw : Type := Imported.Original_LF__DOT__Basics_LF_Basics_bw.

(* Define forward and backward functions *)
Definition bw_to_imported (x : Original.LF_DOT_Basics.LF.Basics.bw) : imported_Original_LF__DOT__Basics_LF_Basics_bw :=
  match x with
  | Original.LF_DOT_Basics.LF.Basics.bw_black => Imported.Original_LF__DOT__Basics_LF_Basics_bw_bw_black
  | Original.LF_DOT_Basics.LF.Basics.bw_white => Imported.Original_LF__DOT__Basics_LF_Basics_bw_bw_white
  end.

Definition imported_to_bw (x : imported_Original_LF__DOT__Basics_LF_Basics_bw) : Original.LF_DOT_Basics.LF.Basics.bw :=
  match x with
  | Imported.Original_LF__DOT__Basics_LF_Basics_bw_bw_black => Original.LF_DOT_Basics.LF.Basics.bw_black
  | Imported.Original_LF__DOT__Basics_LF_Basics_bw_bw_white => Original.LF_DOT_Basics.LF.Basics.bw_white
  end.

Instance Original_LF__DOT__Basics_LF_Basics_bw_iso : Iso Original.LF_DOT_Basics.LF.Basics.bw imported_Original_LF__DOT__Basics_LF_Basics_bw := {|
  to := bw_to_imported;
  from := imported_to_bw;
  to_from := fun x => match x with
    | Imported.Original_LF__DOT__Basics_LF_Basics_bw_bw_black => IsomorphismDefinitions.eq_refl
    | Imported.Original_LF__DOT__Basics_LF_Basics_bw_bw_white => IsomorphismDefinitions.eq_refl
    end;
  from_to := fun x => match x with
    | Original.LF_DOT_Basics.LF.Basics.bw_black => IsomorphismDefinitions.eq_refl
    | Original.LF_DOT_Basics.LF.Basics.bw_white => IsomorphismDefinitions.eq_refl
    end
|}.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bw := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bw := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bw Original_LF__DOT__Basics_LF_Basics_bw_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bw Imported.Original_LF__DOT__Basics_LF_Basics_bw Original_LF__DOT__Basics_LF_Basics_bw_iso := {}.