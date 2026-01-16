From IsomorphismChecker Require Import AutomationDefinitions IsomorphismStatementAutomationDefinitions EqualityLemmas IsomorphismDefinitions.
Import IsoEq.
From LeanImport Require Import Lean.
#[local] Unset Universe Polymorphism.
#[local] Set Implicit Arguments.
From IsomorphismChecker Require Original Imported.
(* Print Imported. *)
#[local] Set Printing Coercions.


From IsomorphismChecker Require Export Isomorphisms.U_corelib__U_init__U_logic__eq__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__napp__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__U_pumping__pumping____constant__iso Isomorphisms.U_original__U2_lf_dot_U_indU_prop__U2_lf__U_indU_prop__exp____match__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__app__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__length__iso Isomorphisms.U_original__U2_lf_dot_U_poly__U2_lf__U_poly__nil__iso Isomorphisms.U_logic__not__iso Isomorphisms.U_nat__add__iso Isomorphisms.and__iso Isomorphisms.ex__iso Isomorphisms.le__iso.

Definition imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping : forall (x : Type) (x0 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x) (x1 : imported_Original_LF__DOT__Poly_LF_Poly_list x),
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
                (imported_and
                   (imported_le (imported_Nat_add (imported_Original_LF__DOT__Poly_LF_Poly_length H) (imported_Original_LF__DOT__Poly_LF_Poly_length H0))
                      (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x0))
                   (forall a' : imported_nat,
                    imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match
                      (imported_Original_LF__DOT__Poly_LF_Poly_app H (imported_Original_LF__DOT__Poly_LF_Poly_app (imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp a' H0) H1)) x0)))))) := Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping.
Instance Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping_iso : forall (x1 x2 : Type) (hx : Iso x1 x2) (x3 : Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (x4 : imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2)
    (hx0 : @rel_iso (Original.LF_DOT_IndProp.LF.IndProp.reg_exp x1) (imported_Original_LF__DOT__IndProp_LF_IndProp_reg__exp x2) (@Original_LF__DOT__IndProp_LF_IndProp_reg__exp_iso x1 x2 hx) x3 x4)
    (x5 : Original.LF_DOT_Poly.LF.Poly.list x1) (x6 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
    (hx1 : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x5 x6)
    (x7 : @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1 x5 x3) (x8 : @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 x6 x4),
  @rel_iso (@Original.LF_DOT_IndProp.LF.IndProp.exp_match x1 x5 x3) (@imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 x6 x4)
    (@relax_Iso_Ts_Ps (@Original.LF_DOT_IndProp.LF.IndProp.exp_match x1 x5 x3) (@imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2 x6 x4)
       (@Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso x1 x2 hx x5 x6 hx1 x3 x4 hx0))
    x7 x8 ->
  forall (x9 : @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 <= @Original.LF_DOT_Poly.LF.Poly.length x1 x5)
    (x10 : imported_le (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x6)),
  @rel_iso (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 <= @Original.LF_DOT_Poly.LF.Poly.length x1 x5)
    (imported_le (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x6))
    (@relax_Iso_Ts_Ps (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 <= @Original.LF_DOT_Poly.LF.Poly.length x1 x5)
       (imported_le (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x6))
       (@le_iso (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3) (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4)
          (@Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso x1 x2 hx x3 x4 hx0) (@Original.LF_DOT_Poly.LF.Poly.length x1 x5) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x6)
          (@Original_LF__DOT__Poly_LF_Poly_length_iso x1 x2 hx x5 x6 hx1)))
    x9 x10 ->
  @rel_iso
    (exists s1 s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
       x5 = @Original.LF_DOT_Poly.LF.Poly.app x1 s1 (@Original.LF_DOT_Poly.LF.Poly.app x1 s2 s3) /\
       s2 <> @Original.LF_DOT_Poly.LF.Poly.nil x1 /\
       @Original.LF_DOT_Poly.LF.Poly.length x1 s1 + @Original.LF_DOT_Poly.LF.Poly.length x1 s2 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
       (forall m : nat,
        @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1 (@Original.LF_DOT_Poly.LF.Poly.app x1 s1 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m s2) s3))
          x3))
    (@imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
       (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
        @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
          (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
           @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
             (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              imported_and
                (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x6
                   (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H0 H1)))
                (imported_and (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                   (imported_and
                      (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H0))
                         (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                      (forall a' : imported_nat,
                       @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                         (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' H0) H1))
                         x4)))))))
    (@relax_Iso_Ts_Ps
       (exists y s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
          x5 = @Original.LF_DOT_Poly.LF.Poly.app x1 y (@Original.LF_DOT_Poly.LF.Poly.app x1 s2 s3) /\
          s2 <> @Original.LF_DOT_Poly.LF.Poly.nil x1 /\
          @Original.LF_DOT_Poly.LF.Poly.length x1 y + @Original.LF_DOT_Poly.LF.Poly.length x1 s2 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
          (forall m : nat,
           @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
             (@Original.LF_DOT_Poly.LF.Poly.app x1 y (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m s2) s3)) x3))
       (@imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
          (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
           @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
             (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
                (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and
                   (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x6
                      (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H0 H1)))
                   (imported_and (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (imported_and
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H0))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' H0) H1))
                            x4)))))))
       (@ex_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx)
          (fun s1 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
           exists s2 s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
             x5 = @Original.LF_DOT_Poly.LF.Poly.app x1 s1 (@Original.LF_DOT_Poly.LF.Poly.app x1 s2 s3) /\
             s2 <> @Original.LF_DOT_Poly.LF.Poly.nil x1 /\
             @Original.LF_DOT_Poly.LF.Poly.length x1 s1 + @Original.LF_DOT_Poly.LF.Poly.length x1 s2 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
             (forall m : nat,
              @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                (@Original.LF_DOT_Poly.LF.Poly.app x1 s1 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m s2) s3)) x3))
          (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
           @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
             (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
                (fun H1 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and
                   (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x6
                      (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H0 H1)))
                   (imported_and (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) H0 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (imported_and
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H0))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' H0) H1))
                            x4))))))
          (fun (x11 : Original.LF_DOT_Poly.LF.Poly.list x1) (x12 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
             (hx4 : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x11 x12) =>
           @ex_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx)
             (fun s2 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
              exists s3 : Original.LF_DOT_Poly.LF.Poly.list x1,
                x5 = @Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 s2 s3) /\
                s2 <> @Original.LF_DOT_Poly.LF.Poly.nil x1 /\
                @Original.LF_DOT_Poly.LF.Poly.length x1 x11 + @Original.LF_DOT_Poly.LF.Poly.length x1 s2 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
                (forall m : nat,
                 @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                   (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m s2) s3)) x3))
             (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
              @imported_ex (imported_Original_LF__DOT__Poly_LF_Poly_list x2)
                (fun H0 : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and
                   (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x6
                      (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12 (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 H H0)))
                   (imported_and (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) H (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (imported_and
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 H))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' H) H0))
                            x4)))))
             (fun (x13 : Original.LF_DOT_Poly.LF.Poly.list x1) (x14 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
                (hx5 : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x13 x14) =>
              @ex_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx)
                (fun s3 : Original.LF_DOT_Poly.LF.Poly.list x1 =>
                 x5 = @Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 x13 s3) /\
                 x13 <> @Original.LF_DOT_Poly.LF.Poly.nil x1 /\
                 @Original.LF_DOT_Poly.LF.Poly.length x1 x11 + @Original.LF_DOT_Poly.LF.Poly.length x1 x13 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
                 (forall m : nat,
                  @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                    (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m x13) s3)) x3))
                (fun H : imported_Original_LF__DOT__Poly_LF_Poly_list x2 =>
                 imported_and
                   (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x6
                      (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12 (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x14 H)))
                   (imported_and (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (imported_and
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x14))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' x14) H))
                            x4))))
                (fun (x15 : Original.LF_DOT_Poly.LF.Poly.list x1) (x16 : imported_Original_LF__DOT__Poly_LF_Poly_list x2)
                   (hx6 : @rel_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x15 x16) =>
                 @and_iso (x5 = @Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 x13 x15))
                   (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x6
                      (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12 (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x14 x16)))
                   (@Corelib_Init_Logic_eq_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x5 x6 hx1
                      (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 x13 x15))
                      (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12 (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x14 x16))
                      (@Original_LF__DOT__Poly_LF_Poly_app_iso x1 x2 hx x11 x12 hx4 (@Original.LF_DOT_Poly.LF.Poly.app x1 x13 x15) (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x14 x16)
                         (@Original_LF__DOT__Poly_LF_Poly_app_iso x1 x2 hx x13 x14 hx5 x15 x16 hx6)))
                   (x13 <> @Original.LF_DOT_Poly.LF.Poly.nil x1 /\
                    @Original.LF_DOT_Poly.LF.Poly.length x1 x11 + @Original.LF_DOT_Poly.LF.Poly.length x1 x13 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
                    (forall m : nat,
                     @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                       (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m x13) x15)) x3))
                   (imported_and (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (imported_and
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x14))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' x14) x16))
                            x4)))
                   (@and_iso (x13 <> @Original.LF_DOT_Poly.LF.Poly.nil x1)
                      (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) -> imported_False)
                      (@IsoArrow (x13 = @Original.LF_DOT_Poly.LF.Poly.nil x1)
                         (@imported_Corelib_Init_Logic_eq (imported_Original_LF__DOT__Poly_LF_Poly_list x2) x14 (imported_Original_LF__DOT__Poly_LF_Poly_nil x2))
                         (@Corelib_Init_Logic_eq_iso (Original.LF_DOT_Poly.LF.Poly.list x1) (imported_Original_LF__DOT__Poly_LF_Poly_list x2) (@Original_LF__DOT__Poly_LF_Poly_list_iso x1 x2 hx) x13
                            x14 hx5 (@Original.LF_DOT_Poly.LF.Poly.nil x1) (imported_Original_LF__DOT__Poly_LF_Poly_nil x2) (@Original_LF__DOT__Poly_LF_Poly_nil_iso x1 x2 hx))
                         False imported_False False_iso)
                      (@Original.LF_DOT_Poly.LF.Poly.length x1 x11 + @Original.LF_DOT_Poly.LF.Poly.length x1 x13 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3 /\
                       (forall m : nat,
                        @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                          (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m x13) x15)) x3))
                      (imported_and
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x14))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' x14) x16))
                            x4))
                      (@and_iso (@Original.LF_DOT_Poly.LF.Poly.length x1 x11 + @Original.LF_DOT_Poly.LF.Poly.length x1 x13 <= @Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3)
                         (imported_le (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x14))
                            (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4))
                         (@le_iso (@Original.LF_DOT_Poly.LF.Poly.length x1 x11 + @Original.LF_DOT_Poly.LF.Poly.length x1 x13)
                            (imported_Nat_add (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x14))
                            (@Nat_add_iso (@Original.LF_DOT_Poly.LF.Poly.length x1 x11) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x12)
                               (@Original_LF__DOT__Poly_LF_Poly_length_iso x1 x2 hx x11 x12 hx4) (@Original.LF_DOT_Poly.LF.Poly.length x1 x13) (@imported_Original_LF__DOT__Poly_LF_Poly_length x2 x14)
                               (@Original_LF__DOT__Poly_LF_Poly_length_iso x1 x2 hx x13 x14 hx5))
                            (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping_constant x1 x3) (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant x2 x4)
                            (@Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping__constant_iso x1 x2 hx x3 x4 hx0))
                         (forall m : nat,
                          @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                            (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 m x13) x15)) x3)
                         (forall a' : imported_nat,
                          @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                            (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' x14) x16))
                            x4)
                         (@IsoForall nat imported_nat nat_iso
                            (fun a : nat =>
                             @Original.LF_DOT_IndProp.LF.IndProp.exp_match x1
                               (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 a x13) x15)) x3)
                            (fun a' : imported_nat =>
                             @imported_Original_LF__DOT__IndProp_LF_IndProp_exp__match x2
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                                  (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 a' x14) x16))
                               x4)
                            (fun (x17 : nat) (x18 : imported_nat) (hx7 : @rel_iso nat imported_nat nat_iso x17 x18) =>
                             @Original_LF__DOT__IndProp_LF_IndProp_exp__match_iso x1 x2 hx
                               (@Original.LF_DOT_Poly.LF.Poly.app x1 x11 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 x17 x13) x15))
                               (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 x12
                                  (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 x18 x14) x16))
                               (@Original_LF__DOT__Poly_LF_Poly_app_iso x1 x2 hx x11 x12 hx4 (@Original.LF_DOT_Poly.LF.Poly.app x1 (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 x17 x13) x15)
                                  (@imported_Original_LF__DOT__Poly_LF_Poly_app x2 (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 x18 x14) x16)
                                  (@Original_LF__DOT__Poly_LF_Poly_app_iso x1 x2 hx (@Original.LF_DOT_IndProp.LF.IndProp.Pumping.napp x1 x17 x13)
                                     (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp x2 x18 x14) (@Original_LF__DOT__IndProp_LF_IndProp_Pumping_napp_iso x1 x2 hx x17 x18 hx7 x13 x14 hx5)
                                     x15 x16 hx6))
                               x3 x4 hx0)))))))))
    (Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping x1 x3 x5 x7 x9) (@imported_Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping x2 x4 x6 x8 x10).
Admitted.
Instance: KnownConstant Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: KnownConstant Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping := {}. (* only needed when rel_iso is typeclasses opaque *)
Instance: IsoStatementProofFor Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping_iso := {}.
Instance: IsoStatementProofBetween Original.LF_DOT_IndProp.LF.IndProp.Pumping.pumping Imported.Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping Original_LF__DOT__IndProp_LF_IndProp_Pumping_pumping_iso := {}.