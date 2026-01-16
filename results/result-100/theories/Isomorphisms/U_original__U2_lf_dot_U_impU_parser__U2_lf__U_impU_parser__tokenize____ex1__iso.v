From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.cons__iso Isomorphisms.nil__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__tokenize__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1 : @imported_Corelib_Init_Logic_eq (imported_list imported_String_string)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize
       (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
          imported_String_String
          (String.String (Ascii.Ascii true false false false false true true false)
             (String.String (Ascii.Ascii false true false false false true true false)
                (String.String (Ascii.Ascii true true false false false true true false)
                   (String.String (Ascii.Ascii true false false false true true false false)
                      (String.String (Ascii.Ascii false true false false true true false false)
                         (String.String (Ascii.Ascii true false true true true true false false)
                            (String.String (Ascii.Ascii true true false false true true false false)
                               (String.String (Ascii.Ascii false false false false false true false false)
                                  (String.String (Ascii.Ascii false false false false false true false false)
                                     (String.String (Ascii.Ascii false true false false true true false false)
                                        (String.String (Ascii.Ascii false true false false true true false false)
                                           (String.String (Ascii.Ascii true true false false true true false false)
                                              (String.String (Ascii.Ascii false true false true false true false false)
                                                 (String.String (Ascii.Ascii false false false true false true false false)
                                                    (String.String (Ascii.Ascii true true false false true true false false)
                                                       (String.String (Ascii.Ascii true true false true false true false false)
                                                          (String.String (Ascii.Ascii false false false true false true false false)
                                                             (String.String (Ascii.Ascii true false false false false true true false)
                                                                (String.String (Ascii.Ascii true true false true false true false false)
                                                                   (String.String (Ascii.Ascii true true false false false true true false)
                                                                      (String.String (Ascii.Ascii true false false true false true false false)
                                                                         (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))))))))))))))))))))))))
    (@imported_cons imported_String_string
       (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
          imported_String_String
          (String.String (Ascii.Ascii true false false false false true true false)
             (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))))
       (@imported_cons imported_String_string
          (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
             imported_String_String
             (String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)))
          (@imported_cons imported_String_string
             (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                imported_String_String (String.String (Ascii.Ascii true false true true true true false false) String.EmptyString))
             (@imported_cons imported_String_string
                (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                   imported_String_String (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                (@imported_cons imported_String_string
                   (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                      imported_String_String
                      (String.String (Ascii.Ascii false true false false true true false false)
                         (String.String (Ascii.Ascii false true false false true true false false) (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))))
                   (@imported_cons imported_String_string
                      (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                         imported_String_String (String.String (Ascii.Ascii false true false true false true false false) String.EmptyString))
                      (@imported_cons imported_String_string
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                         (@imported_cons imported_String_string
                            (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                               imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                            (@imported_cons imported_String_string
                               (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                  imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                               (@imported_cons imported_String_string
                                  (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                     imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                  (@imported_cons imported_String_string
                                     (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                        imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true false false false false true true false) String.EmptyString))
                                     (@imported_cons imported_String_string
                                        (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                           imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                        (@imported_cons imported_String_string
                                           (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                              imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
                                           (@imported_cons imported_String_string
                                              (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                                 imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                              (@imported_cons imported_String_string
                                                 (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                                    imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                 (imported_nil imported_String_string)))))))))))))))) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1.
Instance Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1_iso : rel_iso
    {|
      to :=
        Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso
             (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                (String.String (Ascii.Ascii true false false false false true true false)
                   (String.String (Ascii.Ascii false true false false false true true false)
                      (String.String (Ascii.Ascii true true false false false true true false)
                         (String.String (Ascii.Ascii true false false false true true false false)
                            (String.String (Ascii.Ascii false true false false true true false false)
                               (String.String (Ascii.Ascii true false true true true true false false)
                                  (String.String (Ascii.Ascii true true false false true true false false)
                                     (String.String (Ascii.Ascii false false false false false true false false)
                                        (String.String (Ascii.Ascii false false false false false true false false)
                                           (String.String (Ascii.Ascii false true false false true true false false)
                                              (String.String (Ascii.Ascii false true false false true true false false)
                                                 (String.String (Ascii.Ascii true true false false true true false false)
                                                    (String.String (Ascii.Ascii false true false true false true false false)
                                                       (String.String (Ascii.Ascii false false false true false true false false)
                                                          (String.String (Ascii.Ascii true true false false true true false false)
                                                             (String.String (Ascii.Ascii true true false true false true false false)
                                                                (String.String (Ascii.Ascii false false false true false true false false)
                                                                   (String.String (Ascii.Ascii true false false false false true true false)
                                                                      (String.String (Ascii.Ascii true true false true false true false false)
                                                                         (String.String (Ascii.Ascii true true false false false true true false)
                                                                            (String.String (Ascii.Ascii true false false true false true false false)
                                                                               (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))))))))))))))))))))))))
          (cons_iso
             (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                (String.String (Ascii.Ascii true false false false false true true false)
                   (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))))
             (cons_iso
                (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                   (String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)))
                (cons_iso
                   (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                      (String.String (Ascii.Ascii true false true true true true false false) String.EmptyString))
                   (cons_iso
                      (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                         (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                      (cons_iso
                         (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                            (String.String (Ascii.Ascii false true false false true true false false)
                               (String.String (Ascii.Ascii false true false false true true false false) (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))))
                         (cons_iso
                            (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                               (String.String (Ascii.Ascii false true false true false true false false) String.EmptyString))
                            (cons_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                               (cons_iso
                                  (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                     (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                                  (cons_iso
                                     (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                        (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                     (cons_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                        (cons_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii true false false false false true true false) String.EmptyString))
                                           (cons_iso
                                              (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                 (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                              (cons_iso
                                                 (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                    (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
                                                 (cons_iso
                                                    (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                       (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                    (cons_iso
                                                       (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                          (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                       (nil_iso String_string_iso))))))))))))))));
      from :=
        from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso
                (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                   (String.String (Ascii.Ascii true false false false false true true false)
                      (String.String (Ascii.Ascii false true false false false true true false)
                         (String.String (Ascii.Ascii true true false false false true true false)
                            (String.String (Ascii.Ascii true false false false true true false false)
                               (String.String (Ascii.Ascii false true false false true true false false)
                                  (String.String (Ascii.Ascii true false true true true true false false)
                                     (String.String (Ascii.Ascii true true false false true true false false)
                                        (String.String (Ascii.Ascii false false false false false true false false)
                                           (String.String (Ascii.Ascii false false false false false true false false)
                                              (String.String (Ascii.Ascii false true false false true true false false)
                                                 (String.String (Ascii.Ascii false true false false true true false false)
                                                    (String.String (Ascii.Ascii true true false false true true false false)
                                                       (String.String (Ascii.Ascii false true false true false true false false)
                                                          (String.String (Ascii.Ascii false false false true false true false false)
                                                             (String.String (Ascii.Ascii true true false false true true false false)
                                                                (String.String (Ascii.Ascii true true false true false true false false)
                                                                   (String.String (Ascii.Ascii false false false true false true false false)
                                                                      (String.String (Ascii.Ascii true false false false false true true false)
                                                                         (String.String (Ascii.Ascii true true false true false true false false)
                                                                            (String.String (Ascii.Ascii true true false false false true true false)
                                                                               (String.String (Ascii.Ascii true false false true false true false false)
                                                                                  (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))))))))))))))))))))))))
             (cons_iso
                (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                   (String.String (Ascii.Ascii true false false false false true true false)
                      (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))))
                (cons_iso
                   (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                      (String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)))
                   (cons_iso
                      (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                         (String.String (Ascii.Ascii true false true true true true false false) String.EmptyString))
                      (cons_iso
                         (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                            (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                         (cons_iso
                            (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                               (String.String (Ascii.Ascii false true false false true true false false)
                                  (String.String (Ascii.Ascii false true false false true true false false)
                                     (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))))
                            (cons_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false true false true false true false false) String.EmptyString))
                               (cons_iso
                                  (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                     (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                  (cons_iso
                                     (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                        (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                                     (cons_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                        (cons_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                           (cons_iso
                                              (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                 (String.String (Ascii.Ascii true false false false false true true false) String.EmptyString))
                                              (cons_iso
                                                 (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                    (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                                 (cons_iso
                                                    (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                       (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
                                                    (cons_iso
                                                       (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                          (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                       (cons_iso
                                                          (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                             (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                          (nil_iso String_string_iso)))))))))))))))));
      to_from :=
        fun
          x : imported_Corelib_Init_Logic_eq
                (imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize
                   (StringOptimizations.imported_string
                      (String.String (Ascii.Ascii true false false false false true true false)
                         (String.String (Ascii.Ascii false true false false false true true false)
                            (String.String (Ascii.Ascii true true false false false true true false)
                               (String.String (Ascii.Ascii true false false false true true false false)
                                  (String.String (Ascii.Ascii false true false false true true false false)
                                     (String.String (Ascii.Ascii true false true true true true false false)
                                        (String.String (Ascii.Ascii true true false false true true false false)
                                           (String.String (Ascii.Ascii false false false false false true false false)
                                              (String.String (Ascii.Ascii false false false false false true false false)
                                                 (String.String (Ascii.Ascii false true false false true true false false)
                                                    (String.String (Ascii.Ascii false true false false true true false false)
                                                       (String.String (Ascii.Ascii true true false false true true false false)
                                                          (String.String (Ascii.Ascii false true false true false true false false)
                                                             (String.String (Ascii.Ascii false false false true false true false false)
                                                                (String.String (Ascii.Ascii true true false false true true false false)
                                                                   (String.String (Ascii.Ascii true true false true false true false false)
                                                                      (String.String (Ascii.Ascii false false false true false true false false)
                                                                         (String.String (Ascii.Ascii true false false false false true true false)
                                                                            (String.String (Ascii.Ascii true true false true false true false false)
                                                                               (String.String (Ascii.Ascii true true false false false true true false)
                                                                                  (String.String (Ascii.Ascii true false false true false true false false)
                                                                                     (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))))))))))))))))))))))))
                (imported_cons
                   (StringOptimizations.imported_string
                      (String.String (Ascii.Ascii true false false false false true true false)
                         (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))))
                   (imported_cons
                      (StringOptimizations.imported_string
                         (String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)))
                      (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true false true true true true false false) String.EmptyString))
                         (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                            (imported_cons
                               (StringOptimizations.imported_string
                                  (String.String (Ascii.Ascii false true false false true true false false)
                                     (String.String (Ascii.Ascii false true false false true true false false)
                                        (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))))
                               (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii false true false true false true false false) String.EmptyString))
                                  (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                     (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                                        (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                           (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                              (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true false false false false true true false) String.EmptyString))
                                                 (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                                    (imported_cons (StringOptimizations.imported_string (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
                                                       (imported_cons
                                                          (StringOptimizations.imported_string (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                          (imported_cons
                                                             (StringOptimizations.imported_string (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                             (imported_nil imported_String_string)))))))))))))))) =>
        to_from
          (Corelib_Init_Logic_eq_iso
             (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso
                (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                   (String.String (Ascii.Ascii true false false false false true true false)
                      (String.String (Ascii.Ascii false true false false false true true false)
                         (String.String (Ascii.Ascii true true false false false true true false)
                            (String.String (Ascii.Ascii true false false false true true false false)
                               (String.String (Ascii.Ascii false true false false true true false false)
                                  (String.String (Ascii.Ascii true false true true true true false false)
                                     (String.String (Ascii.Ascii true true false false true true false false)
                                        (String.String (Ascii.Ascii false false false false false true false false)
                                           (String.String (Ascii.Ascii false false false false false true false false)
                                              (String.String (Ascii.Ascii false true false false true true false false)
                                                 (String.String (Ascii.Ascii false true false false true true false false)
                                                    (String.String (Ascii.Ascii true true false false true true false false)
                                                       (String.String (Ascii.Ascii false true false true false true false false)
                                                          (String.String (Ascii.Ascii false false false true false true false false)
                                                             (String.String (Ascii.Ascii true true false false true true false false)
                                                                (String.String (Ascii.Ascii true true false true false true false false)
                                                                   (String.String (Ascii.Ascii false false false true false true false false)
                                                                      (String.String (Ascii.Ascii true false false false false true true false)
                                                                         (String.String (Ascii.Ascii true true false true false true false false)
                                                                            (String.String (Ascii.Ascii true true false false false true true false)
                                                                               (String.String (Ascii.Ascii true false false true false true false false)
                                                                                  (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))))))))))))))))))))))))
             (cons_iso
                (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                   (String.String (Ascii.Ascii true false false false false true true false)
                      (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))))
                (cons_iso
                   (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                      (String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)))
                   (cons_iso
                      (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                         (String.String (Ascii.Ascii true false true true true true false false) String.EmptyString))
                      (cons_iso
                         (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                            (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                         (cons_iso
                            (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                               (String.String (Ascii.Ascii false true false false true true false false)
                                  (String.String (Ascii.Ascii false true false false true true false false)
                                     (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))))
                            (cons_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false true false true false true false false) String.EmptyString))
                               (cons_iso
                                  (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                     (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                  (cons_iso
                                     (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                        (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                                     (cons_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                        (cons_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                           (cons_iso
                                              (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                 (String.String (Ascii.Ascii true false false false false true true false) String.EmptyString))
                                              (cons_iso
                                                 (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                    (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                                 (cons_iso
                                                    (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                       (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
                                                    (cons_iso
                                                       (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                          (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                       (cons_iso
                                                          (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                             (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                          (nil_iso String_string_iso)))))))))))))))))
          x;
      from_to :=
        fun
          x : Original.LF_DOT_ImpParser.LF.ImpParser.tokenize
                (String.String (Ascii.Ascii true false false false false true true false)
                   (String.String (Ascii.Ascii false true false false false true true false)
                      (String.String (Ascii.Ascii true true false false false true true false)
                         (String.String (Ascii.Ascii true false false false true true false false)
                            (String.String (Ascii.Ascii false true false false true true false false)
                               (String.String (Ascii.Ascii true false true true true true false false)
                                  (String.String (Ascii.Ascii true true false false true true false false)
                                     (String.String (Ascii.Ascii false false false false false true false false)
                                        (String.String (Ascii.Ascii false false false false false true false false)
                                           (String.String (Ascii.Ascii false true false false true true false false)
                                              (String.String (Ascii.Ascii false true false false true true false false)
                                                 (String.String (Ascii.Ascii true true false false true true false false)
                                                    (String.String (Ascii.Ascii false true false true false true false false)
                                                       (String.String (Ascii.Ascii false false false true false true false false)
                                                          (String.String (Ascii.Ascii true true false false true true false false)
                                                             (String.String (Ascii.Ascii true true false true false true false false)
                                                                (String.String (Ascii.Ascii false false false true false true false false)
                                                                   (String.String (Ascii.Ascii true false false false false true true false)
                                                                      (String.String (Ascii.Ascii true true false true false true false false)
                                                                         (String.String (Ascii.Ascii true true false false false true true false)
                                                                            (String.String (Ascii.Ascii true false false true false true false false)
                                                                               (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString)))))))))))))))))))))) =
              (String.String (Ascii.Ascii true false false false false true true false)
                 (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
               :: String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)
                  :: String.String (Ascii.Ascii true false true true true true false false) String.EmptyString
                     :: String.String (Ascii.Ascii true true false false true true false false) String.EmptyString
                        :: String.String (Ascii.Ascii false true false false true true false false)
                             (String.String (Ascii.Ascii false true false false true true false false) (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                           :: String.String (Ascii.Ascii false true false true false true false false) String.EmptyString
                              :: String.String (Ascii.Ascii false false false true false true false false) String.EmptyString
                                 :: String.String (Ascii.Ascii true true false false true true false false) String.EmptyString
                                    :: String.String (Ascii.Ascii true true false true false true false false) String.EmptyString
                                       :: String.String (Ascii.Ascii false false false true false true false false) String.EmptyString
                                          :: String.String (Ascii.Ascii true false false false false true true false) String.EmptyString
                                             :: String.String (Ascii.Ascii true true false true false true false false) String.EmptyString
                                                :: String.String (Ascii.Ascii true true false false false true true false) String.EmptyString
                                                   :: String.String (Ascii.Ascii true false false true false true false false) String.EmptyString
                                                      :: String.String (Ascii.Ascii true false false true false true false false) String.EmptyString :: nil)%list =>
        seq_p_of_t
          (from_to
             (Corelib_Init_Logic_eq_iso
                (Original_LF__DOT__ImpParser_LF_ImpParser_tokenize_iso
                   (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                      (String.String (Ascii.Ascii true false false false false true true false)
                         (String.String (Ascii.Ascii false true false false false true true false)
                            (String.String (Ascii.Ascii true true false false false true true false)
                               (String.String (Ascii.Ascii true false false false true true false false)
                                  (String.String (Ascii.Ascii false true false false true true false false)
                                     (String.String (Ascii.Ascii true false true true true true false false)
                                        (String.String (Ascii.Ascii true true false false true true false false)
                                           (String.String (Ascii.Ascii false false false false false true false false)
                                              (String.String (Ascii.Ascii false false false false false true false false)
                                                 (String.String (Ascii.Ascii false true false false true true false false)
                                                    (String.String (Ascii.Ascii false true false false true true false false)
                                                       (String.String (Ascii.Ascii true true false false true true false false)
                                                          (String.String (Ascii.Ascii false true false true false true false false)
                                                             (String.String (Ascii.Ascii false false false true false true false false)
                                                                (String.String (Ascii.Ascii true true false false true true false false)
                                                                   (String.String (Ascii.Ascii true true false true false true false false)
                                                                      (String.String (Ascii.Ascii false false false true false true false false)
                                                                         (String.String (Ascii.Ascii true false false false false true true false)
                                                                            (String.String (Ascii.Ascii true true false true false true false false)
                                                                               (String.String (Ascii.Ascii true true false false false true true false)
                                                                                  (String.String (Ascii.Ascii true false false true false true false false)
                                                                                     (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))))))))))))))))))))))))
                (cons_iso
                   (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                      (String.String (Ascii.Ascii true false false false false true true false)
                         (String.String (Ascii.Ascii false true false false false true true false) (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))))
                   (cons_iso
                      (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                         (String.String (Ascii.Ascii true false false false true true false false) (String.String (Ascii.Ascii false true false false true true false false) String.EmptyString)))
                      (cons_iso
                         (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                            (String.String (Ascii.Ascii true false true true true true false false) String.EmptyString))
                         (cons_iso
                            (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                               (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                            (cons_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false true false false true true false false)
                                     (String.String (Ascii.Ascii false true false false true true false false)
                                        (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))))
                               (cons_iso
                                  (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                     (String.String (Ascii.Ascii false true false true false true false false) String.EmptyString))
                                  (cons_iso
                                     (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                        (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                     (cons_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii true true false false true true false false) String.EmptyString))
                                        (cons_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                           (cons_iso
                                              (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                 (String.String (Ascii.Ascii false false false true false true false false) String.EmptyString))
                                              (cons_iso
                                                 (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                    (String.String (Ascii.Ascii true false false false false true true false) String.EmptyString))
                                                 (cons_iso
                                                    (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                       (String.String (Ascii.Ascii true true false true false true false false) String.EmptyString))
                                                    (cons_iso
                                                       (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                          (String.String (Ascii.Ascii true true false false false true true false) String.EmptyString))
                                                       (cons_iso
                                                          (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                             (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                          (cons_iso
                                                             (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                                                (String.String (Ascii.Ascii true false false true false true false false) String.EmptyString))
                                                             (nil_iso String_string_iso)))))))))))))))))
             x)
    |} Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_ex1 imported_Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1.
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_ex1 Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.tokenize_ex1 Imported.Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1 Original_LF__DOT__ImpParser_LF_ImpParser_tokenize__ex1_iso := {}.