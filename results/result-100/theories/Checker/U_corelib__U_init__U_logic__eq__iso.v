From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_corelib__U_init__U_logic__eq__iso.
From IsomorphismChecker Require Isomorphisms.U_corelib__U_init__U_logic__eq__iso.
From IsomorphismChecker Require Checker.U_true__iso.

Module Type Args <: Interface.U_corelib__U_init__U_logic__eq__iso.Args := Checker.U_true__iso.Args <+ Checker.U_true__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_corelib__U_init__U_logic__eq__iso.imported_Corelib_Init_Logic_eq Isomorphisms.U_corelib__U_init__U_logic__eq__iso.Corelib_Init_Logic_eq_iso ].
#[global] Strategy -1 [ Isomorphisms.U_corelib__U_init__U_logic__eq__iso__U_prop.imported_Corelib_Init_Logic_eq_Prop Isomorphisms.U_corelib__U_init__U_logic__eq__iso__U_prop.Corelib_Init_Logic_eq_iso_Prop ].

Module Checker (Import args : Args) <: Interface.U_corelib__U_init__U_logic__eq__iso.Interface args
  with Definition imported_Corelib_Init_Logic_eq := (@Imported.Corelib_Init_Logic_eq)
  with Definition imported_Corelib_Init_Logic_eq_Prop := (@Imported.Corelib_Init_Logic_eq_Prop).

Definition imported_Corelib_Init_Logic_eq := Isomorphisms.U_corelib__U_init__U_logic__eq__iso.imported_Corelib_Init_Logic_eq.
Definition Corelib_Init_Logic_eq_iso := Isomorphisms.U_corelib__U_init__U_logic__eq__iso.Corelib_Init_Logic_eq_iso.
Definition imported_Corelib_Init_Logic_eq_Prop := Isomorphisms.U_corelib__U_init__U_logic__eq__iso__U_prop.imported_Corelib_Init_Logic_eq_Prop.
Definition Corelib_Init_Logic_eq_iso_Prop := Isomorphisms.U_corelib__U_init__U_logic__eq__iso__U_prop.Corelib_Init_Logic_eq_iso_Prop.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Corelib_Init_Logic_eq_iso.
idtac "</PrintAssumptions>".
Abort.
End __.
Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Corelib_Init_Logic_eq_iso_Prop.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.