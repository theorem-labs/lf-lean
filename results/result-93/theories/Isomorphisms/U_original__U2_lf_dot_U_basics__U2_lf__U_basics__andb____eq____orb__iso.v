From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Typeclasses Opaque rel_iso. *) (* for speed *)

From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__andb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__orb__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_andb__eq__orb : forall x x0 : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_andb x x0) (imported_Original_LF__DOT__Basics_LF_Basics_orb x x0) ->
  imported_Corelib_Init_Logic_eq x x0 := Imported.Original_LF__DOT__Basics_LF_Basics_andb__eq__orb.

Instance Original_LF__DOT__Basics_LF_Basics_andb__eq__orb_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2)
    (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4)
    (x5 : Original.LF_DOT_Basics.LF.Basics.andb x1 x3 = Original.LF_DOT_Basics.LF.Basics.orb x1 x3)
    (x6 : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_andb x2 x4) (imported_Original_LF__DOT__Basics_LF_Basics_orb x2 x4)),
  rel_iso (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0) (Original_LF__DOT__Basics_LF_Basics_orb_iso hx hx0)) x5 x6 ->
  rel_iso (Corelib_Init_Logic_eq_iso hx hx0) (Original.LF_DOT_Basics.LF.Basics.andb_eq_orb x1 x3 x5) (imported_Original_LF__DOT__Basics_LF_Basics_andb__eq__orb x2 x4 x6).
Proof.
  intros x1 x2 hx x3 x4 hx0 x5 x6 H_eq_rel.
  constructor. simpl.
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.andb_eq_orb := {}.
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_andb__eq__orb := {}.
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.andb_eq_orb Original_LF__DOT__Basics_LF_Basics_andb__eq__orb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.andb_eq_orb imported_Original_LF__DOT__Basics_LF_Basics_andb__eq__orb Original_LF__DOT__Basics_LF_Basics_andb__eq__orb_iso := {}.
