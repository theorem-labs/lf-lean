From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.prod__iso.
From IsomorphismChecker Require Isomorphisms.prod__iso.

Module Type Args <: Interface.prod__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.prod__iso.imported_prod Isomorphisms.prod__iso.prod_iso ].

Module Checker (Import args : Args) <: Interface.prod__iso.Interface args
  with Definition imported_prod := Imported.prod.

Definition imported_prod := Isomorphisms.prod__iso.imported_prod.
Definition prod_iso := Isomorphisms.prod__iso.prod_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions prod_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.