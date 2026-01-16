From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


Definition imported_and : SProp -> SProp -> SProp := Imported.and.

(* Projections for and *)
Definition proj1_and {a b : SProp} (p : Imported.and a b) : a :=
  Imported.a____at___Solution__hyg2206 a b p.
Definition proj2_and {a b : SProp} (p : Imported.and a b) : b :=
  Imported.a____at___Solution__hyg2208 a b p.

Instance and_iso : (forall (x1 : Prop) (x2 : SProp) (_ : Iso x1 x2) (x3 : Prop) (x4 : SProp) (_ : Iso x3 x4), Iso (x1 /\ x3) (imported_and x2 x4)).
Proof.
  intros x1 x2 iso1 x3 x4 iso2.
  refine {| to := fun p => Imported.and_intro x2 x4 (iso1.(to) (proj1 p)) (iso2.(to) (proj2 p));
            from := fun p => conj (iso1.(from) (proj1_and p)) (iso2.(from) (proj2_and p)) |}.
  - intro x.
    apply Imported.and_indl.
    intros a b.
    simpl.
    apply IsomorphismDefinitions.eq_refl.
  - intro x. destruct x as [a b].
    simpl.
    pose proof (from_to iso1 a) as H1.
    pose proof (from_to iso2 b) as H2.
    exact (match H1 in IsomorphismDefinitions.eq _ a' return 
                 forall (H2' : IsomorphismDefinitions.eq (from iso2 (to iso2 b)) b),
                 IsomorphismDefinitions.eq (conj (from iso1 (to iso1 a)) (from iso2 (to iso2 b))) (conj a' b) with
           | IsomorphismDefinitions.eq_refl => 
             fun H2' => match H2' in IsomorphismDefinitions.eq _ b' return 
                              IsomorphismDefinitions.eq (conj (from iso1 (to iso1 a)) (from iso2 (to iso2 b))) (conj (from iso1 (to iso1 a)) b') with
                        | IsomorphismDefinitions.eq_refl => IsomorphismDefinitions.eq_refl
                        end
           end H2).
Defined.

Instance: KnownConstant Logic.and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.and := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Logic.and and_iso := {}.
Instance: IsoStatementProofBetween Logic.and Imported.and and_iso := {}.