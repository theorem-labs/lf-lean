From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.__0__iso.
From IsomorphismChecker Require Isomorphisms.__0__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.__0__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.__0__iso.imported_0 Isomorphisms.__0__iso._0_iso ].

Module Checker (Import args : Args) <: Interface.__0__iso.Interface args
  with Definition imported_0 := Imported.nat_O.

Definition imported_0 := Isomorphisms.__0__iso.imported_0.
Definition _0_iso := Isomorphisms.__0__iso._0_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions _0_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.