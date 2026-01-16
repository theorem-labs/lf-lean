From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_peanoU_nat__U_nat__add__iso.
From IsomorphismChecker Require Isomorphisms.U_peanoU_nat__U_nat__add__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.U_peanoU_nat__U_nat__add__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_peanoU_nat__U_nat__add__iso.imported_PeanoNat_Nat_add Isomorphisms.U_peanoU_nat__U_nat__add__iso.PeanoNat_Nat_add_iso ].

Module Checker (Import args : Args) <: Interface.U_peanoU_nat__U_nat__add__iso.Interface args
  with Definition imported_PeanoNat_Nat_add := Imported.PeanoNat_Nat_add.

Definition imported_PeanoNat_Nat_add := Isomorphisms.U_peanoU_nat__U_nat__add__iso.imported_PeanoNat_Nat_add.
Definition PeanoNat_Nat_add_iso := Isomorphisms.U_peanoU_nat__U_nat__add__iso.PeanoNat_Nat_add_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions PeanoNat_Nat_add_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.