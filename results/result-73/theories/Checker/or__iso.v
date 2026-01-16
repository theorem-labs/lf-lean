From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.or__iso.
From IsomorphismChecker Require Isomorphisms.or__iso.

Module Type Args <: Interface.or__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.or__iso.imported_or Isomorphisms.or__iso.or_iso ].

Module Checker (Import args : Args) <: Interface.or__iso.Interface args
  with Definition imported_or := Imported.or.

Definition imported_or := Isomorphisms.or__iso.imported_or.
Definition or_iso := Isomorphisms.or__iso.or_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions or_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.