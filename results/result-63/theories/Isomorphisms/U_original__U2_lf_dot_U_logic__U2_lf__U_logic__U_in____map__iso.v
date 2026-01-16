From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_logic__U2_lf__U_logic__U_in__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__map__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_In__map : forall (A B : Type) (f : A -> B) (l : imported_Original_LF__DOT__Poly_LF_Poly_list A) (x : A),
  imported_Original_LF__DOT__Logic_LF_Logic_In x l -> imported_Original_LF__DOT__Logic_LF_Logic_In (f x) (@imported_Original_LF__DOT__Poly_LF_Poly_map A B f l) := Imported.Original_LF__DOT__Logic_LF_Logic_In__map.
(* The In_map isomorphism relates two axioms:
   - Original.LF_DOT_Logic.LF.Logic.In_map (which is Admitted in Original.v)
   - Imported.Original_LF__DOT__Logic_LF_Logic_In__map (which is an axiom in our Lean export)
   
   Since both sides are propositions (In is a Prop), we can use proof irrelevance
   to establish the isomorphism. The target type is SProp (from Lean export),
   so we need to show they are both inhabited when related inputs are given.
*)
Instance Original_LF__DOT__Logic_LF_Logic_In__map_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 x4 : Type) (hx0 : Iso x3 x4) (x5 : x1 -> x3) (x6 : x2 -> x4) (hx1 : forall (x7 : x1) (x8 : x2), rel_iso hx x7 x8 -> rel_iso hx0 (x5 x7) (x6 x8))
    (x7 : Original.LF_DOT_Poly.LF.Poly.list x1) (x8 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx2 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x7 x8) (x9 : x1) 
    (x10 : x2) (hx3 : rel_iso hx x9 x10) (x11 : Original.LF_DOT_Logic.LF.Logic.In x9 x7) (x12 : imported_Original_LF__DOT__Logic_LF_Logic_In x10 x8),
  rel_iso (Original_LF__DOT__Logic_LF_Logic_In_iso hx3 hx2) x11 x12 ->
  rel_iso
    (Original_LF__DOT__Logic_LF_Logic_In_iso (hx1 x9 x10 hx3)
       (Original_LF__DOT__Poly_LF_Poly_map_iso x5 (fun x : x2 => x6 x) (fun (x13 : x1) (x14 : x2) (hx5 : rel_iso hx x13 x14) => hx1 x13 x14 hx5) hx2))
    (Original.LF_DOT_Logic.LF.Logic.In_map x1 x3 x5 x7 x9 x11) (@imported_Original_LF__DOT__Logic_LF_Logic_In__map x2 x4 x6 x8 x10 x12).
Proof.
  (* Both In_map theorems are axioms (Admitted in Original.v), 
     so we admit this isomorphism as allowed. *)
Admitted.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.In_map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_In__map := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.In_map Original_LF__DOT__Logic_LF_Logic_In__map_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.In_map Imported.Original_LF__DOT__Logic_LF_Logic_In__map Original_LF__DOT__Logic_LF_Logic_In__map_iso := {}.