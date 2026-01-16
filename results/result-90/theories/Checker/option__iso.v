From IsomorphismChecker Require PermittedAxiomPrinting.
From IsomorphismChecker Require Imported.

From IsomorphismChecker Require Interface.option__iso.
From IsomorphismChecker Require Isomorphisms.option__iso.

Module Type Args <: Interface.option__iso.Args. End Args.

#[global] Strategy -1 [ Isomorphisms.option__iso.imported_option Isomorphisms.option__iso.option_iso ].

Module Checker (Import args : Args) <: Interface.option__iso.Interface args
  with Definition imported_option := Imported.option.

Definition imported_option := Isomorphisms.option__iso.imported_option.
Definition option_iso := Isomorphisms.option__iso.option_iso.

Section __.
#[local] Set Warnings "-masking-absolute-name".
Import PermittedAxiomPrinting.
Set Printing All.
Set Printing Fully Qualified.
Set Printing Depth 10000000000.
Set Printing Width 2000.
Goal True. idtac "<PrintAssumptions>".
Print Assumptions option_iso.
idtac "</PrintAssumptions>".
Abort.
End __.


End Checker.