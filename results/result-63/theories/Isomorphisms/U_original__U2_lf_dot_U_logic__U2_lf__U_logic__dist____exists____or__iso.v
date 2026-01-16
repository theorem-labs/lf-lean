From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.ex__iso Isomorphisms.iff__iso Isomorphisms.or__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_dist__exists__or : forall (x : Type) (x0 x1 : x -> SProp), imported_iff (imported_ex (fun H : x => imported_or (x0 H) (x1 H))) (imported_or (imported_ex (fun H : x => x0 H)) (imported_ex (fun H : x => x1 H))) := Imported.Original_LF__DOT__Logic_LF_Logic_dist__exists__or.
Instance Original_LF__DOT__Logic_LF_Logic_dist__exists__or_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp) (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) (x5 : x1 -> Prop) 
    (x6 : x2 -> SProp) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> Iso (x5 x7) (x6 x8)),
  rel_iso
    {|
      to :=
        iff_iso (ex_iso (fun x : x1 => x3 x \/ x5 x) (fun H : x2 => imported_or (x4 H) (x6 H)) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => or_iso (hx0 x7 x8 hx2) (hx1 x7 x8 hx2)))
          (or_iso (ex_iso (fun x : x1 => x3 x) (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2))
             (ex_iso (fun x : x1 => x5 x) (fun H : x2 => x6 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx1 x7 x8 hx2)));
      from :=
        from
          (iff_iso (ex_iso (fun x : x1 => x3 x \/ x5 x) (fun H : x2 => imported_or (x4 H) (x6 H)) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => or_iso (hx0 x7 x8 hx2) (hx1 x7 x8 hx2)))
             (or_iso (ex_iso (fun x : x1 => x3 x) (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2))
                (ex_iso (fun x : x1 => x5 x) (fun H : x2 => x6 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx1 x7 x8 hx2))));
      to_from :=
        fun x : imported_iff (imported_ex (fun H : x2 => imported_or (x4 H) (x6 H))) (imported_or (imported_ex (fun H : x2 => x4 H)) (imported_ex (fun H : x2 => x6 H))) =>
        to_from
          (iff_iso (ex_iso (fun x0 : x1 => x3 x0 \/ x5 x0) (fun H : x2 => imported_or (x4 H) (x6 H)) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => or_iso (hx0 x7 x8 hx2) (hx1 x7 x8 hx2)))
             (or_iso (ex_iso (fun x0 : x1 => x3 x0) (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2))
                (ex_iso (fun x0 : x1 => x5 x0) (fun H : x2 => x6 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx1 x7 x8 hx2))))
          x;
      from_to :=
        fun x : (exists x : x1, x3 x \/ x5 x) <-> (exists x : x1, x3 x) \/ (exists x : x1, x5 x) =>
        seq_p_of_t
          (from_to
             (iff_iso (ex_iso (fun x0 : x1 => x3 x0 \/ x5 x0) (fun H : x2 => imported_or (x4 H) (x6 H)) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => or_iso (hx0 x7 x8 hx2) (hx1 x7 x8 hx2)))
                (or_iso (ex_iso (fun x0 : x1 => x3 x0) (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2))
                   (ex_iso (fun x0 : x1 => x5 x0) (fun H : x2 => x6 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx1 x7 x8 hx2))))
             x)
    |} (Original.LF_DOT_Logic.LF.Logic.dist_exists_or x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_dist__exists__or x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.dist_exists_or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_dist__exists__or := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.dist_exists_or Original_LF__DOT__Logic_LF_Logic_dist__exists__or_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.dist_exists_or Imported.Original_LF__DOT__Logic_LF_Logic_dist__exists__or Original_LF__DOT__Logic_LF_Logic_dist__exists__or_iso := {}.