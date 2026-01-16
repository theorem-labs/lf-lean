From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.U_nat__mul__iso.
From IsomorphismChecker Require Isomorphisms.U_nat__mul__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.U_nat__mul__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.U_nat__mul__iso.imported_Nat_mul Isomorphisms.U_nat__mul__iso.Nat_mul_iso ].

Module Checker (Import args : Args) <: Interface.U_nat__mul__iso.Interface args
  with Definition imported_Nat_mul := Imported.Nat_mul.

Definition imported_Nat_mul := Isomorphisms.U_nat__mul__iso.imported_Nat_mul.
Definition Nat_mul_iso := Isomorphisms.U_nat__mul__iso.Nat_mul_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions Nat_mul_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.