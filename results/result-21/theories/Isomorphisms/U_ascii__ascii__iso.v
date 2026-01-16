From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.

Definition imported_to_ascii (a : Imported.Ascii_ascii) : Ascii.ascii :=
  match a with
  | Imported.Ascii_ascii_Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Ascii.Ascii 
      match b0 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b1 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b2 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b3 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b4 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b5 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b6 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
      match b7 with Imported.Stdlib_bool_true => true | Imported.Stdlib_bool_false => false end
  end.

Definition ascii_to_imported (a : Ascii.ascii) : Imported.Ascii_ascii :=
  match a with
  | Ascii.Ascii b0 b1 b2 b3 b4 b5 b6 b7 =>
    Imported.Ascii_ascii_Ascii
      match b0 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b1 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b2 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b3 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b4 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b5 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b6 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
      match b7 with true => Imported.Stdlib_bool_true | false => Imported.Stdlib_bool_false end
  end.

Definition imported_Ascii_ascii : Type := Imported.Ascii_ascii.

Instance Ascii_ascii_iso : Iso Ascii.ascii imported_Ascii_ascii.
Proof.
  apply Build_Iso with (to := ascii_to_imported) (from := imported_to_ascii).
  - intro a. 
    destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
    destruct b0, b1, b2, b3, b4, b5, b6, b7; apply IsomorphismDefinitions.eq_refl.
  - intro a.
    destruct a as [b0 b1 b2 b3 b4 b5 b6 b7].
    destruct b0, b1, b2, b3, b4, b5, b6, b7; apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Ascii.ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Ascii_ascii := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Ascii.ascii Ascii_ascii_iso := {}.
Instance: IsoStatementProofBetween Ascii.ascii Imported.Ascii_ascii Ascii_ascii_iso := {}.