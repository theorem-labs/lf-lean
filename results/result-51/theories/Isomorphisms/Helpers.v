From IsomorphismChecker Require Import EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From IsomorphismChecker Require Imported.

(* Helper to convert from Imported.Corelib_Init_Logic_eq to Logic.eq *)
Lemma imported_eq_to_eq : forall A (x y : A), Imported.Corelib_Init_Logic_eq A x y -> x = y.
Proof. intros A x y H. apply LeanEq.eq_of_seq. destruct H. reflexivity. Qed.

(* Helper to convert from Imported.Corelib_Init_Logic_eq to IsomorphismDefinitions.eq *)
Lemma imported_eq_to_seq : forall A (x y : A), Imported.Corelib_Init_Logic_eq A x y -> IsomorphismDefinitions.eq x y.
Proof. intros A x y H. apply seq_of_eq. apply imported_eq_to_eq. exact H. Qed.
