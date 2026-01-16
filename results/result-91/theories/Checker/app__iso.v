From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.app__iso.
From IsomorphismChecker Require Isomorphisms.app__iso.
From IsomorphismChecker Require Checker.list__iso.

Module Type Args <: Interface.app__iso.Args := Checker.list__iso.Args <+ Checker.list__iso.Checker.

#[global] Strategy -1 [ Isomorphisms.app__iso.imported_app Isomorphisms.app__iso.app_iso ].

Module Checker (Import args : Args) <: Interface.app__iso.Interface args
  with Definition imported_app := Imported.app.

Definition imported_app := Isomorphisms.app__iso.imported_app.
Definition app_iso := Isomorphisms.app__iso.app_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions app_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.