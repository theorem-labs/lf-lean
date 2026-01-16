From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.unit__iso.
From IsomorphismChecker Require Isomorphisms.unit__iso.

Module Type Args <: Interface.unit__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.unit__iso.imported_unit Isomorphisms.unit__iso.unit_iso ].

Module Checker (Import args : Args) <: Interface.unit__iso.Interface args
  with Definition imported_unit := Imported.unit.

Definition imported_unit := Isomorphisms.unit__iso.imported_unit.
Definition unit_iso := Isomorphisms.unit__iso.unit_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions unit_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.