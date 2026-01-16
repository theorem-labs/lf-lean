From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__napp__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__pumping____constant__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_logic__not__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
  imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x1 x0 ->
  imported_le (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x0) (imported_Original_LF__DOT__Poly_LF_Poly_length x1) ->
  imported_ex
    (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x =>
     imported_ex
       (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x =>
        imported_ex
          (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x =>
           imported_and (imported_Corelib_Init_Logic_eq x1 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1)))
             (imported_and (imported_Corelib_Init_Logic_eq H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x) -> imported_False)
                (forall a' : imported_nat,
                 imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                   (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x0))))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping.
Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : rel_iso (Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso hx) x3 x4) (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x5 x6) (x7 : Original.LF_DOT_IndProp.LF.IndProp.exp_match x5 x3) (x8 : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x6 x4),
  rel_iso
    {|
      to := Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0;
      from := from (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0);
      to_from := fun x : imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x6 x4 => to_from (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0) x;
      from_to := fun x : Original.LF_DOT_IndProp.LF.IndProp.exp_match x5 x3 => seq_p_of_t (from_to (Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso hx1 hx0) x)
    |} x7 x8 ->
  forall (x9 : Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3 <= Original.LF_DOT_Poly.LF.Poly.length x5)
    (x10 : imported_le (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4) (imported_Original_LF__DOT__Poly_LF_Poly_length x6)),
  rel_iso
    {|
      to := le_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1);
      from := from (le_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1));
      to_from :=
        fun x : imported_le (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x4) (imported_Original_LF__DOT__Poly_LF_Poly_length x6) =>
        to_from (le_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1)) x;
      from_to :=
        fun x : Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x3 <= Original.LF_DOT_Poly.LF.Poly.length x5 =>
        seq_p_of_t (from_to (le_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso hx0) (Original_LF__DOT__Poly_LF_Poly_length_iso hx1)) x)
    |} x9 x10 ->
  rel_iso
    {|
      to :=
        ex_iso
          (fun s1 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
           exists s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
             x5 = Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
             s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
             (forall m : nat,
              Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
          (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
           imported_ex
             (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_ex
                (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1)))
                   (imported_and (imported_Corelib_Init_Logic_eq H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (forall a' : imported_nat,
                       imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                         (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x4)))))
          (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
           ex_iso
             (fun s2 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
              exists s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                (forall m : nat,
                 Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_ex
                (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app H H0)))
                   (imported_and (imported_Corelib_Init_Logic_eq H (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (forall a' : imported_nat,
                       imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                         (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H) H0)) x4))))
             (fun (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx5 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x13 x14) =>
              ex_iso
                (fun s3 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                 x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app x13 s3) /\
                 x13 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                 (forall m : nat,
                  Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m x13) s3)) x3))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app x14 H)))
                   (imported_and (imported_Corelib_Init_Logic_eq x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (forall a' : imported_nat,
                       imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                         (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) H)) x4)))
                (fun (x15 : Original.LF_DOT_Poly.LF.Poly.list x1) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx6 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x15 x16) =>
                 and_iso (Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso hx5 hx6)))
                   (and_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx5 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) False_iso)
                      (IsoForall
                         (fun a : nat =>
                          Original.LF_DOT_IndProp.LF.IndProp.exp_match
                            (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp a x13) x15)) x3)
                         (fun a' : imported_nat =>
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) x16)) x4)
                         (fun (x17 : nat) (x18 : imported_nat) (hx7 : rel_iso nat_iso x17 x18) =>
                          Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso
                            (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx7 hx5) hx6)) hx0))))));
      from :=
        from
          (ex_iso
             (fun s1 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
              exists s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                x5 = Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                (forall m : nat,
                 Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_ex
                (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1)))
                      (imported_and (imported_Corelib_Init_Logic_eq H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                         (forall a' : imported_nat,
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x4)))))
             (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
              ex_iso
                (fun s2 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                 exists s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                   x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                   s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                   (forall m : nat,
                    Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app H H0)))
                      (imported_and (imported_Corelib_Init_Logic_eq H (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                         (forall a' : imported_nat,
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H) H0)) x4))))
                (fun (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx5 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x13 x14) =>
                 ex_iso
                   (fun s3 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                    x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app x13 s3) /\
                    x13 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                    (forall m : nat,
                     Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m x13) s3))
                       x3))
                   (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app x14 H)))
                      (imported_and (imported_Corelib_Init_Logic_eq x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                         (forall a' : imported_nat,
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) H)) x4)))
                   (fun (x15 : Original.LF_DOT_Poly.LF.Poly.list x1) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx6 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x15 x16) =>
                    and_iso (Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso hx5 hx6)))
                      (and_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx5 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) False_iso)
                         (IsoForall
                            (fun a : nat =>
                             Original.LF_DOT_IndProp.LF.IndProp.exp_match
                               (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp a x13) x15)) x3)
                            (fun a' : imported_nat =>
                             imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                               (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) x16))
                               x4)
                            (fun (x17 : nat) (x18 : imported_nat) (hx7 : rel_iso nat_iso x17 x18) =>
                             Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso
                               (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx7 hx5) hx6)) hx0)))))));
      to_from :=
        fun
          x : imported_ex
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_ex
                      (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                       imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1)))
                         (imported_and (imported_Corelib_Init_Logic_eq H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                            (forall a' : imported_nat,
                             imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                               (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x4))))) =>
        to_from
          (ex_iso
             (fun s1 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
              exists s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                x5 = Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                (forall m : nat,
                 Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_ex
                (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1)))
                      (imported_and (imported_Corelib_Init_Logic_eq H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                         (forall a' : imported_nat,
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x4)))))
             (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
              ex_iso
                (fun s2 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                 exists s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                   x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                   s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                   (forall m : nat,
                    Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app H H0)))
                      (imported_and (imported_Corelib_Init_Logic_eq H (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                         (forall a' : imported_nat,
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H) H0)) x4))))
                (fun (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx5 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x13 x14) =>
                 ex_iso
                   (fun s3 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                    x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app x13 s3) /\
                    x13 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                    (forall m : nat,
                     Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m x13) s3))
                       x3))
                   (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app x14 H)))
                      (imported_and (imported_Corelib_Init_Logic_eq x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                         (forall a' : imported_nat,
                          imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                            (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) H)) x4)))
                   (fun (x15 : Original.LF_DOT_Poly.LF.Poly.list x1) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx6 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x15 x16) =>
                    and_iso (Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso hx5 hx6)))
                      (and_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx5 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) False_iso)
                         (IsoForall
                            (fun a : nat =>
                             Original.LF_DOT_IndProp.LF.IndProp.exp_match
                               (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp a x13) x15)) x3)
                            (fun a' : imported_nat =>
                             imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                               (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) x16))
                               x4)
                            (fun (x17 : nat) (x18 : imported_nat) (hx7 : rel_iso nat_iso x17 x18) =>
                             Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso
                               (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx7 hx5) hx6)) hx0)))))))
          x;
      from_to :=
        fun
          x : exists y s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                x5 = Original.LF_DOT_Poly.LF.Poly.app y (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                (forall m : nat,
                 Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app y (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3) =>
        seq_p_of_t
          (from_to
             (ex_iso
                (fun s1 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                 exists s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                   x5 = Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                   s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                   (forall m : nat,
                    Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app s1 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3)) x3))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_ex
                   (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_ex
                      (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                       imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app H0 H1)))
                         (imported_and (imported_Corelib_Init_Logic_eq H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                            (forall a' : imported_nat,
                             imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                               (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x4)))))
                (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx4 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x11 x12) =>
                 ex_iso
                   (fun s2 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                    exists s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                      x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app s2 s3) /\
                      s2 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                      (forall m : nat,
                       Original.LF_DOT_IndProp.LF.IndProp.exp_match (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m s2) s3))
                         x3))
                   (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                    imported_ex
                      (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                       imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app H H0)))
                         (imported_and (imported_Corelib_Init_Logic_eq H (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                            (forall a' : imported_nat,
                             imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                               (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H) H0)) x4))))
                   (fun (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx5 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x13 x14) =>
                    ex_iso
                      (fun s3 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                       x5 = Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app x13 s3) /\
                       x13 <> Original.LF_DOT_Poly.LF.Poly.nil /\
                       (forall m : nat,
                        Original.LF_DOT_IndProp.LF.IndProp.exp_match
                          (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp m x13) s3)) x3))
                      (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                       imported_and (imported_Corelib_Init_Logic_eq x6 (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app x14 H)))
                         (imported_and (imported_Corelib_Init_Logic_eq x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                            (forall a' : imported_nat,
                             imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                               (imported_Original_LF__DOT__Poly_LF_Poly_app x12 (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) H)) x4)))
                      (fun (x15 : Original.LF_DOT_Poly.LF.Poly.list x1) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_list x2) (hx6 : rel_iso (Original_LF__DOT__Poly_LF_Poly_list_iso hx) x15 x16) =>
                       and_iso (Corelib_Init_Logic_eq_iso hx1 (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso hx5 hx6)))
                         (and_iso (IsoArrow (Corelib_Init_Logic_eq_iso hx5 (Original_LF__DOT__Poly_LF_Poly_nil_iso hx)) False_iso)
                            (IsoForall
                               (fun a : nat =>
                                Original.LF_DOT_IndProp.LF.IndProp.exp_match
                                  (Original.LF_DOT_Poly.LF.Poly.app x11 (Original.LF_DOT_Poly.LF.Poly.app (Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp a x13) x15)) x3)
                               (fun a' : imported_nat =>
                                imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                                  (imported_Original_LF__DOT__Poly_LF_Poly_app x12
                                     (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' x14) x16))
                                  x4)
                               (fun (x17 : nat) (x18 : imported_nat) (hx7 : rel_iso nat_iso x17 x18) =>
                                Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso
                                  (Original_LF__DOT__Poly_LF_Poly_app_iso hx4 (Original_LF__DOT__Poly_LF_Poly_app_iso (Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso hx7 hx5) hx6)) hx0)))))))
             x)
    |} (Original.LF_DOT_IndProp.LF.IndProp.Pumping.weak_pumping x1 x3 x5 x7 x9) (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.weak_pumping := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.weak_pumping Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.weak_pumping Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping Original_LF__DOT__IndProp_LF_IndProp_Pumping_weak__pumping_iso := {}.