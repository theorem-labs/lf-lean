From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_string__string__iso.

Monomorphic Definition imported_String_EmptyString : imported_String_string := Imported.String_EmptyString.
Monomorphic Instance String_EmptyString_iso : rel_iso String_string_iso String.EmptyString imported_String_EmptyString.
Admitted.
Instance: KnownConstant String.EmptyString := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.String_EmptyString := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor String.EmptyString String_EmptyString_iso := {}.
Instance: IsoStatementProofBetween String.EmptyString Imported.String_EmptyString String_EmptyString_iso := {}.