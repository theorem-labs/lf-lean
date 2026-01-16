From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__U_someU_e__iso Isomorphisms.__0__iso Isomorphisms.U_ascii__U_ascii__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_aid__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_amult__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_anum__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_band__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_beq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_ble__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_bnot__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_casgn__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cif__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cseq__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cskip__iso Isomorphisms.U_original__U2_lf_dot_U_imp__U2_lf__U_imp__U2_cwhile__iso Isomorphisms.U_original__U2_lf_dot_U_impU_parser__U2_lf__U_impU_parser__parse__iso Isomorphisms.U_s__iso Isomorphisms.U_string__U_emptyU_string__iso Isomorphisms.U_string__U_string__iso Isomorphisms.false__iso Isomorphisms.true__iso.

Monomorphic Definition imported_Original_LF__DOT__ImpParser_LF_ImpParser_eg2 : @imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__ImpParser_LF_ImpParser_optionE imported_Original_LF__DOT__Imp_LF_Imp_com)
    (imported_Original_LF__DOT__ImpParser_LF_ImpParser_parse
       (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
          imported_String_String
          (String.String (Ascii.Ascii false true false true false false false false)
             (String.String (Ascii.Ascii false false false false false true false false)
                (String.String (Ascii.Ascii false false false false false true false false)
                   (String.String (Ascii.Ascii true true false false true true true false)
                      (String.String (Ascii.Ascii true true false true false true true false)
                         (String.String (Ascii.Ascii true false false true false true true false)
                            (String.String (Ascii.Ascii false false false false true true true false)
                               (String.String (Ascii.Ascii true true false true true true false false)
                                  (String.String (Ascii.Ascii false true false true false false false false)
                                     (String.String (Ascii.Ascii false false false false false true false false)
                                        (String.String (Ascii.Ascii false false false false false true false false)
                                           (String.String (Ascii.Ascii false true false true true true true false)
                                              (String.String (Ascii.Ascii false true false true true true false false)
                                                 (String.String (Ascii.Ascii true false true true true true false false)
                                                    (String.String (Ascii.Ascii false false false true true true true false)
                                                       (String.String (Ascii.Ascii false true false true false true false false)
                                                          (String.String (Ascii.Ascii true false false true true true true false)
                                                             (String.String (Ascii.Ascii false true false true false true false false)
                                                                (String.String (Ascii.Ascii false false false true false true false false)
                                                                   (String.String (Ascii.Ascii false false false true true true true false)
                                                                      (String.String (Ascii.Ascii false true false true false true false false)
                                                                         (String.String (Ascii.Ascii false false false true true true true false)
                                                                            (String.String (Ascii.Ascii true false false true false true false false)
                                                                               (String.String (Ascii.Ascii true true false true true true false false)
                                                                                  (String.String (Ascii.Ascii false true false true false false false false)
                                                                                     (String.String (Ascii.Ascii false false false false false true false false)
                                                                                        (String.String (Ascii.Ascii false false false false false true false false)
                                                                                           (String.String (Ascii.Ascii true true true false true true true false)
                                                                                              (String.String (Ascii.Ascii false false false true false true true false)
                                                                                                 (String.String (Ascii.Ascii true false false true false true true false)
                                                                                                    (String.String (Ascii.Ascii false false true true false true true false)
                                                                                                       (String.String (Ascii.Ascii true false true false false true true false)
                                                                                                          (String.String (Ascii.Ascii false false false false false true false false)
                                                                                                             (String.String (Ascii.Ascii false false false true true true true false)
                                                                                                                (String.String (Ascii.Ascii true false true true true true false false)
                                                                                                                   (String.String (Ascii.Ascii false false false true true true true false)
                                                                                                                      (String.String (Ascii.Ascii false false false false false true false false)
                                                                                                                         (String.String (Ascii.Ascii false false true false false true true false)
                                                                                                                            (String.String (Ascii.Ascii true true true true false true true false)
                                                                                                                               (String.String
                                                                                                                                  (Ascii.Ascii false true false true false false false false)
                                                                                                                                  (String.String
                                                                                                                                     (Ascii.Ascii false false false false false true false false)
                                                                                                                                     (String.String
                                                                                                                                        (Ascii.Ascii false false false false false true false false)
                                                                                                                                        (String.String
                                                                                                                                           (Ascii.Ascii false false false false false true false false)
                                                                                                                                           (String.String
                                                                                                                                              (Ascii.Ascii false false false false false true false
                                                                                                                                                 false)
                                                                                                                                              (String.String
                                                                                                                                                 (Ascii.Ascii true false false true false true true
                                                                                                                                                    false)
                                                                                                                                                 (String.String
                                                                                                                                                    (Ascii.Ascii false true true false false true true
                                                                                                                                                       false)
                                                                                                                                                    (String.String
                                                                                                                                                       (Ascii.Ascii false false false false false true
                                                                                                                                                          false false)
                                                                                                                                                       (String.String
                                                                                                                                                          (Ascii.Ascii false false false true false
                                                                                                                                                             true false false)
                                                                                                                                                          (String.String
                                                                                                                                                             (Ascii.Ascii false true false true true
                                                                                                                                                                true true false)
                                                                                                                                                             (String.String
                                                                                                                                                                (Ascii.Ascii false false false false
                                                                                                                                                                   false true false false)
                                                                                                                                                                (String.String
                                                                                                                                                                   (Ascii.Ascii false false true true
                                                                                                                                                                      true true false false)
                                                                                                                                                                   (String.String
                                                                                                                                                                      (Ascii.Ascii true false true true
                                                                                                                                                                         true true false false)
                                                                                                                                                                      (String.String
                                                                                                                                                                         (Ascii.Ascii false false false
                                                                                                                                                                          false false true false false)
                                                                                                                                                                         (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          false false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          false false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          false true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true false true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false) String.EmptyString)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
    (@imported_Original_LF__DOT__ImpParser_LF_ImpParser_SomeE imported_Original_LF__DOT__Imp_LF_Imp_com
       (imported_Original_LF__DOT__Imp_LF_Imp_CSeq imported_Original_LF__DOT__Imp_LF_Imp_CSkip
          (imported_Original_LF__DOT__Imp_LF_Imp_CSeq
             (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn
                (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                   imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString))
                (imported_Original_LF__DOT__Imp_LF_Imp_AMult
                   (imported_Original_LF__DOT__Imp_LF_Imp_AMult
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii true false false true true true true false) String.EmptyString))))
                   (imported_Original_LF__DOT__Imp_LF_Imp_AMult
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))))))
             (imported_Original_LF__DOT__Imp_LF_Imp_CSeq
                (imported_Original_LF__DOT__Imp_LF_Imp_CWhile
                   (imported_Original_LF__DOT__Imp_LF_Imp_BEq
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                      (imported_Original_LF__DOT__Imp_LF_Imp_AId
                         (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                            imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))))
                   (imported_Original_LF__DOT__Imp_LF_Imp_CSeq
                      (imported_Original_LF__DOT__Imp_LF_Imp_CIf
                         (imported_Original_LF__DOT__Imp_LF_Imp_BAnd
                            (imported_Original_LF__DOT__Imp_LF_Imp_BLe
                               (imported_Original_LF__DOT__Imp_LF_Imp_AId
                                  (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                     imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))
                               (imported_Original_LF__DOT__Imp_LF_Imp_AMult
                                  (imported_Original_LF__DOT__Imp_LF_Imp_AId
                                     (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                        imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))
                                  (imported_Original_LF__DOT__Imp_LF_Imp_AId
                                     (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                        imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))))
                            (imported_Original_LF__DOT__Imp_LF_Imp_BNot
                               (imported_Original_LF__DOT__Imp_LF_Imp_BEq
                                  (imported_Original_LF__DOT__Imp_LF_Imp_AId
                                     (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                        imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                                  (imported_Original_LF__DOT__Imp_LF_Imp_ANum (imported_S (imported_S imported_0))))))
                         (imported_Original_LF__DOT__Imp_LF_Imp_CSeq
                            (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn
                               (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                  imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))
                               (imported_Original_LF__DOT__Imp_LF_Imp_AId
                                  (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                     imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString))))
                            (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn
                               (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                  imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii true false false true true true true false) String.EmptyString))
                               (imported_Original_LF__DOT__Imp_LF_Imp_AId
                                  (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string
                                     imported_String_EmptyString imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))))
                         imported_Original_LF__DOT__Imp_LF_Imp_CSkip)
                      imported_Original_LF__DOT__Imp_LF_Imp_CSkip))
                (imported_Original_LF__DOT__Imp_LF_Imp_CAsgn
                   (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                      imported_String_String (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))
                   (imported_Original_LF__DOT__Imp_LF_Imp_AId
                      (@StringOptimizations.imported_string imported_bool imported_true imported_false imported_Ascii_ascii imported_Ascii_Ascii imported_String_string imported_String_EmptyString
                         imported_String_String (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))))))) := Imported.Original_LF__DOT__ImpParser_LF_ImpParser_eg2.
Monomorphic Instance Original_LF__DOT__ImpParser_LF_ImpParser_eg2_iso : rel_iso
    (relax_Iso_Ts_Ps
       (Corelib_Init_Logic_eq_iso
          (Original_LF__DOT__ImpParser_LF_ImpParser_parse_iso
             (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                (String.String (Ascii.Ascii false true false true false false false false)
                   (String.String (Ascii.Ascii false false false false false true false false)
                      (String.String (Ascii.Ascii false false false false false true false false)
                         (String.String (Ascii.Ascii true true false false true true true false)
                            (String.String (Ascii.Ascii true true false true false true true false)
                               (String.String (Ascii.Ascii true false false true false true true false)
                                  (String.String (Ascii.Ascii false false false false true true true false)
                                     (String.String (Ascii.Ascii true true false true true true false false)
                                        (String.String (Ascii.Ascii false true false true false false false false)
                                           (String.String (Ascii.Ascii false false false false false true false false)
                                              (String.String (Ascii.Ascii false false false false false true false false)
                                                 (String.String (Ascii.Ascii false true false true true true true false)
                                                    (String.String (Ascii.Ascii false true false true true true false false)
                                                       (String.String (Ascii.Ascii true false true true true true false false)
                                                          (String.String (Ascii.Ascii false false false true true true true false)
                                                             (String.String (Ascii.Ascii false true false true false true false false)
                                                                (String.String (Ascii.Ascii true false false true true true true false)
                                                                   (String.String (Ascii.Ascii false true false true false true false false)
                                                                      (String.String (Ascii.Ascii false false false true false true false false)
                                                                         (String.String (Ascii.Ascii false false false true true true true false)
                                                                            (String.String (Ascii.Ascii false true false true false true false false)
                                                                               (String.String (Ascii.Ascii false false false true true true true false)
                                                                                  (String.String (Ascii.Ascii true false false true false true false false)
                                                                                     (String.String (Ascii.Ascii true true false true true true false false)
                                                                                        (String.String (Ascii.Ascii false true false true false false false false)
                                                                                           (String.String (Ascii.Ascii false false false false false true false false)
                                                                                              (String.String (Ascii.Ascii false false false false false true false false)
                                                                                                 (String.String (Ascii.Ascii true true true false true true true false)
                                                                                                    (String.String (Ascii.Ascii false false false true false true true false)
                                                                                                       (String.String (Ascii.Ascii true false false true false true true false)
                                                                                                          (String.String (Ascii.Ascii false false true true false true true false)
                                                                                                             (String.String (Ascii.Ascii true false true false false true true false)
                                                                                                                (String.String (Ascii.Ascii false false false false false true false false)
                                                                                                                   (String.String (Ascii.Ascii false false false true true true true false)
                                                                                                                      (String.String (Ascii.Ascii true false true true true true false false)
                                                                                                                         (String.String (Ascii.Ascii false false false true true true true false)
                                                                                                                            (String.String (Ascii.Ascii false false false false false true false false)
                                                                                                                               (String.String
                                                                                                                                  (Ascii.Ascii false false true false false true true false)
                                                                                                                                  (String.String
                                                                                                                                     (Ascii.Ascii true true true true false true true false)
                                                                                                                                     (String.String
                                                                                                                                        (Ascii.Ascii false true false true false false false false)
                                                                                                                                        (String.String
                                                                                                                                           (Ascii.Ascii false false false false false true false false)
                                                                                                                                           (String.String
                                                                                                                                              (Ascii.Ascii false false false false false true false
                                                                                                                                                 false)
                                                                                                                                              (String.String
                                                                                                                                                 (Ascii.Ascii false false false false false true false
                                                                                                                                                    false)
                                                                                                                                                 (String.String
                                                                                                                                                    (Ascii.Ascii false false false false false true
                                                                                                                                                       false false)
                                                                                                                                                    (String.String
                                                                                                                                                       (Ascii.Ascii true false false true false true
                                                                                                                                                          true false)
                                                                                                                                                       (String.String
                                                                                                                                                          (Ascii.Ascii false true true false false true
                                                                                                                                                             true false)
                                                                                                                                                          (String.String
                                                                                                                                                             (Ascii.Ascii false false false false false
                                                                                                                                                                true false false)
                                                                                                                                                             (String.String
                                                                                                                                                                (Ascii.Ascii false false false true
                                                                                                                                                                   false true false false)
                                                                                                                                                                (String.String
                                                                                                                                                                   (Ascii.Ascii false true false true
                                                                                                                                                                      true true true false)
                                                                                                                                                                   (String.String
                                                                                                                                                                      (Ascii.Ascii false false false
                                                                                                                                                                         false false true false false)
                                                                                                                                                                      (String.String
                                                                                                                                                                         (Ascii.Ascii false false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                         (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          false false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          false false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          false true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true false true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          false true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false false
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true true
                                                                                                                                                                          true false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false true
                                                                                                                                                                          false false true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true false false false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false true true true true
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii true false true
                                                                                                                                                                          true true true false false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false true false
                                                                                                                                                                          true true true true false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false)
                                                                                                                                                                          (String.String
                                                                                                                                                                          (Ascii.Ascii false false
                                                                                                                                                                          false false false true false
                                                                                                                                                                          false) String.EmptyString)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
          (Original_LF__DOT__ImpParser_LF_ImpParser_SomeE_iso
             (Original_LF__DOT__Imp_LF_Imp_CSeq_iso Original_LF__DOT__Imp_LF_Imp_CSkip_iso
                (Original_LF__DOT__Imp_LF_Imp_CSeq_iso
                   (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso
                      (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                         (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString))
                      (Original_LF__DOT__Imp_LF_Imp_AMult_iso
                         (Original_LF__DOT__Imp_LF_Imp_AMult_iso
                            (Original_LF__DOT__Imp_LF_Imp_AId_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                            (Original_LF__DOT__Imp_LF_Imp_AId_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii true false false true true true true false) String.EmptyString))))
                         (Original_LF__DOT__Imp_LF_Imp_AMult_iso
                            (Original_LF__DOT__Imp_LF_Imp_AId_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                            (Original_LF__DOT__Imp_LF_Imp_AId_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))))))
                   (Original_LF__DOT__Imp_LF_Imp_CSeq_iso
                      (Original_LF__DOT__Imp_LF_Imp_CWhile_iso
                         (Original_LF__DOT__Imp_LF_Imp_BEq_iso
                            (Original_LF__DOT__Imp_LF_Imp_AId_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                            (Original_LF__DOT__Imp_LF_Imp_AId_iso
                               (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                  (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))))
                         (Original_LF__DOT__Imp_LF_Imp_CSeq_iso
                            (Original_LF__DOT__Imp_LF_Imp_CIf_iso
                               (Original_LF__DOT__Imp_LF_Imp_BAnd_iso
                                  (Original_LF__DOT__Imp_LF_Imp_BLe_iso
                                     (Original_LF__DOT__Imp_LF_Imp_AId_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))
                                     (Original_LF__DOT__Imp_LF_Imp_AMult_iso
                                        (Original_LF__DOT__Imp_LF_Imp_AId_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))
                                        (Original_LF__DOT__Imp_LF_Imp_AId_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))))
                                  (Original_LF__DOT__Imp_LF_Imp_BNot_iso
                                     (Original_LF__DOT__Imp_LF_Imp_BEq_iso
                                        (Original_LF__DOT__Imp_LF_Imp_AId_iso
                                           (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                              (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString)))
                                        (Original_LF__DOT__Imp_LF_Imp_ANum_iso (S_iso (S_iso _0_iso))))))
                               (Original_LF__DOT__Imp_LF_Imp_CSeq_iso
                                  (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso
                                     (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                        (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))
                                     (Original_LF__DOT__Imp_LF_Imp_AId_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString))))
                                  (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso
                                     (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                        (String.String (Ascii.Ascii true false false true true true true false) String.EmptyString))
                                     (Original_LF__DOT__Imp_LF_Imp_AId_iso
                                        (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                                           (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString)))))
                               Original_LF__DOT__Imp_LF_Imp_CSkip_iso)
                            Original_LF__DOT__Imp_LF_Imp_CSkip_iso))
                      (Original_LF__DOT__Imp_LF_Imp_CAsgn_iso
                         (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                            (String.String (Ascii.Ascii false false false true true true true false) String.EmptyString))
                         (Original_LF__DOT__Imp_LF_Imp_AId_iso
                            (StringOptimizations.imported_string_iso true_iso false_iso Ascii_Ascii_iso String_EmptyString_iso String_String_iso
                               (String.String (Ascii.Ascii false true false true true true true false) String.EmptyString))))))))))
    Original.LF_DOT_ImpParser.LF.ImpParser.eg2 imported_Original_LF__DOT__ImpParser_LF_ImpParser_eg2.
Admitted.
Instance: KnownConstant Original.LF_DOT_ImpParser.LF.ImpParser.eg2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__ImpParser_LF_ImpParser_eg2 := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_ImpParser.LF.ImpParser.eg2 Original_LF__DOT__ImpParser_LF_ImpParser_eg2_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_ImpParser.LF.ImpParser.eg2 Imported.Original_LF__DOT__ImpParser_LF_ImpParser_eg2 Original_LF__DOT__ImpParser_LF_ImpParser_eg2_iso := {}.