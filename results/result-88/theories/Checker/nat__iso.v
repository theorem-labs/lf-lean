From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.nat__iso.
From IsomorphismChecker Require Isomorphisms.nat__iso.

Module Type Args <: Interface.nat__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.nat__iso.imported_nat Isomorphisms.nat__iso.nat_iso ].

Module Checker (Import args : Args) <: Interface.nat__iso.Interface args
  with Definition imported_nat := Imported.nat.

Definition imported_nat := Isomorphisms.nat__iso.imported_nat.
Definition nat_iso := Isomorphisms.nat__iso.nat_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions nat_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.