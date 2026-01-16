From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_all__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.iff__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_All__In : forall (x : Type) (x0 : x -> SProp) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_iff (forall a' : x, imported_Original_LF__DOT__Logic_LF_Logic_In a' x1 -> x0 a') (imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x => x0 H) x1) := Imported.Original_LF__DOT__Logic_LF_Logic_All__In.
Instance Original_LF__DOT__Logic_LF_Logic_All__In_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : x1 -> Prop) (x4 : x2 -> SProp) (hx0 : forall (x5 : x1) (x6 : x2), rel_iso hx x5 x6 -> Iso (x3 x5) (x4 x6)) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1)
    (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6),
  rel_iso
    {|
      to :=
        iff_iso
          (IsoForall (fun a : x1 => Original.LF_DOT_Logic.LF.Logic.In a x5 -> x3 a) (fun a' : x2 => imported_Original_LF__DOT__Logic_LF_Logic_In a' x6 -> x4 a')
             (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => IsoArrow (Original_LF__DOT__Logic_LF_Logic_In_iso hx2 hx1) (hx0 x7 x8 hx2)))
          (Original_LF__DOT__Logic_LF_Logic_All_iso x3 (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1);
      from :=
        from
          (iff_iso
             (IsoForall (fun a : x1 => Original.LF_DOT_Logic.LF.Logic.In a x5 -> x3 a) (fun a' : x2 => imported_Original_LF__DOT__Logic_LF_Logic_In a' x6 -> x4 a')
                (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => IsoArrow (Original_LF__DOT__Logic_LF_Logic_In_iso hx2 hx1) (hx0 x7 x8 hx2)))
             (Original_LF__DOT__Logic_LF_Logic_All_iso x3 (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1));
      to_from :=
        fun x : imported_iff (forall a' : x2, imported_Original_LF__DOT__Logic_LF_Logic_In a' x6 -> x4 a') (imported_Original_LF__DOT__Logic_LF_Logic_All (fun H : x2 => x4 H) x6) =>
        to_from
          (iff_iso
             (IsoForall (fun a : x1 => Original.LF_DOT_Logic.LF.Logic.In a x5 -> x3 a) (fun a' : x2 => imported_Original_LF__DOT__Logic_LF_Logic_In a' x6 -> x4 a')
                (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => IsoArrow (Original_LF__DOT__Logic_LF_Logic_In_iso hx2 hx1) (hx0 x7 x8 hx2)))
             (Original_LF__DOT__Logic_LF_Logic_All_iso x3 (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1))
          x;
      from_to :=
        fun x : (forall x : x1, Original.LF_DOT_Logic.LF.Logic.In x x5 -> x3 x) <-> Original.LF_DOT_Logic.LF.Logic.All x3 x5 =>
        seq_p_of_t
          (from_to
             (iff_iso
                (IsoForall (fun a : x1 => Original.LF_DOT_Logic.LF.Logic.In a x5 -> x3 a) (fun a' : x2 => imported_Original_LF__DOT__Logic_LF_Logic_In a' x6 -> x4 a')
                   (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => IsoArrow (Original_LF__DOT__Logic_LF_Logic_In_iso hx2 hx1) (hx0 x7 x8 hx2)))
                (Original_LF__DOT__Logic_LF_Logic_All_iso x3 (fun H : x2 => x4 H) (fun (x7 : x1) (x8 : x2) (hx2 : rel_iso hx x7 x8) => hx0 x7 x8 hx2) hx1))
             x)
    |} (Original.LF_DOT_Logic.LF.Logic.All_In x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_All__In x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.All_In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_All__In := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.All_In Original_LF__DOT__Logic_LF_Logic_All__In_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.All_In Imported.Original_LF__DOT__Logic_LF_Logic_All__In Original_LF__DOT__Logic_LF_Logic_All__In_iso := {}.