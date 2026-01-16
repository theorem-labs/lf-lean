From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.ge__iso.
From IsomorphismChecker Require Isomorphisms.ge__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.ge__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.ge__iso.imported_ge Isomorphisms.ge__iso.ge_iso ].

Module Checker (Import args : Args) <: Interface.ge__iso.Interface args
  with Definition imported_ge := Imported.ge.

Definition imported_ge := Isomorphisms.ge__iso.imported_ge.
Definition ge_iso := Isomorphisms.ge__iso.ge_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions ge_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.