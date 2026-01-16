From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and : SProp -> SProp -> SProp := Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and.

Definition to_fn (x1 : Prop) (x2 : SProp) (iso12 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (iso34 : Iso x3 x4) :
  Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and x1 x3 -> imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and x2 x4.
Proof.
  intro pf.
  destruct pf as [p q].
  exact (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_intro x2 x4 (iso12.(to) p) (iso34.(to) q)).
Defined.

Definition from_fn (x1 : Prop) (x2 : SProp) (iso12 : Iso x1 x2) (x3 : Prop) (x4 : SProp) (iso34 : Iso x3 x4) :
  imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and x2 x4 -> Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and x1 x3.
Proof.
  intro pf.
  destruct pf as [p' q'].
  exact (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.conj x1 x3 (iso12.(from) p') (iso34.(from) q')).
Defined.

Instance Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_iso : forall (x1 : Prop) (x2 : SProp),
  Iso x1 x2 ->
  forall (x3 : Prop) (x4 : SProp), Iso x3 x4 -> Iso (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and x1 x3) (imported_Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and x2 x4).
Proof.
  intros x1 x2 iso12 x3 x4 iso34.
  refine {| to := to_fn iso12 iso34; from := from_fn iso12 iso34 |}.
  (* to_from: forall x, to (from x) = x *)
  { intro x.
    unfold to_fn, from_fn.
    destruct x as [p q].
    pose proof (to_from iso12 p) as H1.
    pose proof (to_from iso34 q) as H2.
    apply (IsoEq.f_equal2 (Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_intro x2 x4) H1 H2). }
  (* from_to: forall x, from (to x) = x *)  
  { intro x.
    unfold to_fn, from_fn.
    destruct x as [p q].
    pose proof (from_to iso12 p) as H1.
    pose proof (from_to iso34 q) as H2.
    apply (IsoEq.f_equal2 (Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.conj x1 x3) H1 H2). }
Defined.

Instance: KnownConstant Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ProofObjects.LF.ProofObjects.Props.And.and Imported.Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and Original_LF__DOT__ProofObjects_LF_ProofObjects_Props_And_and_iso := {}.