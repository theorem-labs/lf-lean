From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__andb__iso.

Definition imported_Original_LF__DOT__Basics_LF_Basics_andb3__exchange : forall x x0 x1 : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_andb (imported_Original_LF__DOT__Basics_LF_Basics_andb x x0) x1)
    (imported_Original_LF__DOT__Basics_LF_Basics_andb (imported_Original_LF__DOT__Basics_LF_Basics_andb x x1) x0) := Imported.Original_LF__DOT__Basics_LF_Basics_andb3__exchange.
Instance Original_LF__DOT__Basics_LF_Basics_andb3__exchange_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2)
    (x3 : Original.LF_DOT_Basics.LF.Basics.bool) (x4 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx0 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x3 x4)
    (x5 : Original.LF_DOT_Basics.LF.Basics.bool) (x6 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx1 : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x5 x6),
  rel_iso
    (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx0) hx1)
       (Original_LF__DOT__Basics_LF_Basics_andb_iso (Original_LF__DOT__Basics_LF_Basics_andb_iso hx hx1) hx0))
    (Original.LF_DOT_Basics.LF.Basics.andb3_exchange x1 x3 x5) (imported_Original_LF__DOT__Basics_LF_Basics_andb3__exchange x2 x4 x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Basics.LF.Basics.andb3_exchange := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Basics_LF_Basics_andb3__exchange := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Basics.LF.Basics.andb3_exchange Original_LF__DOT__Basics_LF_Basics_andb3__exchange_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Basics.LF.Basics.andb3_exchange Imported.Original_LF__DOT__Basics_LF_Basics_andb3__exchange Original_LF__DOT__Basics_LF_Basics_andb3__exchange_iso := {}.