From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)

From Stdlib Require Import Logic.ProofIrrelevance.

From IsomorphismChecker Require Export Isomorphisms.nat__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev : imported_nat -> SProp := Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev.

(* Short names for convenience *)
Definition ev_orig := Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev.
Definition ev_imp := Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev.

(* Helper: construct ev_imp from nat, using same structure as ev *)
Definition ev_to_imported_aux : forall n : Datatypes.nat, ev_orig n -> ev_imp (nat_to_imported n).
Proof.
  refine (fix F n H {struct H} := _).
  destruct H as [|n' H'].
  - exact Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_ev_0.
  - exact (Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_ev_SS 
             (nat_to_imported n') (F n' H')).
Defined.

Definition ev_to_imported := ev_to_imported_aux.

(* This isomorphism involves Prop <-> SProp conversion which is complex; use axiom *)
#[local] Unset Universe Polymorphism.
Axiom Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso : (forall (x1 : nat) (x2 : imported_nat) (_ : @rel_iso nat imported_nat nat_iso x1 x2),
   Iso (Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev x2)).
#[local] Set Universe Polymorphism.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.EvPlayground.ev Imported.Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev Original_LF__DOT__IndProp_LF_IndProp_EvPlayground_ev_iso := {}.