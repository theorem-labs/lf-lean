From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__false__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_not__true__is__false : forall x : imported_Original_LF__DOT__Basics_LF_Basics_bool,
  (imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_False) -> imported_Corelib_Init_Logic_eq x imported_Original_LF__DOT__Basics_LF_Basics_false := Imported.Original_LF__DOT__Logic_LF_Logic_not__true__is__false.
Instance Original_LF__DOT__Logic_LF_Logic_not__true__is__false_iso : forall (x1 : Original.LF_DOT_Basics.LF.Basics.bool) (x2 : imported_Original_LF__DOT__Basics_LF_Basics_bool) (hx : rel_iso Original_LF__DOT__Basics_LF_Basics_bool_iso x1 x2)
    (x3 : x1 <> Original.LF_DOT_Basics.LF.Basics.true) (x4 : imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true -> imported_False),
  (forall (x5 : x1 = Original.LF_DOT_Basics.LF.Basics.true) (x6 : imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true),
   rel_iso
     {|
       to := Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso;
       from := from (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso);
       to_from := fun x : imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_true => to_from (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) x;
       from_to := fun x : x1 = Original.LF_DOT_Basics.LF.Basics.true => seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_true_iso) x)
     |} x5 x6 ->
   rel_iso {| to := False_iso; from := from False_iso; to_from := fun x : imported_False => to_from False_iso x; from_to := fun x : False => seq_p_of_t (from_to False_iso x) |} (x3 x5) (x4 x6)) ->
  rel_iso
    {|
      to := Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso;
      from := from (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso);
      to_from := fun x : imported_Corelib_Init_Logic_eq x2 imported_Original_LF__DOT__Basics_LF_Basics_false => to_from (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso) x;
      from_to := fun x : x1 = Original.LF_DOT_Basics.LF.Basics.false => seq_p_of_t (from_to (Corelib_Init_Logic_eq_iso hx Original_LF__DOT__Basics_LF_Basics_false_iso) x)
    |} (Original.LF_DOT_Logic.LF.Logic.not_true_is_false x1 x3) (imported_Original_LF__DOT__Logic_LF_Logic_not__true__is__false x4).
Proof.
  intros x1 x2 hx x3 x4 Hrel.
  (* rel_iso for a record is just showing that to applied to the first element equals the second element *)
  simpl. simpl.
  (* The goal is an SProp equality between two elements of an SProp type (imported_Corelib_Init_Logic_eq ...) *)
  (* SProp types have definitional proof irrelevance, so any two elements are equal *)
  apply IsomorphismDefinitions.eq_refl.
Defined.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.not_true_is_false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_not__true__is__false := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.not_true_is_false Original_LF__DOT__Logic_LF_Logic_not__true__is__false_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.not_true_is_false Imported.Original_LF__DOT__Logic_LF_Logic_not__true__is__false Original_LF__DOT__Logic_LF_Logic_not__true__is__false_iso := {}.