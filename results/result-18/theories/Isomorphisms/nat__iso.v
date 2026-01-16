From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



Definition imported_nat : Type := Imported.nat.

(* Define the conversion functions *)
Fixpoint nat_to_imported (n : nat) : Imported.nat :=
  match n with
  | O => Imported.nat_O
  | S n' => Imported.nat_S (nat_to_imported n')
  end.

Fixpoint imported_to_nat (n : Imported.nat) : nat :=
  match n with
  | Imported.nat_O => O
  | Imported.nat_S n' => S (imported_to_nat n')
  end.

(* Prove round-trip properties with standard equality *)
Fixpoint nat_round_trip (n : nat) : imported_to_nat (nat_to_imported n) = n :=
  match n with
  | O => Coq.Init.Logic.eq_refl
  | S n' => match nat_round_trip n' in (_ = m) return (S (imported_to_nat (nat_to_imported n')) = S m) with
            | Coq.Init.Logic.eq_refl => Coq.Init.Logic.eq_refl
            end
  end.

Fixpoint imported_round_trip (n : Imported.nat) : nat_to_imported (imported_to_nat n) = n :=
  match n with
  | Imported.nat_O => Coq.Init.Logic.eq_refl
  | Imported.nat_S n' => match imported_round_trip n' in (_ = m) return (Imported.nat_S (nat_to_imported (imported_to_nat n')) = Imported.nat_S m) with
                         | Coq.Init.Logic.eq_refl => Coq.Init.Logic.eq_refl
                         end
  end.

(* Build the isomorphism *)
Instance nat_iso : Iso nat imported_nat := {|
  to := nat_to_imported;
  from := imported_to_nat;
  to_from := fun n => seq_of_eq (imported_round_trip n);
  from_to := fun n => seq_of_eq (nat_round_trip n)
|}.

Instance: KnownConstant nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.nat := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor nat nat_iso := {}.
Instance: IsoStatementProofBetween nat Imported.nat nat_iso := {}.
