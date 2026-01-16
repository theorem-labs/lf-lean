From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__excluded____middle__iso Isomorphisms.ex__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_not__exists__dist : (forall x : SProp, imported_or x (x -> imported_False)) -> forall (x0 : Type) (x1 : x0 -> SProp), (imported_ex (fun H : x0 => x1 H -> imported_False) -> imported_False) -> forall x3 : x0, x1 x3 := Imported.Original_LF__DOT__Logic_LF_Logic_not__exists__dist.
Instance Original_LF__DOT__Logic_LF_Logic_not__exists__dist_iso : forall (x1 : Original.LF_DOT_Logic.LF.Logic.excluded_middle) (x2 : forall x : SProp, imported_or x (x -> imported_False)),
  (forall (x3 : Prop) (x4 : SProp) (hx : Iso x3 x4),
   rel_iso
     {|
       to := or_iso hx (IsoArrow hx False_iso);
       from := from (or_iso hx (IsoArrow hx False_iso));
       to_from := fun x : imported_or x4 (x4 -> imported_False) => to_from (or_iso hx (IsoArrow hx False_iso)) x;
       from_to := fun x : x3 \/ ~ x3 => seq_p_of_t (from_to (or_iso hx (IsoArrow hx False_iso)) x)
     |} (x1 x3) (x2 x4)) ->
  forall (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x3 -> Prop) (x6 : x4 -> SProp) (hx1 : forall (x7 : x3) (x8 : x4), rel_iso hx0 x7 x8 -> Iso (x5 x7) (x6 x8)) (x7 : ~ (exists x : x3, ~ x5 x))
    (x8 : imported_ex (fun H : x4 => x6 H -> imported_False) -> imported_False),
  (forall (x9 : exists x : x3, x5 x -> False) (x10 : imported_ex (fun H : x4 => x6 H -> imported_False)),
   rel_iso
     {|
       to := ex_iso (fun x : x3 => x5 x -> False) (fun H : x4 => x6 H -> imported_False) (fun (x11 : x3) (x12 : x4) (hx2 : rel_iso hx0 x11 x12) => IsoArrow (hx1 x11 x12 hx2) False_iso);
       from := from (ex_iso (fun x : x3 => x5 x -> False) (fun H : x4 => x6 H -> imported_False) (fun (x11 : x3) (x12 : x4) (hx2 : rel_iso hx0 x11 x12) => IsoArrow (hx1 x11 x12 hx2) False_iso));
       to_from :=
         fun x : imported_ex (fun H : x4 => x6 H -> imported_False) =>
         to_from (ex_iso (fun x0 : x3 => x5 x0 -> False) (fun H : x4 => x6 H -> imported_False) (fun (x11 : x3) (x12 : x4) (hx2 : rel_iso hx0 x11 x12) => IsoArrow (hx1 x11 x12 hx2) False_iso)) x;
       from_to :=
         fun x : exists y : x3, x5 y -> False =>
         seq_p_of_t
           (from_to (ex_iso (fun x0 : x3 => x5 x0 -> False) (fun H : x4 => x6 H -> imported_False) (fun (x11 : x3) (x12 : x4) (hx2 : rel_iso hx0 x11 x12) => IsoArrow (hx1 x11 x12 hx2) False_iso)) x)
     |} x9 x10 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x7 x9) (x8 x10)) ->
  forall (x9 : x3) (x10 : x4) (hx3 : rel_iso hx0 x9 x10),
  rel_iso (hx1 x9 x10 hx3) (Original.LF_DOT_Logic.LF.Logic.not_exists_dist x1 x3 x5 x7 x9) (imported_Original_LF__DOT__Logic_LF_Logic_not__exists__dist x2 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_exists_dist := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__exists__dist := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_exists_dist Original_LF__DOT__Logic_LF_Logic_not__exists__dist_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_exists_dist Imported.Original_LF__DOT__Logic_LF_Logic_not__exists__dist Original_LF__DOT__Logic_LF_Logic_not__exists__dist_iso := {}.