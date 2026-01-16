From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_nat__add__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__leb__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.ex__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_plus__exists__leb : forall x x0 : imported_nat,
  imported_ex (fun H : imported_nat => imported_Corelib_Init_Logic_eq x0 (imported_Nat_add x H)) ->
  imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x x0) imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Logic_LF_Logic_plus__exists__leb.
Instance Original_LF__DOT__Logic_LF_Logic_plus__exists__leb_iso : forall (x1 : nat) (x2 : imported_nat) (hx : rel_iso nat_iso x1 x2) (x3 : nat) (x4 : imported_nat) (hx0 : rel_iso nat_iso x3 x4) (x5 : exists x : nat, x3 = x1 + x)
    (x6 : imported_ex (fun H : imported_nat => imported_Corelib_Init_Logic_eq x4 (imported_Nat_add x2 H))),
  rel_iso
    {|
      to :=
        ex_iso (fun x : nat => x3 = x1 + x) (fun H : imported_nat => imported_Corelib_Init_Logic_eq x4 (imported_Nat_add x2 H))
          (fun (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8) => Corelib_Init_Logic_eq_iso hx0 (Nat_add_iso hx hx1));
      from :=
        from
          (ex_iso (fun x : nat => x3 = x1 + x) (fun H : imported_nat => imported_Corelib_Init_Logic_eq x4 (imported_Nat_add x2 H))
             (fun (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8) => Corelib_Init_Logic_eq_iso hx0 (Nat_add_iso hx hx1)));
      to_from :=
        fun x : imported_ex (fun H : imported_nat => imported_Corelib_Init_Logic_eq x4 (imported_Nat_add x2 H)) =>
        to_from
          (ex_iso (fun x0 : nat => x3 = x1 + x0) (fun H : imported_nat => imported_Corelib_Init_Logic_eq x4 (imported_Nat_add x2 H))
             (fun (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8) => Corelib_Init_Logic_eq_iso hx0 (Nat_add_iso hx hx1)))
          x;
      from_to :=
        fun x : exists y : nat, x3 = x1 + y =>
        seq_p_of_t
          (from_to
             (ex_iso (fun x0 : nat => x3 = x1 + x0) (fun H : imported_nat => imported_Corelib_Init_Logic_eq x4 (imported_Nat_add x2 H))
                (fun (x7 : nat) (x8 : imported_nat) (hx1 : rel_iso nat_iso x7 x8) => Corelib_Init_Logic_eq_iso hx0 (Nat_add_iso hx hx1)))
             x)
    |} x5 x6 ->
  rel_iso
    {|
      to := Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso;
      from := from (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso);
      to_from :=
        fun x : imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Basics_LF_Basics_leb x2 x4) imported_Original_LF__DOT__Basics_LF_Basics_true =>
        to_from (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) x;
      from_to :=
        fun x : Original.LF_DOT_Basics.LF.Basics.leb x1 x3 = Original.LF_DOT_Basics.LF.Basics.true =>
        seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso (Original_LF__DOT__Basics_LF_Basics_leb_iso hx hx0) Original_LF__DOT__Basics_LF_Basics_true_iso) x)
    |} (Original.LF_DOT_Logic.LF.Logic.plus_exists_leb x1 x3 x5) (imported_Original_LF__DOT__Logic_LF_Logic_plus__exists__leb x6).
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.plus_exists_leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_plus__exists__leb := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.plus_exists_leb Original_LF__DOT__Logic_LF_Logic_plus__exists__leb_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.plus_exists_leb Imported.Original_LF__DOT__Logic_LF_Logic_plus__exists__leb Original_LF__DOT__Logic_LF_Logic_plus__exists__leb_iso := {}.