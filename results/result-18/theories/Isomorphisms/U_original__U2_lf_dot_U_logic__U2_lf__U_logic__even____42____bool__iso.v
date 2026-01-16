From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)



From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.__0__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__even__iso Isomorphisms.U_original__U2_lf_dot_U_basics__U2_lf__U_basics__true__iso Isomorphisms.U_s__iso.

Definition imported_Original_LF__DOT__Logic_LF_Logic_even__42__bool : imported_Corelib_Init_Logic_eq
    (imported_Original_LF__DOT__Basics_LF_Basics_even
       (imported_S
          (imported_S
             (imported_S
                (imported_S
                   (imported_S
                      (imported_S
                         (imported_S
                            (imported_S
                               (imported_S
                                  (imported_S
                                     (imported_S
                                        (imported_S
                                           (imported_S
                                              (imported_S
                                                 (imported_S
                                                    (imported_S
                                                       (imported_S
                                                          (imported_S
                                                             (imported_S
                                                                (imported_S
                                                                   (imported_S
                                                                      (imported_S
                                                                         (imported_S
                                                                            (imported_S
                                                                               (imported_S
                                                                                  (imported_S
                                                                                     (imported_S
                                                                                        (imported_S
                                                                                           (imported_S
                                                                                              (imported_S
                                                                                                 (imported_S
                                                                                                    (imported_S
                                                                                                       (imported_S
                                                                                                          (imported_S
                                                                                                             (imported_S
                                                                                                                (imported_S
                                                                                                                   (imported_S
                                                                                                                      (imported_S (imported_S (imported_S (imported_S (imported_S imported_0)))))))))))))))))))))))))))))))))))))))))))
    imported_Original_LF__DOT__Basics_LF_Basics_true := Imported.Original_LF__DOT__Logic_LF_Logic_even__42__bool.
Instance Original_LF__DOT__Logic_LF_Logic_even__42__bool_iso : rel_iso
    {|
      to :=
        Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__Basics_LF_Basics_even_iso
             (S_iso
                (S_iso
                   (S_iso
                      (S_iso
                         (S_iso
                            (S_iso
                               (S_iso
                                  (S_iso
                                     (S_iso
                                        (S_iso
                                           (S_iso
                                              (S_iso
                                                 (S_iso
                                                    (S_iso
                                                       (S_iso
                                                          (S_iso
                                                             (S_iso
                                                                (S_iso
                                                                   (S_iso
                                                                      (S_iso
                                                                         (S_iso
                                                                            (S_iso
                                                                               (S_iso
                                                                                  (S_iso
                                                                                     (S_iso
                                                                                        (S_iso
                                                                                           (S_iso
                                                                                              (S_iso
                                                                                                 (S_iso
                                                                                                    (S_iso
                                                                                                       (S_iso
                                                                                                          (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))))))))))))))))))))))))
          Original_LF__DOT__Basics_LF_Basics_true_iso;
      from :=
        from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Basics_LF_Basics_even_iso
                (S_iso
                   (S_iso
                      (S_iso
                         (S_iso
                            (S_iso
                               (S_iso
                                  (S_iso
                                     (S_iso
                                        (S_iso
                                           (S_iso
                                              (S_iso
                                                 (S_iso
                                                    (S_iso
                                                       (S_iso
                                                          (S_iso
                                                             (S_iso
                                                                (S_iso
                                                                   (S_iso
                                                                      (S_iso
                                                                         (S_iso
                                                                            (S_iso
                                                                               (S_iso
                                                                                  (S_iso
                                                                                     (S_iso
                                                                                        (S_iso
                                                                                           (S_iso
                                                                                              (S_iso
                                                                                                 (S_iso
                                                                                                    (S_iso
                                                                                                       (S_iso
                                                                                                          (S_iso
                                                                                                             (S_iso
                                                                                                                (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))))))))))))))))))))))))
             Original_LF__DOT__Basics_LF_Basics_true_iso);
      to_from :=
        fun
          x : imported_Corelib_Init_Logic_eq
                (imported_Original_LF__DOT__Basics_LF_Basics_even
                   (imported_S
                      (imported_S
                         (imported_S
                            (imported_S
                               (imported_S
                                  (imported_S
                                     (imported_S
                                        (imported_S
                                           (imported_S
                                              (imported_S
                                                 (imported_S
                                                    (imported_S
                                                       (imported_S
                                                          (imported_S
                                                             (imported_S
                                                                (imported_S
                                                                   (imported_S
                                                                      (imported_S
                                                                         (imported_S
                                                                            (imported_S
                                                                               (imported_S
                                                                                  (imported_S
                                                                                     (imported_S
                                                                                        (imported_S
                                                                                           (imported_S
                                                                                              (imported_S
                                                                                                 (imported_S
                                                                                                    (imported_S
                                                                                                       (imported_S
                                                                                                          (imported_S
                                                                                                             (imported_S
                                                                                                                (imported_S
                                                                                                                   (imported_S
                                                                                                                      (imported_S
                                                                                                                         (imported_S
                                                                                                                            (imported_S
                                                                                                                               (imported_S
                                                                                                                                  (imported_S
                                                                                                                                     (imported_S (imported_S (imported_S (imported_S imported_0)))))))))))))))))))))))))))))))))))))))))))
                imported_Original_LF__DOT__Basics_LF_Basics_true =>
        to_from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__Basics_LF_Basics_even_iso
                (S_iso
                   (S_iso
                      (S_iso
                         (S_iso
                            (S_iso
                               (S_iso
                                  (S_iso
                                     (S_iso
                                        (S_iso
                                           (S_iso
                                              (S_iso
                                                 (S_iso
                                                    (S_iso
                                                       (S_iso
                                                          (S_iso
                                                             (S_iso
                                                                (S_iso
                                                                   (S_iso
                                                                      (S_iso
                                                                         (S_iso
                                                                            (S_iso
                                                                               (S_iso
                                                                                  (S_iso
                                                                                     (S_iso
                                                                                        (S_iso
                                                                                           (S_iso
                                                                                              (S_iso
                                                                                                 (S_iso
                                                                                                    (S_iso
                                                                                                       (S_iso
                                                                                                          (S_iso
                                                                                                             (S_iso
                                                                                                                (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))))))))))))))))))))))))
             Original_LF__DOT__Basics_LF_Basics_true_iso)
          x;
      from_to :=
        fun x : Original.LF_DOT_Basics.LF.Basics.even 42 = Original.LF_DOT_Basics.LF.Basics.true =>
        seq_p_of_t
          (from_to
             (Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__Basics_LF_Basics_even_iso
                   (S_iso
                      (S_iso
                         (S_iso
                            (S_iso
                               (S_iso
                                  (S_iso
                                     (S_iso
                                        (S_iso
                                           (S_iso
                                              (S_iso
                                                 (S_iso
                                                    (S_iso
                                                       (S_iso
                                                          (S_iso
                                                             (S_iso
                                                                (S_iso
                                                                   (S_iso
                                                                      (S_iso
                                                                         (S_iso
                                                                            (S_iso
                                                                               (S_iso
                                                                                  (S_iso
                                                                                     (S_iso
                                                                                        (S_iso
                                                                                           (S_iso
                                                                                              (S_iso
                                                                                                 (S_iso
                                                                                                    (S_iso
                                                                                                       (S_iso
                                                                                                          (S_iso
                                                                                                             (S_iso
                                                                                                                (S_iso
                                                                                                                   (S_iso
                                                                                                                      (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso (S_iso _0_iso)))))))))))))))))))))))))))))))))))))))))))
                Original_LF__DOT__Basics_LF_Basics_true_iso)
             x)
    |} Original.LF_DOT_Logic.LF.Logic.even_42_bool imported_Original_LF__DOT__Logic_LF_Logic_even__42__bool.
Proof.
  constructor.
  (* Both the source and target are SProp, equality holds by proof irrelevance *)
  apply IsomorphismDefinitions.eq_refl.
Qed.
Instance: KnownConstant Original.LF_DOT_Logic.LF.Logic.even_42_bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__Logic_LF_Logic_even__42__bool := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_Logic.LF.Logic.even_42_bool Original_LF__DOT__Logic_LF_Logic_even__42__bool_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_Logic.LF.Logic.even_42_bool Imported.Original_LF__DOT__Logic_LF_Logic_even__42__bool Original_LF__DOT__Logic_LF_Logic_even__42__bool_iso := {}.