From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.le__iso.
From IsomorphismChecker Require Isomorphisms.le__iso.
From IsomorphismChecker Require Checker.nat__iso.

Module Type Args <: Interface.le__iso.Args := Checker.nat__iso.Args <+ Checker.nat__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.le__iso.imported_le Isomorphisms.le__iso.le_iso ].

Module Checker (Import args : Args) <: Interface.le__iso.Interface args
  with Definition imported_le := Imported.le.

Definition imported_le := Isomorphisms.le__iso.imported_le.
Definition le_iso := Isomorphisms.le__iso.le_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions le_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.