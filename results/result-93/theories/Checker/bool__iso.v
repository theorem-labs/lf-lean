From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.bool__iso.
From IsomorphismChecker Require Isomorphisms.bool__iso.

Module Type Args <: Interface.bool__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.bool__iso.imported_bool Isomorphisms.bool__iso.bool_iso ].

Module Checker (Import args : Args) <: Interface.bool__iso.Interface args
  with Definition imported_bool := Imported.mybool.

Definition imported_bool := Isomorphisms.bool__iso.imported_bool.
Definition bool_iso := Isomorphisms.bool__iso.bool_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions bool_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.