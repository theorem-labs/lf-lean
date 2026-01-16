From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__Basics_LF_Basics_bin : Type := Imported.Original_LF__DOT__Basics_LF_Basics_bin.

(* Define forward direction: Original -> Imported *)
Fixpoint bin_to_imported (b : Original.LF_DOT_Basics.LF.Basics.bin) : imported_Original_LF__DOT__Basics_LF_Basics_bin :=
  match b with
  | Original.LF_DOT_Basics.LF.Basics.Z => Imported.Original_LF__DOT__Basics_LF_Basics_bin_Z
  | Original.LF_DOT_Basics.LF.Basics.B0 n => Imported.Original_LF__DOT__Basics_LF_Basics_bin_B0 (bin_to_imported n)
  | Original.LF_DOT_Basics.LF.Basics.B1 n => Imported.Original_LF__DOT__Basics_LF_Basics_bin_B1 (bin_to_imported n)
  end.

(* Define backward direction: Imported -> Original *)
Fixpoint imported_to_bin (b : imported_Original_LF__DOT__Basics_LF_Basics_bin) : Original.LF_DOT_Basics.LF.Basics.bin :=
  match b with
  | Imported.Original_LF__DOT__Basics_LF_Basics_bin_Z => Original.LF_DOT_Basics.LF.Basics.Z
  | Imported.Original_LF__DOT__Basics_LF_Basics_bin_B0 n => Original.LF_DOT_Basics.LF.Basics.B0 (imported_to_bin n)
  | Imported.Original_LF__DOT__Basics_LF_Basics_bin_B1 n => Original.LF_DOT_Basics.LF.Basics.B1 (imported_to_bin n)
  end.

(* Helper to convert Logic.eq to IsomorphismDefinitions.eq *)
Lemma logic_eq_to_iso_eq : forall (A : Type) (x y : A), Logic.eq x y -> IsomorphismDefinitions.eq x y.
Proof.
  intros A x y H. destruct H. apply IsomorphismDefinitions.eq_refl.
Qed.

(* Prove roundtrip properties with Logic.eq *)
Lemma roundtrip1 : forall b, Logic.eq (imported_to_bin (bin_to_imported b)) b.
Proof. 
  induction b; simpl;
  [ reflexivity
  | f_equal; exact IHb
  | f_equal; exact IHb
  ].
Qed.

Lemma roundtrip2 : forall b, Logic.eq (bin_to_imported (imported_to_bin b)) b.
Proof. 
  induction b; simpl;
  [ reflexivity
  | f_equal; exact IHb
  | f_equal; exact IHb
  ].
Qed.

Instance Original_LF__DOT__Basics_LF_Basics_bin_iso : Iso Original.LF_DOT_Basics.LF.Basics.bin imported_Original_LF__DOT__Basics_LF_Basics_bin.
Proof.
  refine {| to := bin_to_imported;
            from := imported_to_bin;
            to_from := _;
            from_to := _
         |}.
  - intro x. apply logic_eq_to_iso_eq. apply roundtrip2.
  - intro x. apply logic_eq_to_iso_eq. apply roundtrip1.
Defined.

Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_bin := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.bin Original_LF__DOT__Basics_LF_Basics_bin_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.bin Imported.Original_LF__DOT__Basics_LF_Basics_bin Original_LF__DOT__Basics_LF_Basics_bin_iso := {}.