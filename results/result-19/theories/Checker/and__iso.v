From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.and__iso.
From IsomorphismChecker Require Isomorphisms.and__iso.

Module Type Args <: Interface.and__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.and__iso.imported_and Isomorphisms.and__iso.and_iso ].

Module Checker (Import args : Args) <: Interface.and__iso.Interface args
  with Definition imported_and := Imported.MyAnd.

Definition imported_and := Isomorphisms.and__iso.imported_and.
Definition and_iso := Isomorphisms.and__iso.and_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions and_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.