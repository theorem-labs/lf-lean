From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__repeats__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__excluded____middle__iso Isomorphisms.lt__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle : (forall x : SProp, imported_or x (x -> imported_False)) ->
  forall (x0 : Type) (x1 x2 : imported_Original_LF__DOT__Poly_LF_Poly_list x0),
  (forall x : x0, imported_Original_LF__DOT__Logic_LF_Logic_In x x1 -> imported_Original_LF__DOT__Logic_LF_Logic_In x x2) ->
  imported_lt (imported_Original_LF__DOT__Poly_LF_Poly_length x2) (imported_Original_LF__DOT__Poly_LF_Poly_length x1) -> imported_Original_LF__DOT__IndProp_LF_IndProp_repeats x1 := Imported.Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle.
Instance Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle_iso : forall (x1 : Original.LF_DOT_Logic.LF.Logic.excluded_middle) (x2 : forall x : SProp, imported_or x (x -> imported_False)),
  (forall (x3 : Prop) (x4 : SProp) (hx : Iso x3 x4),
   rel_iso
     {|
       to := or_iso hx (IsoArrow hx False_iso);
       from := from (or_iso hx (IsoArrow hx False_iso));
       to_from := fun x : imported_or x4 (x4 -> imported_False) => to_from (or_iso hx (IsoArrow hx False_iso)) x;
       from_to := fun x : x3 \/ ~ x3 => seq_p_of_t (from_to (or_iso hx (IsoArrow hx False_iso)) x)
     |} (x1 x3) (x2 x4)) ->
  forall (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x3) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x4)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) x5 x6) (x7 : Original.LF_DOT_Poly.LF.Poly.list x3) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x4)
    (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx0) x7 x8) (x9 : forall x : x3, Original.LF_DOT_Logic.LF.Logic.In x x5 -> Original.LF_DOT_Logic.LF.Logic.In x x7)
    (x10 : forall x : x4, imported_Original_LF__DOT__Logic_LF_Logic_In x x6 -> imported_Original_LF__DOT__Logic_LF_Logic_In x x8),
  (forall (x11 : x3) (x12 : x4) (hx3 : rel_iso hx0 x11 x12) (x13 : Original.LF_DOT_Logic.LF.Logic.In x11 x5) (x14 : imported_Original_LF__DOT__Logic_LF_Logic_In x12 x6),
   rel_iso
     {|
       to := Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx1;
       from := from (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx1);
       to_from := fun x : imported_Original_LF__DOT__Logic_LF_Logic_In x12 x6 => to_from (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx1) x;
       from_to := fun x : Original.LF_DOT_Logic.LF.Logic.In x11 x5 => seq_p_of_t (from_to (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx1) x)
     |} x13 x14 ->
   rel_iso
     {|
       to := Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx2;
       from := from (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx2);
       to_from := fun x : imported_Original_LF__DOT__Logic_LF_Logic_In x12 x8 => to_from (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx2) x;
       from_to := fun x : Original.LF_DOT_Logic.LF.Logic.In x11 x7 => seq_p_of_t (from_to (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx2) x)
     |} (x9 x11 x13) (x10 x12 x14)) ->
  forall (x11 : Original.LF_DOT_Poly.LF.Poly.length x7 < Original.LF_DOT_Poly.LF.Poly.length x5)
    (x12 : imported_lt (imported_Original_LF__DOT__Poly_LF_Poly_length x8) (imported_Original_LF__DOT__Poly_LF_Poly_length x6)),
  rel_iso
    {|
      to := lt_iso (Original_LF__DOT__Poly_LF_Poly_length_iso hx2) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1);
      from := from (lt_iso (Original_LF__DOT__Poly_LF_Poly_length_iso hx2) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1));
      to_from :=
        fun x : imported_lt (imported_Original_LF__DOT__Poly_LF_Poly_length x8) (imported_Original_LF__DOT__Poly_LF_Poly_length x6) =>
        to_from (lt_iso (Original_LF__DOT__Poly_LF_Poly_length_iso hx2) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1)) x;
      from_to :=
        fun x : Original.LF_DOT_Poly.LF.Poly.length x7 < Original.LF_DOT_Poly.LF.Poly.length x5 =>
        seq_p_of_t (from_to (lt_iso (Original_LF__DOT__Poly_LF_Poly_length_iso hx2) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1)) x)
    |} x11 x12 ->
  rel_iso
    {|
      to := Original_LF__DOT__IndProp_LF_IndProp_repeats_iso hx1;
      from := from (Original_LF__DOT__IndProp_LF_IndProp_repeats_iso hx1);
      to_from := fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_repeats x6 => to_from (Original_LF__DOT__IndProp_LF_IndProp_repeats_iso hx1) x;
      from_to := fun x : Original.LF_DOT_IndProp.LF.IndProp.repeats x5 => seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_repeats_iso hx1) x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.pigeonhole_principle x1 x3 x5 x7 x9 x11) (imported_Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle x2 x10 x12).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.pigeonhole_principle := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.pigeonhole_principle Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.pigeonhole_principle Imported.Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle Original_LF__DOT__IndProp_LF_IndProp_pigeonhole__principle_iso := {}.