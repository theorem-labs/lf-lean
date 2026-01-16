From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* (* Typeclasses Opaque rel_iso *). *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE : Type -> Type := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE.

Definition string_to_imported (s : String.string) : Imported.String_string :=
  String_string_iso.(to) s.

Definition string_from_imported (s : Imported.String_string) : String.string :=
  String_string_iso.(from) s.

Instance Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso : forall x1 x2 : Type, Iso x1 x2 -> Iso (Original.LF_DOT_ImpParser.LF.ImpParser.optionE x1) (imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE x2).
Proof.
  intros x1 x2 hx.
  exists (fun o => match o with
                   | Original.LF_DOT_ImpParser.LF.ImpParser.SomeE x => 
                       Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE x2 (hx.(to) x)
                   | Original.LF_DOT_ImpParser.LF.ImpParser.NoneE s => 
                       Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE x2 (string_to_imported s)
                   end)
         (fun o => match o with
                   | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE _ x => 
                       Original.LF_DOT_ImpParser.LF.ImpParser.SomeE (hx.(from) x)
                   | Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE _ s => 
                       Original.LF_DOT_ImpParser.LF.ImpParser.NoneE (string_from_imported s)
                   end).
  - intros o.
    destruct o as [x | s].
    + simpl. apply (IsoEq.f_equal (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_SomeE x2)).
      apply hx.(to_from).
    + simpl. apply (IsoEq.f_equal (Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE_NoneE x2)).
      apply String_string_iso.(to_from).
  - intros o.
    destruct o as [x | s].
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_ImpParser.LF.ImpParser.SomeE).
      apply hx.(from_to).
    + simpl. apply (IsoEq.f_equal Original.LF_DOT_ImpParser.LF.ImpParser.NoneE).
      apply String_string_iso.(from_to).
Defined.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.optionE := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.optionE Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.optionE Imported.Original_LF__DOT__ImpParser_LF_ImpParser_optionE Original_LF__DOT__ImpParser_LF_ImpParser_optionE_iso := {}.