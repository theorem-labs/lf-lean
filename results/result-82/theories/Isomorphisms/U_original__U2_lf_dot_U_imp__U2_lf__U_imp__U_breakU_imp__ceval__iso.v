From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Set Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
(* Typeclasses Opaque rel_iso. *) (* for speed *)


From IsomorphismChecker Require Export Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__com__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U_breakU_imp__result__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__state__iso.

Definition imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com ->
  (imported_String_string -> imported_nat) -> imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result -> (imported_String_string -> imported_nat) -> SProp := Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval.

(* Both ceval relations have only E_Skip constructor. We prove they are isomorphic
   when the related parameters are isomorphic. *)

(* Helper to convert SProp eq to Logic.eq *)
Definition sprop_to_prop {A : Type} {x y : A} (H : IsomorphismDefinitions.eq x y) : @Logic.eq A x y :=
  match H in IsomorphismDefinitions.eq _ z return @Logic.eq A x z with
  | IsomorphismDefinitions.eq_refl => Logic.eq_refl
  end.

Instance Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso : (forall (x1 : Original.LF_DOT_Imp.LF.Imp.BreakImp.com) (x2 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com)
     (_ : @rel_iso Original.LF_DOT_Imp.LF.Imp.BreakImp.com imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_com Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2)
     (x3 : Original.LF_DOT_Imp.LF.Imp.state) (x4 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x5 : String.string) (x6 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x5 x6), @rel_iso nat imported_nat nat_iso (x3 x5) (x4 x6))
     (x5 : Original.LF_DOT_Imp.LF.Imp.BreakImp.result) (x6 : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result)
     (_ : @rel_iso Original.LF_DOT_Imp.LF.Imp.BreakImp.result imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_result Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x5 x6)
     (x7 : Original.LF_DOT_Imp.LF.Imp.state) (x8 : forall _ : imported_String_string, imported_nat)
     (_ : forall (x9 : String.string) (x10 : imported_String_string) (_ : @rel_iso String.string imported_String_string String_string_iso x9 x10), @rel_iso nat imported_nat nat_iso (x7 x9) (x8 x10)),
   Iso (Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x3 x5 x7) (imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 x4 x6 x8)).
Proof.
  intros x1 x2 Hcom x3 x4 Hst1 x5 x6 Hres x7 x8 Hst2.
  (* Prop -> SProp isomorphism *)
  apply Build_Iso with
    (to := fun (H : Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x3 x5 x7) => 
      (* Destruct H to get that x1=CSkip, x5=SContinue, x3=x7 *)
      match H in Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval c st1 r st2
            return rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso c x2 ->
                   rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso r x6 ->
                   (forall a b, rel_iso String_string_iso a b -> rel_iso nat_iso (st1 a) (x4 b)) ->
                   (forall a b, rel_iso String_string_iso a b -> rel_iso nat_iso (st2 a) (x8 b)) ->
                   imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 x4 x6 x8 with
      | Original.LF_DOT_Imp.LF.Imp.BreakImp.E_Skip st => fun Hcom' Hres' Hst1' Hst2' =>
          (* Now st1=st2=st, so Hst1' and Hst2' both relate st to x4 and x8 *)
          let Hx2 := sprop_to_prop Hcom' in
          let Hx6 := sprop_to_prop Hres' in
          let Hx4x8 := sprop_to_prop (functional_extensionality_dep _ _ (fun s =>
            eq_trans (eq_sym (Hst1' _ _ (@to_from _ _ String_string_iso s)))
                     (Hst2' _ _ (@to_from _ _ String_string_iso s)))) in
          match Hx2 in (_ = c'), Hx6 in (_ = r'), Hx4x8 in (_ = st')
                return imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c' x4 r' st' with
          | Logic.eq_refl, Logic.eq_refl, Logic.eq_refl =>
              Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_E_Skip x4
          end
      end Hcom Hres Hst1 Hst2)
    (from := fun (H : imported_Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval x2 x4 x6 x8) =>
      match H in Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval c st1 r st2
            return (c = x2) -> (st1 = x4) -> (r = x6) -> (st2 = x8) ->
                   rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1 x2 ->
                   rel_iso Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x5 x6 ->
                   (forall a b, rel_iso String_string_iso a b -> rel_iso nat_iso (x3 a) (x4 b)) ->
                   (forall a b, rel_iso String_string_iso a b -> rel_iso nat_iso (x7 a) (x8 b)) ->
                   Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval x1 x3 x5 x7 with
      | Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_E_Skip st => 
          fun Hceq Hsteq Hreq Hst2eq Hcom' Hres' Hst1' Hst2' =>
          (* st1=st2=st, so x4=x8 from Hsteq and Hst2eq *)
          let Hx4x8 : x4 = x8 := Logic.eq_trans (Logic.eq_sym Hsteq) Hst2eq in
          let Hx1 := sprop_to_prop (eq_trans (eq_sym (@from_to _ _ Original_LF__DOT__Imp_LF_Imp_BreakImp_com_iso x1))
                                    (f_equal _ (eq_trans Hcom' (seq_of_eq (Logic.eq_sym Hceq))))) in
          let Hx5 := sprop_to_prop (eq_trans (eq_sym (@from_to _ _ Original_LF__DOT__Imp_LF_Imp_BreakImp_result_iso x5))
                                    (f_equal _ (eq_trans Hres' (seq_of_eq (Logic.eq_sym Hreq))))) in
          let Hx3x7 := sprop_to_prop (functional_extensionality_dep _ _ (fun s =>
            let Hs1 := Hst1' s _ IsomorphismDefinitions.eq_refl in
            let Hs2 := Hst2' s _ IsomorphismDefinitions.eq_refl in
            let Hx4x8s := seq_of_eq (Logic.f_equal (fun f => f (to String_string_iso s)) Hx4x8) in
            eq_trans (eq_sym (@from_to _ _ nat_iso (x3 s)))
              (eq_trans (f_equal (from nat_iso) (eq_trans Hs1 (eq_trans Hx4x8s (eq_sym Hs2))))
                (@from_to _ _ nat_iso (x7 s))))) in
          match Logic.eq_sym Hx1 in (_ = c'), Logic.eq_sym Hx5 in (_ = r'), Logic.eq_sym Hx3x7 in (_ = st')
                return Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval c' st' r' x7 with
          | Logic.eq_refl, Logic.eq_refl, Logic.eq_refl =>
              Original.LF_DOT_Imp.LF.Imp.BreakImp.E_Skip x7
          end
      end Logic.eq_refl Logic.eq_refl Logic.eq_refl Logic.eq_refl Hcom Hres Hst1 Hst2).
  - intro x. apply IsomorphismDefinitions.eq_refl.
  - intro x. 
    (* Use proof irrelevance for Prop *)
    apply seq_of_eq.
    apply Stdlib.Logic.ProofIrrelevance.proof_irrelevance.
Defined.
Instance: KnownConstant Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Imp.LF.Imp.BreakImp.ceval Imported.Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval Original_LF__DOT__Imp_LF_Imp_BreakImp_ceval_iso := {}.
