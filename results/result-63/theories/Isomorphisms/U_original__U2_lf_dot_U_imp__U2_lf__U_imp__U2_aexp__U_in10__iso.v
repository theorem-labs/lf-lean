From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.__0__iso Isomorphisms.U_list__U_in__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_AExp_In10 : imported_List_In (imported_S (imported_S (imported_S (iterate1 imported_S 7 imported_0))))
    (imported_cons (imported_S imported_0)
       (imported_cons (imported_S (imported_S imported_0))
          (imported_cons (imported_S (imported_S (imported_S imported_0)))
             (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 1 imported_0))))
                (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 2 imported_0))))
                   (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 3 imported_0))))
                      (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 4 imported_0))))
                         (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 5 imported_0))))
                            (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 6 imported_0))))
                               (imported_cons (imported_S (imported_S (imported_S (iterate1 imported_S 7 imported_0)))) (imported_nil imported_nat))))))))))) := Imported.Original_LF__DOT__Imp_LF_Imp_AExp_In10.

Instance Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso : rel_iso
    (List_In_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 7 O imported_0 _0_iso))))
       (cons_iso (S_iso _0_iso)
          (cons_iso (S_iso (S_iso _0_iso))
             (cons_iso (S_iso (S_iso (S_iso _0_iso)))
                (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 1 O imported_0 _0_iso))))
                   (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 2 O imported_0 _0_iso))))
                      (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 3 O imported_0 _0_iso))))
                         (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 4 O imported_0 _0_iso))))
                            (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 5 O imported_0 _0_iso))))
                               (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 6 O imported_0 _0_iso))))
                                  (cons_iso (S_iso (S_iso (S_iso (iterate1D2 S imported_S S_iso 7 O imported_0 _0_iso)))) (nil_iso nat_iso))))))))))))
    Original.LF_DOT_Imp.LF.Imp.AExp.In10 imported_Original_LF__DOT__Imp_LF_Imp_AExp_In10.
Proof.
  (* This is an isomorphism between proofs of the same admitted theorem.
     Since Original.LF_DOT_Imp.LF.Imp.AExp.In10 is an axiom (Admitted),
     we use the allowed axiom for this isomorphism. *)
Admitted.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.AExp.In10 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_AExp_In10 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.AExp.In10 Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.AExp.In10 Imported.Original_LF__DOT__Imp_LF_Imp_AExp_In10 Original_LF__DOT__Imp_LF_Imp_AExp_In10_iso := {}.
