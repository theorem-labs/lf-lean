From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.list__iso.
From IsomorphismChecker Require Isomorphisms.list__iso.

Module Type Args <: Interface.list__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.list__iso.imported_list Isomorphisms.list__iso.list_iso ].

Module Checker (Import args : Args) <: Interface.list__iso.Interface args
  with Definition imported_list := Imported.list.

Definition imported_list := Isomorphisms.list__iso.imported_list.
Definition list_iso := Isomorphisms.list__iso.list_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions list_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.